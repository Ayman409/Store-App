import 'package:flutter/material.dart';

class AInputField extends StatelessWidget {
  AInputField({
    Key? key,
    this.title,
    required this.hint,
    this.controller,
    this.widget,
    this.onchanged,
    this.textInputType,
  }) : super(key: key);

  final String? title;
  final Function(String)? onchanged;
  final String hint;
  TextInputType? textInputType;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14, right: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   title,
          //   // style: titleStyle,
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          Container(
            height: 57,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black87,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: textInputType,
                      onChanged: onchanged,
                      autofocus: false,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hint,
                        // hintStyle: subTitleStyle,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget ?? Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
