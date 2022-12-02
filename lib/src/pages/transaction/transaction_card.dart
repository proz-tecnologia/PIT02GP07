import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/app_colors.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGray,
        title: const Text('Adicionar transação'),
        leading: const Icon(Icons.arrow_back_rounded),
      ),
      body: Card(
        elevation: 4.0,
        child: Container(
          height: height,
          width: double.infinity,
          alignment: Alignment.center,
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Expanded(
                      child: TextFormField(
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
