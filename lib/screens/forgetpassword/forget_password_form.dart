// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:schoolmgmt/components/rounded_button.dart';
import 'package:schoolmgmt/screens/signin/signin_screen.dart';
import 'package:schoolmgmt/screens/signup/signup_screen.dart';



class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const Text(
          "Forgot Password",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: emailEditingController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    fillColor: Colors.grey[300]),
                //Lets apply validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedButton(
                  label: "RESET PASSWORD",
                  onPressed: () {
                  })
            ])),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account? "),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                    (route) => false);
              },
              child: const Text("Sign In",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        
      ]),
    );
  }
}
