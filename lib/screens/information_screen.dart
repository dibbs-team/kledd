import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/information_segment.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  Container(
                    height: 500,
                    child: PageView(
                      controller: controller,
                      children: List.generate(
                        3,
                        (index) => InformationSegment(info: "temp"),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: JumpingDotEffect(
                      dotColor: Colors.blueGrey,
                      activeDotColor: Theme.of(context).accentColor,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                    onDotClicked: (index) {
                      // TODO: Place function that changes Card here (issue #34)
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 200,
            child: FlatButton(
              onPressed: () {
                // TODO: Close.
              },
              child: Text('Let\'s start!'),
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }
}
