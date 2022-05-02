import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextFieldWidget extends StatelessWidget {
  const LoginTextFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    required this.isPassword,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
        ],
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          labelStyle: const TextStyle(fontSize: 24),
          hintStyle: const TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
