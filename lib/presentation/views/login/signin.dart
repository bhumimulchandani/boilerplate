import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/core/constants/app_colors.dart';
import 'package:boilerplate/core/constants/app_typography.dart';
import 'package:boilerplate/core/utils/validation_utils.dart';
import 'package:boilerplate/presentation/common_widgets/custom_roundtextfield.dart';
import 'package:boilerplate/presentation/provider/auth_provider.dart';
import 'package:boilerplate/presentation/routes/app_router.gr.dart';
import 'package:boilerplate/presentation/views/login/common_widgets/richtext_links.dart';
import 'package:boilerplate/presentation/views/login/common_widgets/signbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BOI-POKA",
                    style: AppTypography.typo40BlackNormal,
                  ),
                  Text(
                    "SIGN IN",
                    style: AppTypography.typo16MediumkBold,
                  ),
                  CustomRoundTextfield(
                    validator: () {
                      return ValidationUtils.validateEmail(
                          _emailController.text);
                    },
                    controller: _emailController,
                    title: "Enter Your Email Id",
                  ),
                  CustomRoundTextfield(
                    isObscure: true,
                    validator: () {
                      return ValidationUtils.validatePassword(
                          _passController.text);
                    },
                    controller: _passController,
                    title: "Password",
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: const Divider(
                      thickness: 2,
                    )),
                Text(
                  "OR",
                  style: AppTypography.typo16MediumkBold,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SignButton(
                      text: "SIGN IN",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final authProvider = context.read<AuthProvider>();
                          if (authProvider.validateCredentials(
                              _emailController.text, _passController.text)) {
                            authProvider.authenticate(
                              _emailController.text,
                              _passController.text,
                            );
                            context.router.push(BookDetails());
                          } else {
                            _showErrorDialog(
                                context); 
                          }
                        }
                      },
                      backgroundColor: AppColors.buttoncolor,
                      textStyle: AppTypography.typo20DarkBold,
                    ),
                    RichTextLinks(
                      prefixText: "Don't have an account? ",
                      actionText: "Sign Up",
                      prefixStyle: AppTypography.typo14greyRegular,
                      actionStyle: AppTypography.typo14blueBold,
                      onActionTap: () {
                        context.router.push(const SignUp());
                      },
                    ),
                    RichTextLinks(
                      prefixText: "Forgot your password? ",
                      actionText: "Reset",
                      prefixStyle: AppTypography.typo14greyRegular,
                      actionStyle: AppTypography.typo14blueBold,
                      onActionTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Invalid Credentials"),
          content:
              const Text("The email or password you entered is incorrect."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
