import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/appliedoffers/pages/applied_offers_list_pages.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/widgets/app_widgets.dart';

class AppliedOffersPage extends StatelessWidget {
  static const routeName = '/appliedoffers';
  const AppliedOffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading:IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: Colors.white,
              ),
              elevation: 0,
              centerTitle: true,
              title: Text(context.getStrings().working_hours , style: kTextSemiBold.copyWith(color: Colors.white),),
              backgroundColor: kPrimary,
              bottom:  TabBar(
                indicatorColor: kPrimary,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: context.getStrings().active),
                  Tab(text: context.getStrings().finished)
                ],
              ),
            ),
            body:
            const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                AppliedOffersListPage(activeOffers: true,),
                AppliedOffersListPage(activeOffers: false,)
              ],
            )
        ));

  }
}