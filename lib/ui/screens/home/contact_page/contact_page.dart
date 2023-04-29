import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/data/models/contact_model.dart';
import 'package:contact_app/ui/screens/home/contact_page/add_contact/add_contact_screen.dart';
import 'package:contact_app/ui/screens/home/contact_page/contact_model.dart';
import 'package:contact_app/ui/widgets/build_error_widget.dart';
import 'package:contact_app/ui/widgets/contact/contact_list_widget.dart';
import 'package:contact_app/ui/widgets/contact_search/contact_search_controller.dart';
import 'package:contact_app/ui/widgets/contact_search/contact_search_widget.dart';
import 'package:contact_app/ui/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPage> {

  final contactSearchController = ContactSearchController();

  @override
  void initState() {
    contactSearchController.searchController.clear();
    contactSearchController.searchInList();
    super.initState();
  }

  void goToAddContactScreen(){
    Navigator.pushNamed(context, AddContactScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(contactViewModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Contactos'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                model.when(
                  data: (data) {
                    final contactList = data as List<ContactModel>;
                    if (contactList.isEmpty) {
                      return  const NoDataWidget(
                        description: 'Aún no tienes contactos',
                        lottieAsset: 'assets/lottie/no_contact.json',
                      );
                    }
                    contactSearchController.setContactList(contactList);
                    return Column(
                      children: [
                        ContactSearchWidget(controller: contactSearchController),
                        const SizedBox(height: 12,),
                        AnimatedBuilder(
                          animation: contactSearchController,
                          builder: (context, snapshot) {
                            return ContactListWidget(contactList: contactSearchController.contactsList);
                          }
                        )
                      ],
                    );
                  },
                  error: (error) {
                  return BuildErrorWidget(errorMessage: error,);
                  },
                  loading: () => const Center(
                      child: CircularProgressIndicator(),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToAddContactScreen,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_reaction),
      ),
    );
  }
}