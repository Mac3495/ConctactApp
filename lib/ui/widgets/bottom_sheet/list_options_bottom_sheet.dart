import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/ui/widgets/exit_line_widget.dart';
import 'package:contact_app/ui/widgets/line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'options_bottom_sheet.dart';

class ListOptionsBottomSheet extends StatelessWidget {
  const ListOptionsBottomSheet({Key? key, required this.itemOptions})
      : super(key: key);

  final List<ItemOption> itemOptions;

  Widget _builIcon(int index) {
    final icon = itemOptions[index].icon;
    final color = itemOptions[index].color;
    if (icon != null) {
      return Icon(icon, size: 16, color: color);
    }
    final svg = itemOptions[index].svg;
    return SvgPicture.asset(
      svg!,
      height: 16,
      width: 16,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 24),
            const ExitLineWidget(),
            const SizedBox(height: 16),
            for (var index = 0; index < itemOptions.length; index++)
              Material(
                
                child: InkWell(
                  splashColor: AppColors.primary.withOpacity(0.4),
                  onTap: () => Navigator.pop(context, index),
                  child: Container(
                    
                    
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            _builIcon(index),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              
                                children: [
                                  Text(
                                    itemOptions[index].title,
                                    style: TextStyle(
                                        color: itemOptions[index].color,
                                        height: 1),
                                  ),
                                  if (itemOptions[index].subtitle != null)
                                    Text(
                                      itemOptions[index].subtitle!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.black),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (index != itemOptions.length - 1) const LineWidget()
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
}
