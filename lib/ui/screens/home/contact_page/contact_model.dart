import 'package:contact_app/core/providers/app_providers.dart';
import 'package:contact_app/core/states/charging_state.dart';
import 'package:contact_app/data/repositories/auth_repository/iauth_repository.dart';
import 'package:contact_app/data/repositories/contact_repository/icontact_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactViewModel = StateNotifierProvider<ContactViewModel, ChargingState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final contactRepository = ref.watch(contactRepositoryProvider);
  return ContactViewModel(authRepository: authRepository, contactRepository: contactRepository);
});

class ContactViewModel extends StateNotifier<ChargingState>{
  
  final IAuthRepository authRepository;
  final IContactRepository contactRepository;

  ContactViewModel({ required this.authRepository, required this.contactRepository }) : super(const ChargingState.loading()){
    loadContacts();
  }

  Future<void> loadContacts() async {
    try {
      final uid = authRepository.getUid();
      final response = await contactRepository.getContactsById(uid!);
      state = ChargingState.data(response);
    } catch (e) {
      print(e);
      state = const ChargingState.error('Whoops, an unexpected error occurred, please try again');
    }
  }  
}