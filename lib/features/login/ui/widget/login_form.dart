import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:net_openx_inventory/features/login/ui/widget/text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

late TextEditingController netsisUserController;
late TextEditingController netsisPasswordController;
late TextEditingController dbNameController;
late TextEditingController dbUserController;
late TextEditingController dbPasswordController;
late TextEditingController branchCodeController;
final formKey = GlobalKey<FormState>();

class _LoginFormState extends State<LoginForm> {
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
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
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

            ///Sign in button
            //         SizedBox(
            //             width: double.infinity,
            //             child: ElevatedButton(
            //                 onPressed: () {context.read<LoginCubit>().login(username, password);},style: ElevatedButton.styleFrom(
            // elevation: 0,
            // foregroundColor: TColors.light,
            // backgroundColor: TColors.primary,
            // disabledForegroundColor: TColors.darkGrey,
            // disabledBackgroundColor: TColors.buttonDisabled,
            // side: const BorderSide(color: TColors.primary),
            // padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
            // textStyle: const TextStyle(fontSize: 16, color: TColors.textWhite, fontWeight: FontWeight.w600),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            //                 child: const Text('Log in'))),
            //         const SizedBox(height: 8),

            ///Create account button
            // SizedBox(
            //     width: double.infinity,
            //     child: OutlinedButton(
            //         onPressed: () => Get.to(() => const SignUpScreen()),
            //         child: const Text(TTexts.createAccount))),
          ],
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




/*import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:net_openx_inventory/features/login/ui/widget/text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

late TextEditingController netsisUserController;
late TextEditingController netsisPasswordController;
late TextEditingController dbNameController;
late TextEditingController dbUserController;
late TextEditingController dbPasswordController;
late TextEditingController branchCodeController;
final formKey = GlobalKey<FormState>();

class _LoginFormState extends State<LoginForm> {
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
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
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

            ///Sign in button
            //         SizedBox(
            //             width: double.infinity,
            //             child: ElevatedButton(
            //                 onPressed: () {context.read<LoginCubit>().login(username, password);},style: ElevatedButton.styleFrom(
            // elevation: 0,
            // foregroundColor: TColors.light,
            // backgroundColor: TColors.primary,
            // disabledForegroundColor: TColors.darkGrey,
            // disabledBackgroundColor: TColors.buttonDisabled,
            // side: const BorderSide(color: TColors.primary),
            // padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
            // textStyle: const TextStyle(fontSize: 16, color: TColors.textWhite, fontWeight: FontWeight.w600),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            //                 child: const Text('Log in'))),
            //         const SizedBox(height: 8),

            ///Create account button
            // SizedBox(
            //     width: double.infinity,
            //     child: OutlinedButton(
            //         onPressed: () => Get.to(() => const SignUpScreen()),
            //         child: const Text(TTexts.createAccount))),
          ],
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
 ///   branchCode :  */