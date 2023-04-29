import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/image.dart';
import 'package:contact_app/ui/widgets/bottom_sheet/options_bottom_sheet.dart';
import 'package:contact_app/ui/widgets/bottom_sheet_handler.dart';
import 'package:contact_app/ui/widgets/image/image_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CircleImageWidget extends ConsumerStatefulWidget {
  final ImageController controller;
  final String title;
  const CircleImageWidget({
    super.key, 
    required this.controller, 
    required this.title
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CircleImageWidgetState();
}

class _CircleImageWidgetState extends ConsumerState<CircleImageWidget> {

  selectImage() async {
    final response = await BottomSheetHandler.showOptions(context,
        title: '',
        options: <ItemOption>[
          ItemOption(title: 'Camera', icon: CupertinoIcons.camera),
          ItemOption(
              title: 'Gallery',
              icon: CupertinoIcons.photo_fill_on_rectangle_fill),
        ]);
    if (response != null) {
      switch (response) {
        case 0:
          widget.controller.selectImage(SelectImage.camera);
          break;
        case 1:
          widget.controller.selectImage(SelectImage.gallery);
          break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.imageFile == null && widget.controller.imageUrl == null 
      ? AnimatedBuilder(
        animation: widget.controller,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: selectImage,
            child: Container(
              width: 155,
              height: 155,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(77.5),
                border: Border.all(width: 1, color: AppColors.secondaryText)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/camera.svg'),
                  const SizedBox(height: 28,),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9C9C9C)
                    ),
                  )
                ],
              ),
            ),
          );
        }
      )
      : AnimatedBuilder(
        animation: widget.controller,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 77),
            child: Stack(
              children: [
                SizedBox(
                  width: 155,
                  height: 155,
                  child: widget.controller.imageFile != null
                  ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(77.5)),
                    child: Image.file(
                      widget.controller.imageFile!,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  )
                  : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(77.5)),
                    child:
                    Image.network(
                      widget.controller.imageUrl!,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: selectImage,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppColors.primary
                        ),
                        borderRadius: BorderRadius.circular(22.5),
                        color: AppColors.white
                      ),
                      width: 45,
                      height: 45,
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  )
                ),
              ],
            ),
          );
        }
      );
  }
}