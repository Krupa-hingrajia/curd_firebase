
import 'package:flutter/material.dart';

import '../core/constant/color_constant.dart';

customTextField(
    {TextEditingController? controller,
      String? text,
      String? initialValue,
      FormFieldValidator<String>? validator,
      bool? obscureText,
      bool? showCursor,
      Widget? suffixIcon,
      Widget? prefixIcon,
      ValueChanged<String>? onChanged,
      Function()? onTap
    }) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
    child: TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onTap,
      // style: const TextStyle(color: ColorConstant.black),
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      autocorrect: true,
      showCursor: showCursor ?? true,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: text ?? '',
        labelStyle: const TextStyle(fontSize: 18),
        errorStyle: const TextStyle(color: ColorConstant.red, fontSize: 15),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: ColorConstant.black, width: 2.0)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: ColorConstant.red)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: ColorConstant.black)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: ColorConstant.black, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: ColorConstant.black),
        ),
      ),
    ),
  );
}
