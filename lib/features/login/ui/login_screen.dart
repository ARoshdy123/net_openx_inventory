import 'package:flutter/material.dart';
import 'package:net_openx_inventory/features/login/ui/widget/login_form.dart';
import 'package:net_openx_inventory/features/login/ui/widget/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  /* child: BlocListener<LoginCubit, LoginState>(
          listenWhen: (previous, current) =>
              current is Loading || current is Error || current is Success,
          listener: (context, state) {
            debugPrint('Login state: $state');
            state.maybeWhen(
                loading: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
                success: (data) {
                  // Clear the navigation stack and push home screen
                  context.pushReplacementNamed(
                    'home',
                  );
                },
                error: (error) {
                  // Pop loading dialog first if it's showing
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }

                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  );
                },
                orElse: () {});
          }, */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 56.0,
            left: 24.0,
            bottom: 24.0,
            right: 24.0,
          ),
          child: Column(
            children: [
              /// Logo, Title &subtitle
              const LoginHeader(),
              const SizedBox(height: 8.0),

              // Login Form
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
