import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/core/constants/app_colors.dart';
import 'package:boilerplate/core/constants/app_typography.dart';
import 'package:boilerplate/domain/controller/google_login_controller.dart';
import 'package:boilerplate/presentation/common_widgets/custom_roundtextfield.dart';
import 'package:boilerplate/presentation/riverpod/auth_notifier.dart';
import 'package:boilerplate/presentation/riverpod/language_notifier.dart';
import 'package:boilerplate/presentation/routes/app_router.gr.dart';
import 'package:boilerplate/presentation/views/login/common_widgets/richtext_links.dart';
import 'package:boilerplate/presentation/views/login/common_widgets/signbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class Signin extends ConsumerStatefulWidget {
  const Signin({super.key});

  @override
  ConsumerState<Signin> createState() => _SigninState();
}

class _SigninState extends ConsumerState<Signin> {
  final _googleLoginController = GoogleLoginController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final currentLocale = ref.watch(languageNotifierProvider);
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton<Locale>(
                  value: currentLocale,
                  icon: const Icon(Icons.language),
                  onChanged: (Locale? newLocale) {
                    if (newLocale != null && newLocale != currentLocale) {
                      ref
                          .read(languageNotifierProvider.notifier)
                          .changeLanguage(newLocale.languageCode);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: Locale('hi'),
                      child: Text('Hindi'),
                    ),
                    DropdownMenuItem(
                      value: Locale('fr'),
                      child: Text('French'),
                    ),
                    DropdownMenuItem(
                      value: Locale('es'),
                      child: Text('Spanish'),
                    ),
                    DropdownMenuItem(
                      value: Locale('de'),
                      child: Text('German'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.boiPoka,
                  textAlign: TextAlign.center,
                  style: AppTypography.typo40BlackNormal,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    AppLocalizations.of(context)!.signIn,
                    textAlign: TextAlign.center,
                    style: AppTypography.typo16MediumkBold,
                  ),
                ),
                CustomRoundTextfield(
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                  controller: _emailController,
                  title: AppLocalizations.of(context)!.enterYourEmail,
                ),
                CustomRoundTextfield(
                  isObscure: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                  controller: _passController,
                  title: AppLocalizations.of(context)!.enterPassword,
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Divider(thickness: 2)),
                    Text(AppLocalizations.of(context)!.or,
                        style: AppTypography.typo16MediumkBold),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Divider(thickness: 2)),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    circularIcon(Icons.g_mobiledata, () {
                      _googleLoginController.signInWithGoogle(context);
                    }),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SignButton(
                      text: AppLocalizations.of(context)!.signIn,
                      onPressed: () {
                        context.pushRoute(BookDetails());
                        if (_formKey.currentState!.validate()) {
                          final email = _emailController.text;
                          final password = _passController.text;

                          final authNotifier = ref.read(authProvider.notifier);
                          authNotifier.authenticate(email, password);

                          final authState = ref.read(authProvider);

                          if (authState.isAuthenticated) {
                            context.router.push(BookDetails());
                          } else {
                            _showErrorDialog(context);
                          }
                        }
                      },
                      backgroundColor: AppColors.buttoncolor,
                      textStyle: AppTypography.typo20DarkBold,
                    ),
                    const SizedBox(height: 20),
                    RichTextLinks(
                      prefixText:
                          AppLocalizations.of(context)!.donthaveanaccount,
                      actionText: AppLocalizations.of(context)!.signUp,
                      prefixStyle: AppTypography.typo14greyRegular,
                      actionStyle: AppTypography.typo14blueBold,
                      onActionTap: () {
                        context.router.push(const SignUp());
                      },
                    ),
                    RichTextLinks(
                      prefixText:
                          AppLocalizations.of(context)!.forgotyourpassword,
                      actionText: AppLocalizations.of(context)!.reset,
                      prefixStyle: AppTypography.typo14greyRegular,
                      actionStyle: AppTypography.typo14blueBold,
                      onActionTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
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

  Widget circularIcon(IconData icon, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(icon),
      ),
    );
  }
}
