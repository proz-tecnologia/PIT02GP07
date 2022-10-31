// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Adicionar receita/despesa',
      elevation: 12.0,
      onPressed: () {},
      child: const Icon(
        size: 35.0,
        Icons.add,
      ),
    );
  }
}
