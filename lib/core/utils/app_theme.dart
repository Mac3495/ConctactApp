import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.0),
    borderSide: const BorderSide(
      color: AppColors.primary, 
      width: 1, 
      style: BorderStyle.solid
    )
  );

  var borderFocus = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.0),
    borderSide: const BorderSide(
      color: AppColors.primary, 
      width: 1, 
      style: BorderStyle.solid
    )
  );

class AppTheme {
  final theme = ThemeData(
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), 
          topRight: Radius.circular(8)
        ),
      ),
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.white,
      labelPadding: EdgeInsets.all(0),
      labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.primary),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.primary,
      hintStyle: const TextStyle(fontSize: 12, color: AppColors.primaryDark),
      labelStyle: const TextStyle(fontSize: 12, color: AppColors.primaryDark),
      floatingLabelStyle: const TextStyle(fontSize: 10),
      fillColor: AppColors.white,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
      errorStyle: const TextStyle(fontSize: 10),
      border: border,
      focusedBorder: borderFocus,
      disabledBorder: border,
      enabledBorder: border
    ),

    fontFamily: '.SF UI Display',
  
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: AppColors.primaryText, fontSize: 13.2),
      bodyText2: TextStyle(color: AppColors.primaryText)
    ),
  
    backgroundColor: AppColors.white,
    
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme:  const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.primary ,
      iconTheme:  IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
          fontSize: 24,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
      )
    )
  );
}