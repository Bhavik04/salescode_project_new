import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:salescode_sdk/salescode_sdk.dart';

class FaqContainer extends StatelessWidget {
  final String question;
  final String answer;

  const FaqContainer({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  key: const Key('TestExpandablePanel'),
                  theme: ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      // tapBodyToCollapse: true,
                      iconColor: HexColor('#415a6c'),
                      iconSize: 30),
                  header: Padding(
                    padding: const EdgeInsets.all(15),
                    key: const Key('faqShown'),
                    child: Text(
                      question,
                      style: TextStyle(
                        color: HexColor('#415a6c'),
                        fontFamily:  GlobalVariables.fontFamily,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          answer,
                          style:  TextStyle(fontFamily:  GlobalVariables.fontFamily),
                        ),
                      ),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 2),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
