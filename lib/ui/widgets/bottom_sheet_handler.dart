import 'package:contact_app/ui/widgets/bottom_sheet/list_options_bottom_sheet.dart';
import 'package:contact_app/ui/widgets/bottom_sheet/options_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BottomSheetHandler {
  static Future<int?> showOptions(BuildContext context,
      {required List<ItemOption> options, required String title}) async {
    final response = await showModalBottomSheet<int?>(
        context: context,
        //isScrollControlled: true,
        useRootNavigator: true,
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (context) {
          return OptionsBottomSheet(
            itemOptions: options,
            title: title,
          );
        });
    return response;
  }

  static Future<int?> showListOptions(BuildContext context,
      {required List<ItemOption> options}) async {
    final response = await showModalBottomSheet<int?>(
        context: context,
        //isScrollControlled: true,
        useRootNavigator: true,
        barrierColor: Colors.black.withOpacity(0.3),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20)
          )
        ),
        builder: (context) {
          return ListOptionsBottomSheet(itemOptions: options);
        });
    return response;
  }
}
