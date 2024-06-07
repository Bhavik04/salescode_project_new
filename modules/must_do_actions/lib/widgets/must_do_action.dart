import 'package:flutter/cupertino.dart';
import 'must_do_actions_card.dart';

class MustDoActions extends StatefulWidget {
  const MustDoActions({
    Key? key,
  }) : super(key: key);

  @override
  State<MustDoActions> createState() => _MustDoActionsState();
}

class _MustDoActionsState extends State<MustDoActions> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    // MustDoActionProvider mustDoActionProvider =
    //     Provider.of<MustDoActionProvider>(context, listen: false);
    // mustDoActionProvider.getMustDoAction();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return MustDoActionCard(index: index);
        });
  }
}
