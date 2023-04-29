import 'package:contact_app/core/providers/app_providers.dart';
import 'package:contact_app/core/utils/dialogs/dialog_handler.dart';
import 'package:contact_app/core/utils/show_loading.dart';
import 'package:contact_app/core/utils/validators.dart';
import 'package:contact_app/data/models/contact_model.dart';
import 'package:contact_app/ui/screens/home/contact_page/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddContactScreen extends ConsumerStatefulWidget {
  const AddContactScreen({super.key});

  static const String route = '/Add';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends ConsumerState<AddContactScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController dniController = TextEditingController();

  void addContact() async {
    try {
      if(_formKey.currentState!.validate()){
        showLoading(context);
        final uid = ref.read(authRepositoryProvider).getUid();
        final contact = ContactModel(
          userId: uid!, 
          name: nameController.text, 
          dni: dniController.text
        );
        await ref.read(contactRepositoryProvider).createContact(contact);
        ref.refresh(contactViewModel);
        Navigator.pop(context);
        await DialogHandler.showCustomDialog(context, title: 'Contacto guardado', type: TypeDialog.success);
        Navigator.pop(context);
      }
    } catch(e) {
      Navigator.pop(context);
      DialogHandler.showCustomDialog(context, title: 'Error al guardar', type: TypeDialog.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Contacto'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: contactNameValidator,
              ),
              const SizedBox(height: 24,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: dniController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Identificación',
                ),
                validator: validateDniNumber,
              ),
              const SizedBox(height: 24,),
              ElevatedButton(
                onPressed: addContact, 
                child: const Text('Guardar')
              )
            ],
          ),
        ),
      ),
    );
  }
}