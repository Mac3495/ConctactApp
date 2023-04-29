import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/ui/widgets/exit_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionsBottomSheet extends StatelessWidget {
  const OptionsBottomSheet(
      {Key? key, required this.itemOptions, required this.title})
      : super(key: key);

  final List<ItemOption> itemOptions;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 12),
        const ExitLineWidget(),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 75,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var index = 0; index < itemOptions.length; index++)
                Expanded(
                  child: Material(
                    child: InkWell(
                      splashColor: AppColors.primary.withOpacity(0.4),
                      onTap: () => Navigator.pop(context, index),
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Expanded(
                                child: Icon(
                              itemOptions[index].icon,
                              size: 36,
                              color: AppColors.primary,
                            )),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              itemOptions[index].title,
                              style: TextStyle(color: itemOptions[index].color),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

class ItemOption {
  ItemOption(
      {required this.title,
      this.icon,
      this.subtitle,
      this.svg,
      this.color = AppColors.primary})
      : assert(icon != null || svg != null);
  final String title;
  final String? subtitle;
  final IconData? icon;
  final String? svg;
  final Color color;
}
