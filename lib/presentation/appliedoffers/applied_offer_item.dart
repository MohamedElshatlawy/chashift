import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:koin_flutter/src/widget_extension.dart';
import 'package:shiftapp/domain/opportunities_status.dart';
import 'package:shiftapp/presentation/appliedoffers/bloc/applied_offers_bloc.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/domain/applied_offer.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/widgets/app_button.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
class AppliedOfferItemWidget extends BaseWidget {
  final AppliedOffer appliedOffers;
  Function onChangeStatus;
   AppliedOfferItemWidget({Key? key , required this.appliedOffers ,required this.onChangeStatus}) : super(key: key);

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget buildWidget(BuildContext context) {
    final statusColor = appliedOffers.statusId==OpportunitiesStatus.Accept.index?kGreen_7A : kOrange ;
    final bloc = getKoin().get<AppliedOffersBloc>();
    final progress = DialogsManager.createProgress(context);
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) { 
        if(state is LoadingDialogState){
          progress.show();
        }
        
        if(state is Initialized){
          progress.dismiss();
          onChangeStatus();
        }
        
        if(state is ErrorDialogState){
          progress.dismiss();
          DialogsManager.handleErrorDialogBuilder(context, state.error);
        }
      },
      child: Card(
        elevation: 4,
        shadowColor: kGrey_D6,
        color: Colors.grey.shade50,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12,top: 12,right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(appliedOffers.workingDate.toString()+' ,\t' + appliedOffers.opportunitiesStrartTime.toString(), style: kTextBold.copyWith(fontSize: 14,decoration: TextDecoration.underline)) ,
                  Text( appliedOffers.jobName.toString()+' , '+appliedOffers.projectName.toString(),style: kTextLabelFontDark,),
                  Text(appliedOffers.salary.toString().addCurrency(context),style: kTextLabelFontDark,),
                  Text(appliedOffers.status.toString(),style: kTextSemiBold.copyWith(color: statusColor),),
                  appliedOffers.statusId == OpportunitiesStatus.Accept.index?
                      changeStatusButton(color: kGreen, text: strings.start, onClick: () async {
                        try {
                          progress.show();
                          final position = await _determinePosition();
                          bloc.add(StartShiftEvent(appliedOffers, position));
                        }catch(e){
                          print(e);
                        }
                        progress.dismiss();


                      }): appliedOffers.statusId == OpportunitiesStatus.Start.index?
                  changeStatusButton(color: Colors.black87, text: strings.finish, onClick: () async {
                    try {
                      progress.show();
                      final position = await _determinePosition();
                      bloc.add(StartShiftEvent(appliedOffers, position));
                    }catch(e){
                      print(e);
                    }
                    progress.dismiss();


                  }):
                      Container()
              ],),
            )
          ],
        ),
      ),
    );
  }
  Widget changeStatusButton({required Color color, required String text , Function()?onClick}){
    return     Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        width: 120,
        child: AppButton( text: text,
          backgroundColor: color
          , onPressed: onClick,),
      ),
    );
  }
}