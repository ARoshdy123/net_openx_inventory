import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_cubit.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_state.dart';
import 'package:net_openx_inventory/features/login/ui/widget/login_header.dart';
import 'package:net_openx_inventory/features/login/ui/widget/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final formKey = GlobalKey<FormState>();
late TextEditingController netsisUserController;
late TextEditingController netsisPasswordController;
late TextEditingController dbNameController;
late TextEditingController dbUserController;
late TextEditingController dbPasswordController;
late TextEditingController branchCodeController;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    netsisUserController = TextEditingController();
    netsisPasswordController = TextEditingController();
    dbNameController = TextEditingController();
    dbUserController = TextEditingController();
    dbPasswordController = TextEditingController();
    branchCodeController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    netsisUserController.dispose();
    netsisPasswordController.dispose();
    dbNameController.dispose();
    dbUserController.dispose();
    dbPasswordController.dispose();
    branchCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(

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
                '/homeScreen',
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
      },
  child: Scaffold(body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
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

                // Netsis User
                CTextFormField(
                  labelText: 'Netsis User',
                  controller: netsisUserController,
                  prefixIcon: Icon(Iconsax.direct_right, size: 24),
                  validator:
                      (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 8),

                // Netsis Password
                CTextFormField(
                  labelText: 'Netsis Password',
                  controller: netsisPasswordController,
                  isPassword: true,
                  prefixIcon: Icon(Iconsax.password_check, size: 24),
                  validator:
                      (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 8),

                // DB Name
                CTextFormField(
                  labelText: 'DB Name',
                  controller: dbNameController,
                  prefixIcon: Icon(Iconsax.direct_right, size: 24),
                  validator:
                      (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 8),

                // DB User
                CTextFormField(
                  labelText: 'DB User',
                  controller: dbUserController,
                  prefixIcon: Icon(Iconsax.direct_right, size: 24),
                  validator:
                      (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 8),

                // DB Password
                CTextFormField(
                  labelText: 'DB Password',
                  controller: dbPasswordController,
                  isPassword: true,
                  prefixIcon: Icon(Iconsax.password_check, size: 24),
                  validator:
                      (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 8),

                // Branch Code
                CTextFormField(
                  labelText: 'Branch Code',
                  controller: branchCodeController,
                  prefixIcon: Icon(Iconsax.direct_right, size: 24),
                  validator:
                      (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 8),

                /// Sign in button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().emitLoginState(
                          netsisUserController.text,
                          netsisPasswordController.text,
                          dbNameController.text,
                          dbUserController.text,
                          dbPasswordController.text,
                          branchCodeController.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: const Color(0xFFF6F6F6),
                      backgroundColor: const Color(0xFF4b68ff),
                      disabledForegroundColor: const Color(0xFF939393),
                      disabledBackgroundColor: const Color(0xFFC4C4C4),
                      side: const BorderSide(color: Color(0xFF4b68ff)),
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Log in'),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    ),

    ),
);
  }
}




///   netUser    : 
///   netPassword: 
///   dbName     : 
///   dbUser     : 
///   dbPassword : 
///   branchCode : 
