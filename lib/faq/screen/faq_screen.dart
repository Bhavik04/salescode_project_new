// ignore_for_file: always_specify_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salescode_sdk/salescode_sdk.dart';
import '../models/faq_ui.dart';
import '../repository/faq_repository_app.dart';
import '../widgets/faq_container.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});
  static const String routeName = 'faqScreen';
  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  FaqServiceApp faqService = FaqServiceApp();
  List<FaqUI> faqList = [];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    // FaqProvider provider = Provider.of<FaqProvider>(context, listen: false);
    // provider.fetchFaqData();
    getFaqsData();

    // });
    // sendPageViewEvent("FaqPage");
  }

  @override
  Widget build(BuildContext context) {
    // double height = GlobalVariables.deviceHeight;
    // FaqProvider fProvider = Provider.of<FaqProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'FAQs',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          backgroundColor: GlobalVariables.themeColor,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: faqList.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Image.asset(
                          'assets/images/faq.png',
                          height: 130,
                        ),
                      ),
                    ),
                    ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: faqList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return FaqContainer(
                            question: faqList[index].question,
                            answer: faqList[index].answer,
                          );
                        }),
                  ],
                ),
              )
            : Container(
                margin: const EdgeInsets.all(5),
                child: const Text("No Data in this date range")));
  }

  Future<void> getFaqsData() async {
    List<FaqUI> faqs = await faqService.getFaqData();
    faqList.addAll(faqs);
    setState(() {});
  }
}
