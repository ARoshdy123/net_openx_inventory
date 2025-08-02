import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:net_openx_inventory/core/helpers/shared_pref_helper.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_cubit.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_state.dart';
import 'package:net_openx_inventory/features/login/ui/widget/login_header.dart';
import 'package:net_openx_inventory/features/login/ui/widget/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController netsisUserController;
  late final TextEditingController netsisPasswordController;
  // late final TextEditingController dbNameController;
  // late final TextEditingController dbUserController;
  // late final TextEditingController dbPasswordController;
  // late final TextEditingController branchCodeController;
  bool _rememberMe = false;
  @override
  void initState() {
    netsisUserController = TextEditingController();
    netsisPasswordController = TextEditingController();
    // dbNameController = TextEditingController();
    // dbUserController = TextEditingController();
    // dbPasswordController = TextEditingController();
    // branchCodeController = TextEditingController();
    _loadSavedCredentials();

    super.initState();
  }

  Future<void> _loadSavedCredentials() async {
    final remember = await SharedPrefHelper.getBool(SharedPrefKeys.rememberMe) ?? false;
    if (remember) {
      setState(() => _rememberMe = true);
     netsisUserController.text = await SharedPrefHelper.getString(SharedPrefKeys.netsisUser) ?? '';
     netsisPasswordController.text = await SharedPrefHelper.getString(SharedPrefKeys.netsisPassword) ?? '';
     // dbNameController.text = await SharedPrefHelper.getString(SharedPrefKeys.dbName) ?? '';
     // dbUserController.text = await SharedPrefHelper.getString(SharedPrefKeys.dbUser) ?? '';
     // dbPasswordController.text = await SharedPrefHelper.getString(SharedPrefKeys.dbPassword) ?? '';
     // branchCodeController.text = await SharedPrefHelper.getString(SharedPrefKeys.branchCode) ?? '';
    }
  }

  @override
  void dispose() {
   netsisUserController.dispose();
   netsisPasswordController.dispose();
   // dbNameController.dispose();
   // dbUserController.dispose();
   // dbPasswordController.dispose();
   // branchCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: context.read<LoginCubit>(),
      listener: (context, state)  {debugPrint('state is $state');
        state.maybeWhen(
          loading: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          ),
          success: (data) async {
            await SharedPrefHelper.setData(SharedPrefKeys.rememberMe, _rememberMe);
            if (_rememberMe) {
              await SharedPrefHelper.setData(SharedPrefKeys.netsisUser, netsisUserController.text);
              await SharedPrefHelper.setData(SharedPrefKeys.netsisPassword, netsisPasswordController.text);
              // await SharedPrefHelper.setData(SharedPrefKeys.dbName, dbNameController.text);
              // await SharedPrefHelper.setData(SharedPrefKeys.dbUser, dbUserController.text);
              // await SharedPrefHelper.setData(SharedPrefKeys.dbPassword, dbPasswordController.text);
              // await SharedPrefHelper.setData(SharedPrefKeys.branchCode, branchCodeController.text);

            } else {
              await SharedPrefHelper.removeData(SharedPrefKeys.netsisUser);
              await SharedPrefHelper.removeData(SharedPrefKeys.netsisPassword);
              // await SharedPrefHelper.removeData(SharedPrefKeys.dbName);
              // await SharedPrefHelper.removeData(SharedPrefKeys.dbUser);
              // await SharedPrefHelper.removeData(SharedPrefKeys.dbPassword);
              // await SharedPrefHelper.removeData(SharedPrefKeys.branchCode);
            }
            context.pushNamed('homeScreen');
          },
          error: (err) {
            if (Navigator.canPop(context)) Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
          },
          orElse: () {},
        );
      },
  child: Scaffold(body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
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

                // // DB Name
                // CTextFormField(
                //   labelText: 'DB Name',
                //   controller: dbNameController,
                //   prefixIcon: Icon(Iconsax.direct_right, size: 24),
                //   validator:
                //       (value) => value == null || value.isEmpty ? 'Required' : null,
                // ),
                // const SizedBox(height: 8),
                //
                // // DB User
                // CTextFormField(
                //   labelText: 'DB User',
                //   controller: dbUserController,
                //   prefixIcon: Icon(Iconsax.direct_right, size: 24),
                //   validator:
                //       (value) => value == null || value.isEmpty ? 'Required' : null,
                // ),
                // const SizedBox(height: 8),
                //
                // // DB Password
                // CTextFormField(
                //   labelText: 'DB Password',
                //   controller: dbPasswordController,
                //   isPassword: true,
                //   prefixIcon: Icon(Iconsax.password_check, size: 24),
                //   validator:
                //       (value) => value == null || value.isEmpty ? 'Required' : null,
                // ),
                // const SizedBox(height: 8),
                //
                // // Branch Code
                // CTextFormField(
                //   labelText: 'Branch Code',
                //   controller: branchCodeController,
                //   prefixIcon: Icon(Iconsax.direct_right, size: 24),
                //   validator:
                //       (value) => value == null || value.isEmpty ? 'Required' : null,
                // ),
                // const SizedBox(height: 8),

                CheckboxListTile(checkColor: Colors.green,
                  value: _rememberMe,
                  onChanged: (v) => setState(() => _rememberMe = v ?? false),
                  title: const Text('Remember me'),
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                /// Sign in button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('button pressed');
                      if (formKey.currentState?.validate() == true) {
                        context.read<LoginCubit>().emitLoginState(
                          netsisUserController.text,
                          netsisPasswordController.text
                          // dbNameController.text,
                          // dbUserController.text,
                          // dbPasswordController.text,
                          // branchCodeController.text,
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
