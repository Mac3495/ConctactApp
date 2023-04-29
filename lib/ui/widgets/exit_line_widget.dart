import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ExitLineWidget extends StatelessWidget {
  const ExitLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2), color: AppColors.black),
    );
  }
}
