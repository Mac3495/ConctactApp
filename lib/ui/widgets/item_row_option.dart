import 'package:contact_app/ui/widgets/line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

class ItemRowOption extends StatelessWidget {
  /// Profile Options Element
  const ItemRowOption(
      {Key? key,
      this.suffix,
      this.color = AppColors.black,
      required this.title,
      this.hasLine = true,
      required this.onTap,

      this.hasArrow = true,
      this.isBottom = true,
      this.iconColor})
      : super(key: key);
  final Color color;
  final Color? iconColor;
  final String title;
  final bool hasLine;
  final VoidCallback onTap;
  
  final bool hasArrow;
  final bool isBottom;
  final String? suffix;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: AppColors.primary.withOpacity(0.4),
        onTap: onTap,
        child: SizedBox(
          height: 50,
          child: Column(
            children: [
              if (hasLine && !isBottom) const LineWidget(),
              Expanded(
                child: Align(
                  child: Row(
                    children: [
                      if (suffix != null)
                        SvgPicture.asset(
                          suffix!,
                          height: 18,
                          width: 18,
                          color: color,
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                      if (hasArrow)
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: iconColor ?? color,
                        ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
              ),
              if (hasLine && isBottom) const LineWidget()
            ],
          ),
        ),
      ),
    );
  }
}
