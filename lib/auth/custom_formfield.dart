// ignore_for_file: avoid_redundant_argument_values, always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:salescode_sdk/salescode_sdk.dart';

class CustomFormField extends StatefulWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final bool incorrectValue;
  final Function? completeFunction;
  final Function? onChange;
  final bool? neccesaryField;
  final String incorrectMessage;
  final bool enabled;
  final bool enablePrefix;

  const CustomFormField(
      {super.key,
      this.inputFormatter,
      required this.headingText,
      required this.hintText,
      required this.obsecureText,
      required this.suffixIcon,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.maxLines,
      this.completeFunction,
      this.enablePrefix = false,
      this.onChange,
      this.neccesaryField = false,
      this.incorrectValue = false,
      this.enabled = true,
      this.incorrectMessage = ""});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool checkIfBold = false;
  String dialCode = "91";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> isTextRed() {
    List<String> args = widget.headingText.split(" ");
    return args;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth =
        ui.window.physicalSize.width / ui.window.devicePixelRatio;

    double deviceHeight = ui.window.physicalSize.height / ui.window.devicePixelRatio;

    return SizedBox(
      width: deviceWidth * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.neccesaryField!
              ? Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 5),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontWeight: checkIfBold
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: const Color.fromRGBO(96, 96, 96, 1),
                            fontSize: checkIfBold ? 14 : 12),
                        text: widget.headingText,
                        children: [
                          TextSpan(
                              text: " *",
                              style: TextStyle(
                                  fontWeight: checkIfBold
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: Colors.red,
                                  fontSize: checkIfBold ? 14 : 12)),
                        ]),
                  ))
              : Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 5),
                  child: Text(
                    widget.headingText,
                    style: TextStyle(
                        fontWeight:
                            checkIfBold ? FontWeight.bold : FontWeight.normal,
                        color: const Color.fromRGBO(96, 96, 96, 1),
                        fontSize: checkIfBold ? 14 : 12),
                  ),
                ),
          Visibility(
            visible: widget.incorrectValue,
            child: Text(
              widget.incorrectMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFEBEBEB), width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            // child: Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              onEditingComplete: () {
                if (widget.completeFunction != null) {
                  widget.completeFunction!();
                }
              },
              maxLines: widget.maxLines,
              controller: widget.controller,
              onChanged: (value) {
                if (widget.onChange != null) {
                  widget.onChange!(value);
                }
              },
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              inputFormatters: widget.inputFormatter,
              obscureText: widget.obsecureText,
              enabled: widget.enabled,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  prefixIcon: widget.enablePrefix
                      ? SizedBox(
                          height: deviceHeight * 0.001,
                          width: deviceWidth * 0.001,
                          child: Center(
                              child: Text(
                            "+$dialCode",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          )))
                      : null,
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      color: Color.fromRGBO(96, 96, 96, 1 / 2), fontSize: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.incorrectValue
                            ? Colors.red : HexColor("#eaeaea")),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.incorrectValue
                            ? Colors.red
                            : HexColor("#cb352e"),
                        width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  //hintStyle: KTextStyle.textFieldHintStyle,
                  border: InputBorder.none,
                  suffixIcon: widget.suffixIcon),
            ),
          ),
          // )
        ],
      ),
    );
  }
}

//new custom field
class CustomFormField2 extends StatefulWidget {
  final String? hintText;
  final bool obsecureText;
  final bool? readOnly;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;
  final bool incorrectValue;
  final List<TextInputFormatter>? inputFormatter;
  final String? labelText;
  final Function? completeFunction;
  final Function? changeFunction;
  final String incorrectMessage;

  const CustomFormField2(
      {super.key,
      this.completeFunction,
      this.changeFunction,
      this.inputFormatter,
      this.labelText,
      this.hintText,
      required this.obsecureText,
      this.suffixIcon,
      this.textInputType,
      this.incorrectValue = false,
      required this.textInputAction,
      required this.controller,
      this.readOnly,
      required this.maxLines,
      this.incorrectMessage = ""});

  @override
  State<CustomFormField2> createState() => _CustomFormField2State();
}

class _CustomFormField2State extends State<CustomFormField2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: const Key('TestChangePassCurrent'),
          readOnly: widget.readOnly ?? false,
          onEditingComplete: () {
            if (widget.completeFunction != null) {
              widget.completeFunction!();
            }
          },
          onChanged: (value) {
            if (widget.changeFunction != null) {
              widget.changeFunction!(value);
            }
          },
          cursorColor: Colors.black,
          // selectionControls: EmptyTextSelectionControls(), //using it makes text us unable to paste and copy text
          controller: widget.controller,
          obscureText: widget.obsecureText,
          inputFormatters: widget.inputFormatter,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            // isDense: true,

            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black54),
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(12),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.incorrectValue
                      ? Colors.red
                      : widget.readOnly != null && widget.readOnly! == true
                          ? Colors.grey
                          : HexColor('#eaeaea')),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.readOnly != null && widget.readOnly! == true
                      ? Colors.grey
                      : widget.incorrectValue
                          ? Colors.red
                          : GlobalVariables.themeColor,
                  width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: widget.suffixIcon,
          ),
        ),
        widget.incorrectMessage != ""
            ? Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(widget.incorrectMessage,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
