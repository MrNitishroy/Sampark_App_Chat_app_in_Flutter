import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/Controller/AuthController.dart';
import 'package:sampark/Pages/Auth/ForgotPassword.dart';
import 'package:sampark/Widget/PrimaryButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        const SizedBox(height: 40),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(
              Icons.alternate_email_rounded,
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: password,
          decoration: const InputDecoration(
            hintText: "Passowrd",
            prefixIcon: Icon(
              Icons.password_outlined,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.to(ForgotPassword());
              },
              child: Text("Forgot Password ? ",
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            )
          ],
        ),
        const SizedBox(height: 60),
        Obx(
          () => authController.isLoading.value
              ? CircularProgressIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      ontap: () {
                        authController.login(
                          email.text,
                          password.text,
                        );
                      },
                      btnName: "LOGIN",
                      icon: Icons.lock_open_outlined,
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
