import 'dart:math';

import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/data/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactItemWidget extends ConsumerWidget {
  final ContactModel contact;
  const ContactItemWidget({super.key, required this.contact});

  Color _generateRandomColor() {
  final random = Random();
  Color color;
  do {
    final r = random.nextInt(255);
    final g = random.nextInt(255);
    final b = random.nextInt(255);
    color = Color.fromARGB(255, r, g, b);
  } while (color.computeLuminance() < 0.2);
  return color;
}


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: _generateRandomColor()
                ),
                child: Center(
                  child: Text(
                    contact.name.substring(0,1).toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 24
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    contact.dni,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 14
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}