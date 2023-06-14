import 'package:demo_test/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

coustomSnackBar({required BuildContext context, required String text}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: ColorConstant.black,
    duration: const Duration(seconds: 3),
    shape: const RoundedRectangleBorder(),
    content: Text(text ?? '', style: const TextStyle(color: ColorConstant.white, fontSize: 16, letterSpacing: 0.5)),
  ));
}