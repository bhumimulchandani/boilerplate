import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/core/constants/app_colors.dart';
import 'package:boilerplate/core/constants/app_typography.dart';
import 'package:boilerplate/presentation/riverpod/theme_notifier.dart';
import 'package:boilerplate/presentation/routes/app_router.gr.dart';
import 'package:boilerplate/presentation/views/login/common_widgets/richtext_links.dart';
import 'package:boilerplate/presentation/views/login/common_widgets/signbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                      value: themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        ref.read(themeProvider.notifier).toggleTheme(value);
                      },
                    ),
                  ],
                ),
                Text(
                  "BOI-POKA",
                  textAlign: TextAlign.center,
                  style: AppTypography.typo40BlackNormal,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: AppTypography.typo16MediumkBold,
                  ),
                ),

                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(3),
                  ]),
                ),
                const SizedBox(height: 14),

                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 14),

                FormBuilderTextField(
                  name: 'password',
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Gender',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                FormBuilderRadioGroup<String>(
                  name: 'gender',
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  options: ['Male', 'Female']
                      .map((gender) => FormBuilderFieldOption(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 10),

                // City (Drop-down)
                const Text(
                  'City',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderDropdown<String>(
                  name: 'city',
                  decoration: const InputDecoration(
                    labelText: 'Select City',
                    border: OutlineInputBorder(),
                  ),
                  items:
                      ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Miami']
                          .map((city) => DropdownMenuItem(
                                value: city,
                                child: Text(city),
                              ))
                          .toList(),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 16),

                // Terms and Conditions (Checkbox)
                FormBuilderCheckbox(
                  name: 'accept_terms',
                  title: RichText(
                    text: TextSpan(
                      text: 'I accept the ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'terms and conditions',
                          style: TextStyle(
                              color: Colors.blue.shade900,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  validator: FormBuilderValidators.equal(
                    true,
                    errorText: 'You must accept terms and conditions.',
                  ),
                ),
                const SizedBox(height: 30),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     SizedBox(
                //       width: MediaQuery.sizeOf(context).width * 0.4,
                //       child: const Divider(thickness: 2),
                //     ),
                //     Text(
                //       "OR",
                //       style: AppTypography.typo16MediumkBold,
                //     ),
                //     SizedBox(
                //       width: MediaQuery.sizeOf(context).width * 0.4,
                //       child: const Divider(thickness: 2),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 50), // Space before buttons
                Column(
                  children: [
                    SignButton(
                      text: "REGISTER",
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          final formData = _formKey.currentState?.value;
                          print('Form Data: $formData');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Form Submitted')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill out all fields'),
                            ),
                          );
                        }
                      },
                      backgroundColor: AppColors.buttoncolor,
                      textStyle: AppTypography.typo20DarkBold,
                    ),
                    const SizedBox(height: 20),
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

                const SizedBox(height: 16), // Extra space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final _formKey = GlobalKey<FormBuilderState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: FormBuilder(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Full Name
//                 FormBuilderTextField(
//                   name: 'name',
//                   decoration: const InputDecoration(
//                     labelText: 'Full Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: FormBuilderValidators.compose([
//                     FormBuilderValidators.required(),
//                     FormBuilderValidators.minLength(3),
//                   ]),
//                 ),
//                 const SizedBox(height: 16),

//                 // Email
//                 FormBuilderTextField(
//                   name: 'email',
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: FormBuilderValidators.compose([
//                     FormBuilderValidators.required(),
//                     FormBuilderValidators.email(),
//                   ]),
//                 ),
//                 const SizedBox(height: 16),

//                 // Password
//                 FormBuilderTextField(
//                   name: 'password',
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: FormBuilderValidators.compose([
//                     FormBuilderValidators.required(),
//                     FormBuilderValidators.minLength(6),
//                   ]),
//                 ),
//                 const SizedBox(height: 16),

//                 // Gender (Radio Button)
//                 const Text(
//                   'Gender',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 FormBuilderRadioGroup<String>(
//                   name: 'gender',
//                   decoration: const InputDecoration(
//                     border: InputBorder.none,
//                   ),
//                   options: ['Male', 'Female']
//                       .map((gender) => FormBuilderFieldOption(
//                             value: gender,
//                             child: Text(gender),
//                           ))
//                       .toList(),
//                   validator: FormBuilderValidators.required(),
//                 ),
//                 const SizedBox(height: 16),

//                 // City (Drop-down)
//                 const Text(
//                   'City',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 FormBuilderDropdown<String>(
//                   name: 'city',
//                   decoration: const InputDecoration(
//                     labelText: 'Select City',
//                     border: OutlineInputBorder(),
//                   ),
//                   items:
//                       ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Miami']
//                           .map((city) => DropdownMenuItem(
//                                 value: city,
//                                 child: Text(city),
//                               ))
//                           .toList(),
//                   validator: FormBuilderValidators.required(),
//                 ),
//                 const SizedBox(height: 16),

//                 // Terms and Conditions (Checkbox)
//                 FormBuilderCheckbox(
//                   name: 'accept_terms',
//                   title: RichText(
//                     text: const TextSpan(
//                       text: 'I accept the ',
//                       style: TextStyle(color: Colors.black),
//                       children: [
//                         TextSpan(
//                           text: 'terms and conditions',
//                           style: TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline),
//                         ),
//                       ],
//                     ),
//                   ),
//                   validator: FormBuilderValidators.equal(
//                     true,
//                     errorText: 'You must accept terms and conditions.',
//                   ),
//                 ),
//                 const SizedBox(height: 32),

//                 // Submit Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState?.saveAndValidate() ?? false) {
//                         final formData = _formKey.currentState?.value;
//                         print('Form Data: $formData');
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Form Submitted')),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Please fill out all fields'),
//                           ),
//                         );
//                       }
//                     },
//                     child: const Text('Sign Up'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
