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
            LoginTextFieldWidget(
              label: 'Email',
              controller: emailController,
              isPassword: false,
            ),
            const _ConfirmButtonWidget(),
            const _CancelButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _ConfirmButtonWidget extends StatelessWidget {
  const _ConfirmButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: ElevatedButton(
        child: const Text('Confirm'),
        onPressed: () => Navigator.popAndPushNamed(context, 'Login'),
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class _CancelButtonWidget extends StatelessWidget {
  const _CancelButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.popAndPushNamed(context, 'Login'),
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
