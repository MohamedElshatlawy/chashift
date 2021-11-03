import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/joboffers/bloc/job_offers_bloc.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/error_handler_widget.dart';
import 'package:shiftapp/presentation/widgets/loading_widget.dart';
import '../../main.dart';
import 'package:shiftapp/domain/job_offer.dart';
import 'package:shiftapp/main_index.dart';
import 'jobmap/jobs_map_screen.dart';
import 'jobslist/jobs_list.dart';
import 'jobsslider/jobs_slider_screen.dart';

class JobsOffersScreen extends BaseWidget {
   JobsOffersScreen({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    final bloc = getKoin().get<JobOffersBloc>();
    bloc.add(FetchOffersEvent());
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            backgroundColor: kPrimary,
            elevation: 0,
            bottom: const TabBar(
              indicatorColor: kPrimary,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                    icon: Icon(
                      Icons.map,
                      color: Colors.white,
                    )),
                Tab(
                    icon: Icon(
                      Icons.local_offer,
                      color: Colors.white,
                    )),
                Tab(
                    icon: Icon(
                      Icons.list,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          body: BlocBuilder(
            bloc: bloc,
            builder: (BuildContext context, state) {
              if(state is LoadingState){
                return LoadingView();
              }

              if(state is ErrorState){
                return ErrorPlaceHolderWidget(exception: state.error,);
              }
              if(state is Initialized<List<JobOffer>>){
                return TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MapScreen(offers: state.data,),
                    OffersPage(
                     offers: state.data,),
                    ListJobsScreen(offers: state.data,),
                  ],
                );
              }
            return Container();
          },)
        ));
  }

}
