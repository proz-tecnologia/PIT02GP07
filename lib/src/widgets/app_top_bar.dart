// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppTopBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        size: 55.0,
        Icons.account_circle_rounded,
      ),
      // ignore: todo
      // Container( //TODO asset com erro
      //   decoration: BoxDecoration(
      //     color: AppColors.iceWhite,
      //     borderRadius: BorderRadius.circular(30.0),
      //   ),
      //   child: Image.asset(  // ERRO!!!
      //   'assets/images/account_circle_outline.png',
      //   ),
      // ),
      title: Text('Olá, $title'),
      actions: const [
        Icon(Icons.more_vert_outlined),
      ],
    ); // Your custom widget implementation.
  }
}
