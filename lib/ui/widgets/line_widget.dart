import 'package:flutter/material.dart';


import '../../../core/utils/app_colors.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key? key, this.color =  AppColors.secondaryText,  this.height = 0.5})
      : super(key: key);
  final Color color;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(color: color),
    );
  }
}