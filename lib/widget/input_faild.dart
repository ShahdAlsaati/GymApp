import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInputField extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key, required this.title, required this.hint, this.controller, this.widget}) : super(key: key);

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
           // style: titleStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(left: 14),
            height: 52,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                    child:TextFormField(
                      readOnly: widget.widget==null?false:true,
                      autofocus: false,
                      cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                      controller: widget.controller,
                    //  style: subTitleStyle,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                     //   hintStyle: subTitleStyle,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: context.theme.backgroundColor,
                            width: 0
                          )
                        )
                      ),
                    )
                ),
                widget.widget==null?Container():Container(
                  child: widget.widget,

                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
