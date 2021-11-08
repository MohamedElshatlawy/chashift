import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:koin_flutter/src/widget_extension.dart';
import 'package:shiftapp/domain/opportunities_status.dart';
import 'package:shiftapp/presentation/appliedoffers/bloc/applied_offers_bloc.dart';
import 'package:shiftapp/presentation/appliedoffers/pages/change_status_sheet.dart';
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

  @override
  Widget buildWidget(BuildContext context) {
    final statusColor = appliedOffers.statusId==OpportunitiesStatus.Accept.index?kGreen_7A : kOrange ;
    return Card(
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
                  showChangeJobStatusDialog(appliedOffers,context, onChange: onChangeStatus);
                }): appliedOffers.statusId == OpportunitiesStatus.Start.index?
                changeStatusButton(color: Colors.black87, text: strings.finish, onClick: () async {
                  showChangeJobStatusDialog(appliedOffers,context, onChange: onChangeStatus);
                }):
                    Container()
            ],),
          )
        ],
      ),
    );
  }

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