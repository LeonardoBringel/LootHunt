import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/login_text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
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
              label: 'Email',
              controller: emailController,
              isPassword: false,
            ),
            LoginTextFieldWidget(
              label: 'Password',
              controller: passwordController,
              isPassword: true,
            ),
            const _SignupButtonWidget(),
            _LoginButtonWidget(
              emailController: emailController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}

class _SignupButtonWidget extends StatelessWidget {
  const _SignupButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextButton(
        child: Text(
          'Sign up',
          style: theme.textTheme.subtitle2!
              .copyWith(decoration: TextDecoration.underline),
        ),
        onPressed: () => Navigator.pushNamed(context, 'Signup'),
      ),
    );
  }
}

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height / 10),
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width / 4, 0, size.width / 4, 0),
          child: Text(
            'Login',
            style: theme.textTheme.button,
          ),
        ),
        onPressed: () async => _login(context),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    final theme = Theme.of(context);

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((value) => Navigator.popAndPushNamed(context, 'Home'));
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
