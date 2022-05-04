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
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
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
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextButton(
        child: Text(
          'Sign up',
          style: theme.textTheme.subtitle2,
        ),
        onPressed: () => Navigator.popAndPushNamed(context, 'Signup'),
      ),
    );
  }
}

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 200),
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width / 4, 0, size.width / 4, 0),
          child: Text(
            'Login',
            style: theme.textTheme.button,
          ),
        ),
        onPressed: () => Navigator.popAndPushNamed(context, 'Home'),
      ),
    );
  }
}
