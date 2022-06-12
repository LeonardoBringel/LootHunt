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
            const _ConfirmButtonWidget(),
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
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
