import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/ui/widgets/contact_search/contact_search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactSearchWidget extends ConsumerStatefulWidget {
  final ContactSearchController controller;
  const ContactSearchWidget({super.key, required this.controller});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactSearchWidgetState();
}

class _ContactSearchWidgetState extends ConsumerState<ContactSearchWidget> {

  Widget searchBar(){
    return TextField(
      controller: widget.controller.searchController,
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.search,
      //onSubmitted: (_) => searchText(),
      decoration: InputDecoration(
        hintText: 'Buscar',    
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
                color: AppColors.primary, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
                color: AppColors.primary, width: 1)),
        suffix: AnimatedBuilder(
        animation: widget.controller,
        builder: (_, __) {
          return widget.controller.searchController.text.isEmpty
            ? SizedBox(
              height: 26,
              width: 26,
              child: IconButton(
                padding: const EdgeInsets.all(8),
                onPressed: () {
                  widget.controller.searchController.clear();
                },
                icon: const Icon(
                  CupertinoIcons.search,
                  size: 18,
                  color: AppColors.primary,
                )
              ),
            )
            : SizedBox(
              height: 26,
              width: 26,
              child: IconButton(
                padding: const EdgeInsets.all(8),
                onPressed: () {
                  widget.controller.resetList();
                  widget.controller.searchController.clear();
                },
                icon: const Icon(
                  CupertinoIcons.multiply_circle_fill,
                  size: 18,
                  color: AppColors.primary,
                )
              ),
            );
          }
        )
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(left: 24, top: 16, right: 24),
          child: searchBar(),  
        );
      }
    );
  }
}