import 'package:flutter/material.dart';

import '../components/login_text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
        child: Column(
          children: [
            Container(padding: const EdgeInsets.only(top: 30)),
            const FlutterLogo(size: 128),
            Container(padding: const EdgeInsets.only(top: 30)),
            const Text('Loot Hunt', style: TextStyle(fontSize: 42)),
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
            const _SigninButtonWidget(),
            const _LoginButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _SigninButtonWidget extends StatelessWidget {
  const _SigninButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextButton(
        child: const Text('Sign in'),
        onPressed: () => Navigator.popAndPushNamed(context, 'Signin'),
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 200),
      child: ElevatedButton(
        child: const Text('Login'),
        onPressed: () => Navigator.popAndPushNamed(context, 'Home'),
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
