import 'package:flutter/material.dart';


class HomeEmptyStateWidget extends StatelessWidget {
  const HomeEmptyStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Voce ainda não tem transações cadastradas.'),
        ],
      ),
    );
  }
}
