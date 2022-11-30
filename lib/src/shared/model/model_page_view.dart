import 'package:flutter/material.dart';

class ModelPageView extends StatelessWidget {
  const ModelPageView({
    Key? key,
    required this.page,
  }) : super(key: key);

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return page;
  }
}