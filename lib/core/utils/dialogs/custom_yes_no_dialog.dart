import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import 'dialog_handler.dart';

class CustomYesNoDialog extends StatelessWidget {
  final String title;
  final String? message;
  final VoidCallback? onTapNo;
  final VoidCallback? onTapYes;
  final String textAdverse;
  final String textAssertive;
  final int flexAdverse;
  final int flexAssertive;
  final bool isDangerButton;
  final TypeDialog type;
  const CustomYesNoDialog(
      {Key? key,
      this.message,
      this.onTapNo,
      this.onTapYes,
      required this.title,
      required this.textAdverse,
      required this.textAssertive,
      required this.flexAdverse,
      required this.flexAssertive,
      required this.isDangerButton,
      required this.type})
      : super(key: key);

  Widget _buildIcon() {
    switch (type) {
      case TypeDialog.success:
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SvgPicture.asset('assets/icons/success.svg'),
        );
      case TypeDialog.error:
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SvgPicture.asset('assets/icons/error.svg'),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      backgroundColor: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 8,
          ),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    CupertinoIcons.multiply,
                    size: 16,
                    color: AppColors.primaryDark,
                  ))),
          _buildIcon(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary),
                ),
                const SizedBox(
                  height: 8,
                ),
                if (message != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      message!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryDark),
                    ),
                  ),
                const SizedBox(
                  height: 8,
                ),
                 Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: flexAdverse,
                child: OutlinedButton(
                    onPressed: onTapNo ??
                        () {
                          Navigator.pop(context, false);
                        },
                    child: Text(textAdverse)),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                flex: flexAssertive,
                child: ElevatedButton(
                    onPressed: onTapYes ??
                        () {
                          Navigator.pop(context, true);
                        },
                    style: ButtonStyle(
                      backgroundColor: isDangerButton
                          ? MaterialStateProperty.all(AppColors.red)
                          : null,
                    ),
                    child: Text(
                      textAssertive,
                    )),
              )
            ],
          ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
