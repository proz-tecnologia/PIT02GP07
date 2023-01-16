// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';

import '../../pages/home/components/home_state_success.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({Key? key, required this.widget}) : super(key: key);

  final HomeStateSuccessWidget widget;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        size: 55.0,
        Icons.account_circle_rounded,
      ),
      title: Text(
        'Olá, ${widget.state.user.userName}',
        style: const TextStyle(color: AppColors.iceWhite),
      ),
      actions: const [
        Icon(Icons.more_vert_outlined),
      ],
    ); // Your custom widget implementation.
  }
}
