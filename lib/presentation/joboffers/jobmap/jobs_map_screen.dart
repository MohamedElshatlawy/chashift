import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:marker_icon/marker_icon.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/domain/date_formatter.dart';
import 'package:shiftapp/presentation/joboffers/jobslist/jobs_list.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/main_index.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;

class MapScreen extends StatelessWidget {
  final List<JobOffer> offers;

   MapScreen({Key? key, required this.offers}) : super(key: key);

  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(offers: offers,onMapCreated: (mMapController){
          mapController=mMapController;
        },),
        Positioned(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 10),
            child: SearchPlacesWidget(onSelectPlace: (item){
              if(mapController!=null) {
                mapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(item.geometry!.location.lat, item.geometry!.location.lng),zoom: 14)));
              }

            })
          ),
        ),
      ],
    );
  }


}

class Place extends ClusterItem {
  final double latitude;
  final double longitude;
  final int id;
  final String name;
  final String title;
  Place(
      {required this.latitude,
      required this.longitude,
      required this.name,
      required this.id,
      required this.title});
  @override
  LatLng get location => LatLng(latitude, longitude);
}

class SearchPlacesWidget extends StatelessWidget {
  final Function(PlacesSearchResult) onSelectPlace;

  var selectAddress= false;

  final textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  Future<PlacesSearchResponse>  ? searchObserver ;
  final geocoding = GoogleMapsPlaces(apiKey: Config.GOOGLE_API_KEY);
  final _offersStreamController = BehaviorSubject<List<PlacesSearchResult>>();

  Stream<List<PlacesSearchResult>> get offersListStream => _offersStreamController.stream;
  fetchPlaces(String text) async {
    print('fetchPlaces ${text.isEmpty}');

    searchObserver =  geocoding.searchByText(text,language: Get.locale!.languageCode.toString(),region: 'SA');
    if(text.isEmpty){
      _offersStreamController.sink.add([]);
    }else {
      PlacesSearchResponse response = await searchObserver!;
      if(textController.text.isNotEmpty) {
        _offersStreamController.sink.add(response.results);
      }else{
        _offersStreamController.sink.add([]);
      }
      print('GeocodingResponse ${response.results.last.formattedAddress}');

    }

  }
   SearchPlacesWidget({Key? key,required this.onSelectPlace}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            style: kTextSemiBold.copyWith(fontSize: 16),
            controller: textController,
            onChanged: (t){
              if(!selectAddress) {
                print('onChanged controller ');
                fetchPlaces(t);
              }else{
                selectAddress = false ;
              }

            },
            focusNode: focusNode,
            decoration: kTextFieldDecoration.copyWith(
              suffixIcon: const Icon(Icons.search),
            )),
        Expanded(
          child: StreamBuilder<List<PlacesSearchResult>>(
              stream: offersListStream,
              builder: (context, snapshot) {
                print('onStreamBuilder ${snapshot.hasData}');
                return snapshot.data !=null && snapshot.data!.isNotEmpty?
                Container(
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: snapshot.requireData.length,
                      itemBuilder: (con,pos){
                        final item  = snapshot.requireData[pos];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              selectAddress =true ;
                                 textController.text=item.formattedAddress! ;
                                 onSelectPlace(item);
                                 _offersStreamController.sink.add([]);

                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Text(item.formattedAddress.toString(),maxLines: 2,),
                                const Divider(height: 1,color: Colors.grey,),
                                SizedBox(height: 4,)
                              ],
                            ),
                          ),
                        );
                      }),
                ):Container();
              }
          ),
        )
      ],
    );
  }
}

class MapWidget extends StatefulWidget {
  final List<JobOffer> offers;
  final Function(GoogleMapController) onMapCreated ;
  const MapWidget({Key? key,required this.offers,required this.onMapCreated}) : super(key: key);@override
  State<StatefulWidget> createState() {
   return MapWidgetState ();
  }

}

class MapWidgetState extends State<MapWidget>{

  BitmapDescriptor? markerIcon;
  PlacesSearchResult  ? selectedPlace ;
  Set<Marker> _markers = Set();
  GoogleMapController? mapController;
  late ClusterManager _manager;

  final Completer<GoogleMapController> _controller = Completer();

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(getPlaces(), _updateMarkers,
        markerBuilder: _markerBuilder);
  }


  List<Place> getPlaces() {
    final List<Place> list = [];
    widget.offers.forEach((element) {
      list.add(Place(
          latitude: element.latitude!,
          longitude: element.longtude!,
          name: DateFormatter.formatDateString(element.workingDate, 'dd/MM/yyyy','dd/MM, MMM'),
          title: element.projectName.toString(),
          id: element.id!));
    });

    return list;
  }

  void _updateMarkers(Set<Marker> markers) {
    setState(() {
      _markers = markers;
    });
  }

  void showJobDetailsSheet(JobOffer jobOffer) {
    showModalBottomSheet<void>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return JobItem(
            jobOffer,
            elevation: 0,
          );
        });
  }

  void showOffersListSheet(List<JobOffer> offers) {
    showModalBottomSheet<void>(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Center(
                child: ListJobsScreen(offers: offers),
              ),
            ),
          );
        });
  }

  void showJobsListDetailsSheet(List<int> map) {
    final List<JobOffer> offers = [];
    if (map.length == 1) {
      showJobDetailsSheet(
          widget.offers.firstWhere((element) => element.id == map.first));
    } else {
      for (var id in map) {
        offers.add(widget.offers.firstWhere((element) => element.id == id));
      }
      showOffersListSheet(offers);
    }
  }

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
          (cluster) async {
        final name = cluster.items.length > 1
            ? '${cluster.items.length} Offers'
            : cluster.items.first.name;
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          icon: cluster.items.length > 1
              ? await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null):
          await MarkerIcon.pictureAssetWithCenterText(
              assetPath: 'images/marker_rec.png',
              text: cluster.items.first.name,
              size: Size(400, 150),
              fontColor: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold),
          infoWindow:
          InfoWindow(title: cluster.items.first.title, snippet: name),
          onTap: () {
            print('---- ${cluster.count}');
            showJobsListDetailsSheet(cluster.items.map((e) => e.id).toList());
          },
          /*   icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),*/
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()
      ..color = kPrimary
      ..strokeWidth = 8
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    final Paint paint2 = Paint()..color = Colors.white;
    /* canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTRB(0, 40, 400, 400), Radius.circular(12)),
      paint1,
    );*/
//    Rect rect =  Rect.fromCenter( width : 500, height  : 80, center: Offset(size / 2, size / 2));
    //  canvas.drawRect(rect,paint1);

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;
    final Uint8List desiredMarker = await getBytesFromCanvas('Saled 3 off');

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  Future<Uint8List> getBytesFromCanvas(String text) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.grey;
    final int size = 100; //change this according to your app
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text, //you can write your own text here or take from parameter
      style: TextStyle(
          fontSize: size / 4, color: Colors.black, fontWeight: FontWeight.bold),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {

    return  GoogleMap(
      compassEnabled: true,
      mapToolbarEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      onCameraMove: _manager.onCameraMove,
      onCameraIdle: _manager.updateMap,
      onMapCreated: (controller) async {
        mapController = controller;
        _manager.setMapId(controller.mapId);
        widget.onMapCreated (mapController!);
        },
      markers: Set<Marker>.of(_markers),
      initialCameraPosition: CameraPosition(
        target: _markers.isNotEmpty
            ? _markers.first.position
            : const LatLng(24.78878, 46.6989),
        zoom: 10.0,
      ),
    );
  }

}
