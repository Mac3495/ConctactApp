import 'package:contact_app/data/models/contact_model.dart';
import 'package:contact_app/ui/widgets/contact/contact_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactListWidget extends ConsumerWidget {
  final List<ContactModel> contactList;
  const ContactListWidget({super.key, required this.contactList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: contactList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((_, index) {
        final contact = contactList[index];
        return Consumer(builder: (_, ref, __) {
            return ContactItemWidget(
              contact: contact,
            );
          }
        );
      }),
    );
  }
}