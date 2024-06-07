import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:salescode_sdk/salescode_sdk.dart';
import 'dart:typed_data';

class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;
  final String headerName;

  const PdfViewerPage(
      {super.key, required this.pdfUrl, required this.headerName});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late Future<Uint8List> _pdfFuture;

  @override
  void initState() {
    super.initState();
    _pdfFuture = _fetchPdf(widget.pdfUrl);
  }

  Future<Uint8List> _fetchPdf(String url) async {
    final response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white, // Changed color for testing
            ),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              key: const Key("testPDFkey"),
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                if (ModalRoute.of(context)!.isFirst != true) {
                  Navigator.pop(context);
                }
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    key: const Key("backTnC"),
                    color: HexColor("#6c757d"),
                    size: GlobalVariables.deviceHeight * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      widget.headerName,
                      style: TextStyle(
                          color: HexColor("#6c757d"),
                          fontWeight: FontWeight.w600,
                          fontSize: GlobalVariables.deviceHeight * 0.021),
                    ),
                  )
                ],
              ),
            ),
          ])),
      body: FutureBuilder<Uint8List>(
        future: _pdfFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading PDF'));
          } else {
            final pdfBytes = snapshot.data!;
            return PDFView(
              pdfData: pdfBytes,
              onViewCreated: (PDFViewController controller) {
                setState(() {});
              },
            );
          }
        },
      ),
    );
  }
}
