import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

Widget textFieldInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.iceWhite),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          //contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.iceWhite,
            ),
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.iceWhite)),
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}
