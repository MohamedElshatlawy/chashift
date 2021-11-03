import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class OverviewScreen extends BaseWidget {
  final OverviewComponents overviewComponents;
  final Function onRefresh ;

   OverviewScreen({Key? key,required this.onRefresh , required this.overviewComponents}) : super(key: key);


  @override
  Widget buildWidget(BuildContext context) {
    final offers = overviewComponents.offers;
    final appliedOffers = overviewComponents.appliedOffers;
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
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // Align(
                          //   alignment: AlignmentDirectional.centerStart,
                          //   child: Text(
                          //     'Current Shift',
                          //     style: kTextBold.copyWith(fontSize: 16),
                          //   ),
                          // ),
                          // Divider(
                          //   height: 1,
                          //   color: Colors.grey[300],
                          // ),
                          Text(
                            'Sales At City Mall ,Riyadh',
                            style: kTextSemiBold.copyWith(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text('from 8:00 until 12:00',
                              style: kTextLabel.copyWith(fontSize: 16)),
                          const SizedBox(
                            height: 8,
                          ),
                          Text('40 minutes until finish this shift',
                              style: kTextLabel.copyWith(fontSize: 16))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
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
