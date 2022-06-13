import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/login_text_field_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, size: 32),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
        child: Column(
          children: [
            Container(padding: const EdgeInsets.only(top: 30)),
            Image.asset('assets/images/large_fantasy_parchment.png'),
            Container(padding: const EdgeInsets.only(top: 30)),
            Text(
              'Loot Hunt',
              style: theme.textTheme.headline3,
            ),
            Container(padding: const EdgeInsets.only(bottom: 60)),
            LoginTextFieldWidget(
              label: 'Username',
              controller: usernameController,
              isPassword: false,
            ),
            LoginTextFieldWidget(
              label: 'Password',
              controller: passwordController,
              isPassword: true,
            ),
            LoginTextFieldWidget(
              label: 'Email',
              controller: emailController,
              isPassword: false,
            ),
            _ConfirmButtonWidget(
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}

class _ConfirmButtonWidget extends StatelessWidget {
  const _ConfirmButtonWidget({
    Key? key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width / 4, 0, size.width / 4, 0),
          child: Text(
            'Confirm',
            style: theme.textTheme.button,
          ),
        ),
        onPressed: () async => _signup(context),
      ),
    );
  }

  Future<void> _signup(
    BuildContext context,
  ) async {
    final theme = Theme.of(context);

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then(
        (value) {
          FirebaseFirestore.instance.collection('users').add(
            {
              'uid': value.user!.uid.toString(),
              'username': usernameController.text
            },
          );
          Navigator.pop(context);
        },
      );
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.code.toString(),
            style: theme.textTheme.bodyText1,
          ),
          backgroundColor: theme.colorScheme.background,
        ),
      );
    }
  }
}
