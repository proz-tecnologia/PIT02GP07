import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/pages/login/login_page.dart';
import 'package:pit02gp07/src/shared/widget/profile_picture.dart';

import '../../shared/widget/text_field_input_widget.dart';
import '../home/home_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomPadding: false,
      backgroundColor: AppColors.darkGray,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.darkGreen,
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: const Text('Registrar usuário.'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        ProfilePicture(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          textFieldInput(
                            label: 'Nome',
                          ),
                          textFieldInput(label: 'Email'),
                          textFieldInput(label: 'Senha', obsureText: true),
                          textFieldInput(
                              label: 'Confirmar Senha', obsureText: true)
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomePage(title: ''),
                              ));
                        },
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(400, 40)),
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.darkGreen),
                            foregroundColor:
                                MaterialStateProperty.all(AppColors.iceWhite),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        child: const Text(
                          'CONFIRMAR',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
