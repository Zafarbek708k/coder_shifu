import 'dart:developer';

import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/routes/app_route_name.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/storage/app_storage.dart';
import '../../../../core/storage/sheared_preferens.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_textfield_widget.dart';

class AuthLogin extends ConsumerWidget {
  const AuthLogin({super.key});

  static final _formKey = GlobalKey<FormState>();
  static TextEditingController ctrlEmail = TextEditingController();
  static TextEditingController ctrlPassword = TextEditingController();

  Future<bool> checking({required String email, required String password}) async {
    String? emailResult = await StorageService.loadData(key: StorageKey.userEmail);
    String? passwordResult = await StorageService.loadData(key: StorageKey.userPassword);
    if (emailResult != null && passwordResult != null && emailResult == email && passwordResult == password) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    SizedBox(height: 170, child: SvgPicture.asset("assets/svg/login.svg")),
                    const Spacer(flex: 1),
                    CustomTextWidget(
                      "Login",
                      textAlign: TextAlign.center,
                      fontSize: 24,
                      textColor: context.appTheme.secondary,
                    ),
                    CustomTextFieldWidget(
                      hintText: "Email",
                      controller: ctrlEmail,
                    ),
                    CustomTextFieldWidget(
                      hintText: "Password",
                      controller: ctrlPassword,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.push("${AppRouteName.login}/${AppRouteName.forgetPassword}");
                          },
                          child: CustomTextWidget(
                            "Forgot Password",
                            textColor: context.appTheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                    AuthButton(
                        title: "Login",
                        onPressed: () async {
                          bool res = await checking(email: ctrlEmail.text, password: ctrlPassword.text);
                          log("user can login $res");
                          if (res) {
                            ctrlEmail.clear();
                            ctrlPassword.clear();
                            context.go(AppRouteName.subject);
                          } else {
                            ctrlEmail.clear();
                            ctrlPassword.clear();
                          }
                        }),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.push("${AppRouteName.login}/${AppRouteName.register}");
                          },
                          child: CustomTextWidget(
                            "Don't have an account?",
                            textColor: context.appTheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
