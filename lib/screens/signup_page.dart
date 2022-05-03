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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
        child: Column(
          children: [
            Container(padding: const EdgeInsets.only(top: 30)),
            const FlutterLogo(size: 128),
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
        onPressed: () => Navigator.popAndPushNamed(context, 'Login'),
      ),
    );
  }
}

class _CancelButtonWidget extends StatelessWidget {
  const _CancelButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width / 4, 0, size.width / 4, 0),
          child: Text(
            'Cancel',
            style: theme.textTheme.button,
          ),
        ),
        onPressed: () => Navigator.popAndPushNamed(context, 'Login'),
      ),
    );
  }
}
