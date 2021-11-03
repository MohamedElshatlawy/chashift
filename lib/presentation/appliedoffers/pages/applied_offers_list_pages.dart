import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin_flutter/src/widget_extension.dart';
import 'package:shiftapp/domain/applied_offer.dart';
import 'package:shiftapp/presentation/appliedoffers/applied_offer_item.dart';
import 'package:shiftapp/presentation/appliedoffers/bloc/applied_offers_bloc.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/widgets/error_handler_widget.dart';
import 'package:shiftapp/presentation/widgets/loading_widget.dart';

class AppliedOffersListPage extends StatelessWidget{
  final bool activeOffers ;
  const AppliedOffersListPage({Key? key,required this.activeOffers}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppliedOffersBloc bloc = getKoin().get();
    bloc.add(FetchAppliedOpportunitiesEvent(activeOffers));
    return BlocBuilder(
        bloc: bloc,
        builder: (con,state){
      if(state is LoadingState){
        return LoadingView();
      }
      if(state is Initialized<List<AppliedOffer>>){
        return AppliedOffersListScreen(appliedOffers: state.data, onChangeStatus: (){bloc.add(FetchAppliedOpportunitiesEvent(activeOffers));},);
      }
      if(state is ErrorState){
        return ErrorPlaceHolderWidget(exception: state.error,);
      }
      return Center();
    });
  }


}
class AppliedOffersListScreen extends StatelessWidget{
  final List<AppliedOffer> appliedOffers;
  final Function onChangeStatus ;
  const AppliedOffersListScreen({Key? key,required this.appliedOffers ,required this.onChangeStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: appliedOffers.length,
          itemBuilder: (con,pos){
            final item = appliedOffers[pos];
        return AppliedOfferItemWidget(appliedOffers: item, onChangeStatus: onChangeStatus,);
      }),
    );
  }


}