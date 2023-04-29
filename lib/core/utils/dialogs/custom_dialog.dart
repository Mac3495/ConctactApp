import 'package:contact_app/core/utils/dialogs/dialog_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    this.message,
    required this.textButton,
    this.onTap,
    required this.type,
    this.closeButton = true
  }) : super(key: key);

  final String title;
  final String? message;
  final String textButton;
  final VoidCallback? onTap;
  final TypeDialog type;
  final bool closeButton;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8,
          ),
          closeButton ? Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    CupertinoIcons.multiply,
                    size: 16,
                    color: AppColors.primaryDark,
                  ))) : const SizedBox(height: 16,),
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
                ElevatedButton(
                    onPressed: onTap ??
                        () {
                          Navigator.pop(context);
                        },
                    child: Text(textButton))
              ],
            ),
          )
        ],
      ),
    );
  }
}
