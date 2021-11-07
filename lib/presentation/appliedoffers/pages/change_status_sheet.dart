
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shiftapp/domain/applied_offer.dart';
import 'package:shiftapp/domain/job_offer.dart';
import 'package:shiftapp/domain/opportunities_status.dart';
import 'package:shiftapp/presentation/appliedoffers/bloc/applied_offers_bloc.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/widgets/app_button.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/main_index.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showChangeJobStatusDialog(AppliedOffer jobOffer, BuildContext context ,{required Function onChange} ) {

  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return ChangeJobSatusWidget(jobOffer: jobOffer, onChange: onChange,);
      });
}
class ChangeJobSatusWidget extends BaseWidget{
  final AppliedOffer jobOffer ;
  final Function onChange ;

  Future<Position> _determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      DialogsManager.showMessageDialog(context, strings.open_location, onClickOk: (){
        Geolocator.openLocationSettings();
      });
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

  ChangeJobSatusWidget({Key? key, required this.jobOffer, required this.onChange}) : super(key: key);
  @override
  Widget buildWidget(BuildContext context) {
    final bloc = getKoin().get<AppliedOffersBloc>();

    final isStart = jobOffer.statusId == OpportunitiesStatus.Accept.index ;

    final color = isStart? kGreen : Colors.black87 ;
    final text =   context.getStrings().save_button;
    final progress = DialogsManager.createProgress(context);
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
          if(state is LoadingDialogState){
           progress.show();
          }
          if(state is Initialized){
            progress.dismiss();
            onChange();
          }

          if(state is ErrorDialogState){
            progress.dismiss();
            print('Show Error dialod');
          DialogsManager.handleErrorDialogBuilder(context, state.error);
        }
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24,bottom: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24,),
                  Text('${isStart ? strings.start_shift_label : strings.finish_shift_label}${jobOffer.jobName}',textAlign: TextAlign.center,style: kTextBold.copyWith(fontSize: 18),),
                  SizedBox(height: 24,),
                  Text(strings.add_your_notes,style: kTextLabel,),
                  SizedBox(child: TextFormField(
                    maxLines: 5,
                    decoration: kTextFieldCommentDecoration.copyWith(
                    ),
                  )),
                  AppButton(text: text,
                    backgroundColor: color
                    ,onPressed: () async {
                     // kHideKeyboard();
                     // FocusScope.of(context).requestFocus(FocusNode());
                      try {
                        progress.show();
                        final position = await _determinePosition(context);
                        bloc.add(StartShiftEvent(jobOffer, position));
                      }catch(e){
                        print(e);
                      }
                      progress.dismiss();
                    },margin: const EdgeInsets.only(top: 24),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}