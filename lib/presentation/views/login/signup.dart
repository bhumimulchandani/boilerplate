import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/core/constants/app_colors.dart';
import 'package:boilerplate/core/constants/app_typography.dart';
import 'package:boilerplate/core/utils/validation_utils.dart';
import 'package:boilerplate/presentation/common_widgets/custom_roundtextfield.dart';
import 'package:boilerplate/presentation/routes/app_router.gr.dart';
import 'package:boilerplate/presentation/views/login/common_widgets/richtext_links.dart';
import 'package:boilerplate/presentation/views/login/common_widgets/signbutton.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
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
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "SIGN UP",
                        style: AppTypography.typo16MediumkBold,
                      ),
                    ),
                    CustomRoundTextfield(
                      validator: () {
                        return ValidationUtils.isNotEmpty(_nameController.text);
                      },
                      controller: _nameController,
                      title: "Full Name",
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
                  ],
                )),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SignButton(
                    text: "REGISTER",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigator.pushNamed(context, AppRoutes.bookdetails);
                      }
                    },
                    backgroundColor: AppColors.buttoncolor,
                    textStyle: AppTypography.typo20DarkBold,
                  ),
                  RichTextLinks(
                    prefixText: "Already have an account? ",
                    actionText: "Sign In",
                    prefixStyle: AppTypography.typo14greyRegular,
                    actionStyle: AppTypography.typo14blueBold,
                    onActionTap: () {
                      // const userID = 1;
                      // const username = 'DUMMY USER ';

                      // print('UserID: $userID');
                      // print('Username: $username');

                      // context.pushRoute(
                      //   const PageRouteInfo(
                      //     'DummyRoute',
                      //     args: DummyRouteArgs(
                      //       userID: userID,
                      //       username: username,
                      //     ),
                      //   ),
                      // );
                      context.router.push(const Signin());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:auto_route/annotations.dart';
// import 'package:boilerplate/core/constants/app_colors.dart';
// import 'package:boilerplate/core/constants/app_routes.dart';
// import 'package:boilerplate/presentation/provider/themeprovider.dart';
// import 'package:boilerplate/presentation/views/login/common_widgets/richtext_links.dart';
// import 'package:boilerplate/presentation/views/login/common_widgets/signbutton.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:boilerplate/core/constants/app_typography.dart';
// import 'package:boilerplate/core/utils/validation_utils.dart';
// import 'package:boilerplate/presentation/common_widgets/custom_roundtextfield.dart';


// @RoutePage()
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         // title: const Text("Sign Up"),
//         automaticallyImplyLeading: false,
//         actions: [
//           Switch(
//             value: themeProvider.themeMode == ThemeMode.dark,
//             onChanged: (value) {
//               themeProvider.toggleTheme(value);
//             },
//           ),
//         ],
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("BOI-POKA", style: AppTypography.typo40BlackNormal),
//                   const SizedBox(height: 10),
//                   Text("SIGN UP", style: AppTypography.typo16MediumkBold),
//                   CustomRoundTextfield(
//                     validator: () =>
//                         ValidationUtils.isNotEmpty(_nameController.text),
//                     controller: _nameController,
//                     title: "Full Name",
//                   ),
//                   CustomRoundTextfield(
//                     validator: () =>
//                         ValidationUtils.validateEmail(_emailController.text),
//                     controller: _emailController,
//                     title: "Enter Your Email Id",
//                   ),
//                   CustomRoundTextfield(
//                     isObscure: true,
//                     validator: () =>
//                         ValidationUtils.validatePassword(_passController.text),
//                     controller: _passController,
//                     title: "Password",
//                   ),
//                 ],
//               ),
//             ),
//             const Divider(thickness: 2),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SignButton(
//                       text: "REGISTER",
//                       onPressed: () {
//                         // if (_formKey.currentState!.validate()) {
//                         //   Navigator.pushNamed(context, AppRoutes.bookdetails);
//                         // }
//                       },
//                       backgroundColor: AppColors.buttoncolor,
//                       textStyle: AppTypography.typo20DarkBold,
//                     ),
//                     RichTextLinks(
//                       prefixText: "Already have an account? ",
//                       actionText: "Sign In",
//                       prefixStyle: AppTypography.typo14greyRegular,
//                       actionStyle: AppTypography.typo14blueBold,
//                       onActionTap: () {
//                          Navigator.pushReplacementNamed(
//                             context, AppRoutes.signIn);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
