import 'package:flutter/material.dart';

import '../core/constant/text_style_constant.dart';

dropDownWidget({
  String? dropDownValue,
  double? width,
  Icon? icon,
  double? topHeight,
  EdgeInsets? padding,
  List<String>? categoryList,
  String? hintText,
  BoxDecoration? decoration,
  required BuildContext context,
  ValueChanged<String?>? onChanged,
}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.072,
    width: width ?? double.infinity,
    margin: EdgeInsets.only(left: 16, right: 16, top: topHeight ?? 16),
    decoration: decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(18), border: Border.all()
    ),
    child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButton(
          value: dropDownValue,
          isExpanded: true,
          icon: icon ?? const Icon(Icons.keyboard_arrow_down_sharp, size: 25),
          onChanged: onChanged,
          underline: Container(),
          hint: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.height * 0.02,
        ),
              Text(
                hintText!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          items: categoryList!
              .map((e) => DropdownMenuItem(
            value: e,
            child: Padding(
                padding: padding ??  const EdgeInsets.all(8.0),
                child: Text(e, style: TextStyleConstant.dropdownBtnStyle)),
          ))
              .toList(),
        )),
  );
}
