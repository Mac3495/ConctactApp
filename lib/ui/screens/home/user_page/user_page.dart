import 'package:contact_app/core/providers/app_providers.dart';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/dialogs/dialog_handler.dart';
import 'package:contact_app/core/utils/show_loading.dart';
import 'package:contact_app/ui/screens/auth/login/login_screen.dart';
import 'package:contact_app/ui/screens/splash/splash_screen.dart';
import 'package:contact_app/ui/widgets/image/circle_image_widget.dart';
import 'package:contact_app/ui/widgets/image/image_controller.dart';
import 'package:contact_app/ui/widgets/item_row_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {

  final imageController = ImageController();

  @override
  void initState() {
    final user = ref.read(userProvider).user;
    if(user.image != null) {
      imageController.setImageUrl(user.image!);
    }
    super.initState();
  }

  void updateAvatar() async {
    try {
      showLoading(context);
      if(imageController.imageFile != null){
        final url = await ref.read(storageRepositoryProvider).uploadImage(imageController.imageFile!);
        final user = ref.read(userProvider).user;
        user.image = url;
        ref.read(userRepositoryProvider).updateUser(user.id!, user);
        ref.read(userProvider).setUser(user);
        Navigator.pop(context);
        DialogHandler.showCustomDialog(context, title: 'Avatar Actualizado!', type: TypeDialog.success);
      }
    } catch (e) {
      Navigator.pop(context);
      DialogHandler.showCustomDialog(context, title: 'Error al guardar avatar');
    }
  }

  void logout() async {
    ref.read(authRepositoryProvider).signOut();
    Navigator.of(context, rootNavigator: true)
        .pushReplacementNamed(LoginScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 26,),
            AnimatedBuilder(
              animation: imageController,
              builder: (context, snapshot) {
                return CircleImageWidget(controller: imageController, title: 'Cambiar Avatar');
              }
            ),
            AnimatedBuilder(
              animation: imageController,
              builder: (context, snapshot) {
                return imageController.imageFile != null ? Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: updateAvatar,
                    child: const Text('Guardar Avatar'),
                  ),
                ) : Container();
              }
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido: ${user.name}'
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ItemRowOption(
                title: 'Cerrar Sesión',
                suffix: 'assets/icons/log_out.svg',
                color: AppColors.primary,
                
                isBottom: false,
                hasArrow: false,
                onTap: () => logout(),
              ),
            )
          ],
        ),
      ),
    );
  }
}