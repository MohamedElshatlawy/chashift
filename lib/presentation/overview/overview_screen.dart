import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shiftapp/domain/applied_offer.dart';
import 'package:shiftapp/presentation/appliedoffers/applied_offer_item.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/joboffers/bloc/job_offers_bloc.dart';
import 'package:shiftapp/presentation/joboffers/jobslist/jobs_list.dart';
import 'package:shiftapp/presentation/overview/bloc/overview_bloc.dart';
import 'package:shiftapp/presentation/overview/overview_components.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/domain/job_offer.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/error_handler_widget.dart';
import 'package:shiftapp/presentation/widgets/loading_widget.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = getKoin().get<OverviewBloc>();
    bloc.add(FetchComponentDataEvent());
    return Scaffold(
      backgroundColor: kBackgroundColor2,
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          print('BlocBuilder ${state}');
          if (state is LoadingState) {
            return LoadingView();
          }

          if (state is Initialized<OverviewComponents>) {
            return OverviewScreen(overviewComponents: state.data, onRefresh: (){
              bloc.add(FetchComponentDataEvent());
            },);
          }

          if (state is ErrorState) {
            return ErrorPlaceHolderWidget(
              exception: state.error,
            );
          }
          return const Center();
        },
      ),
    );
  }
}
bool isFinishedShift = false ;

class OverviewScreen extends BaseWidget {
  final OverviewComponents overviewComponents;
  final Function onRefresh ;

   OverviewScreen({Key? key,required this.onRefresh , required this.overviewComponents}) : super(key: key);


   Color getHourColor(int hour){
    return hour <1 ?Colors.red : Colors.green;
   }
  @override
  Widget buildWidget(BuildContext context) {

    final offers = overviewComponents.offers;
    final appliedOffers = overviewComponents.appliedOffers;
    final currentShift = overviewComponents.currentShift;


    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 16, bottom: 16),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
               StreamBuilder<AppliedOffer>(
                 stream: overviewComponents.currentShift.stream,
                 builder: (context, snapshot) {
                   final currentShift = snapshot.data;

                   return snapshot.data==null ?Container():
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            strings.current_shift,
                            style: kTextBold.copyWith(fontSize: 16),
                          ),
                          Card(
                            elevation: 3,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 16, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,

                                children: [
                                  currentShift!.remainingTimeFinish()>=1?
                                  Container(
                                      padding: const EdgeInsetsDirectional.only(start: 20,bottom: 12),
                                      child: Text('Finished ')) :
                                  CountdownTimer(
                                    endTime: currentShift.finishedDateTime()
                                        .millisecondsSinceEpoch,
                                    widgetBuilder: (c,time){
                                      if (time == null) {
                                          onRefresh();
                                        return Text('Finished ');
                                      }
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.only(start: 20),
                                        child: Directionality(textDirection: TextDirection.ltr,
                                            child: Center(
                                              child: Text(' ${time.hours!=null ? time.hours:0} : ${time.min!=null ?  time.min : 0} : ${time.sec.toString()}' ,
                                                style: kTextBold.copyWith(fontSize:18 , color: getHourColor(time.hours!=null ?time.hours!:0)),),
                                            )),
                                      );
                                    },
                                  ),

                                  Divider(
                                    height: 1,
                                    color: Colors.grey[300],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      currentShift.workingDate.toString(),
                                      style: kTextBold.copyWith(fontSize: 16),
                                    ),
                                  ),
                                  Text('${currentShift.startTime()} ${strings.to} ${currentShift.finishTime()}',
                                      style: kTextSemiBold.copyWith(fontSize: 16)),
                                  Text(
                                    currentShift.projectName.toString()+' '+currentShift.address.toString(),
                                    style: kTextSemiBold.copyWith(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                 }
               ),
                  const SizedBox(height: 16,),

                  offers.isNotEmpty ? Column(
                    children: [
                      Text(
                        strings.new_jobs,
                        style: kTextBold.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 320,
                        child: PageView.builder(
                            pageSnapping: true,
                            controller: PageController(
                              viewportFraction: 0.9,
                              initialPage: 0,
                            ),
                            itemCount: offers.length,
                            itemBuilder: (con, pos) {
                          final jobOffer = offers[pos];
                          return JobItem(jobOffer,padding: const EdgeInsetsDirectional.only(end: 1),onApplyOffer: (){
                            onRefresh();
                          },);
                        }),
                      ),
                    ],
                  ):Container(),
                  SizedBox(height: 16,),
                  Text(
                    strings.applied_opportunities,
                    style: kTextBold.copyWith(fontSize: 16),
                  ),

                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                        pageSnapping: true,
                        controller: PageController(
                          viewportFraction: 0.9,
                          initialPage: 0,
                        ),
                        itemCount: appliedOffers.length,
                        itemBuilder: (con, pos) {
                      final item = appliedOffers[pos];
                      return AppliedOfferItemWidget(appliedOffers: item, onChangeStatus: onRefresh,);
                    }),
                  ),

                ],
              ),
            ),
          ),
        ),
      );},
    );
  }
}
