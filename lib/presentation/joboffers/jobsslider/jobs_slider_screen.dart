import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/joboffers/jobslist/jobs_list.dart';
import 'package:shiftapp/main_index.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:tcard/tcard.dart';
class OffersPage extends StatefulWidget {
  final List<JobOffer> offers;

  OffersPage({required this.offers});


  @override
  _OffersPageState createState() => _OffersPageState();
}

class Content {
  final String? text;
  final Color? color;

  Content({this.text, this.color});
}

class _OffersPageState extends State<OffersPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController = SwipeableCardSectionController();
    TCardController _controller = TCardController();

    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: 500,
            child: TCard(
              cards: widget.offers.map((e) => JobItem(e)).toList(),
              size: Size(double.infinity, 500),
              controller: _controller,
              onForward: (index, info) {
                print(index);
                print(info.direction);
                if (info.direction == SwipDirection.Right) {
                  print('like');
                } else {
                  print('dislike');
                }
              },
              onBack: (index, info) {
                print(index);

              },
              onEnd: () {
                _controller.reset();

                print('end');
              },
            )
        ),
    );
  }
}
