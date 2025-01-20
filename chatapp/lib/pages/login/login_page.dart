import 'package:chatapp/service/auth/auth_service.dart';
import 'package:chatapp/pages/login/widgets/my_button.dart';
import 'package:chatapp/pages/login/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  LoginPage({super.key});

  void login(BuildContext context) async {
    final authService = AuthService();

    try{
      await authService.signInWithEmailPassword(
          _emailController.text,
          _pwController.text
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Email or password incorrect"),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.background,
            ])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            "Log in to Chatbox",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 70),

                          // Email Label
                          Text(
                            "Your email",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Email Input Field
                          MyTextfield(
                            hint: "Enter your email",
                            textController: _emailController,
                          ),
                          const SizedBox(height: 20),

                          // Password Label
                          Text(
                            "Your password",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Password Input Field
                          MyTextfield(
                            hint: "Enter your password",
                            obscure: true,
                            isSuffixIcon: true,
                            textController: _pwController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Bottom Button with padding
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: MyButton(
                      onTap: (){
                        login(context);
                      },
                      text: "Login"
                  ),
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
