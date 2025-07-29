import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 100, image: AssetImage("assets/images/logo.png")),
        Text(
          'Welcome Back,',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8.0),
        Text(
          'This application powered by Nets',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
