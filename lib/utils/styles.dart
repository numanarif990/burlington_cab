import 'package:flutter/material.dart';
import 'package:web_app/utils/colors.dart';
ButtonStyle borderedButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all(0),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    side: BorderSide(
      color: AppColors.primaryColor,
    ),
    borderRadius: BorderRadius.circular(10),
  ))
);