import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    Key? key,
    required this.page,
  }) : super(key: key);

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
