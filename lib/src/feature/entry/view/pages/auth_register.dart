import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/storage/app_storage.dart';
import 'package:coder_shifu/src/core/storage/sheared_preferens.dart';
import 'package:coder_shifu/src/feature/entry/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_route_name.dart';
import '../../../../core/widgets/text_widget.dart';
import '../widgets/custom_textfield_widget.dart';
import 'auth_login.dart';

class AuthRegister extends ConsumerWidget {
  const AuthRegister({super.key});

  static TextEditingController emailCtr = TextEditingController();
  static TextEditingController passwordCtr = TextEditingController();
  static TextEditingController nameCtr = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

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
                    SizedBox(height: 200, child: SvgPicture.asset("assets/svg/Sign up-bro.svg")),
                    const Spacer(flex: 1),
                    CustomTextWidget(
                      "Register",
                      textAlign: TextAlign.center,
                      fontSize: 24,
                      textColor: context.appTheme.secondary,
                    ),
                    const Spacer(flex: 1),
                    CustomTextFieldWidget(
                      hintText: "Email",
                      controller: emailCtr,
                    ),
                    CustomTextFieldWidget(
                      hintText: "Password",
                      controller: passwordCtr,
                    ),
                    CustomTextFieldWidget(
                      hintText: "Full Name",
                      controller: nameCtr,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: CustomTextWidget(
                            "Have an account?",
                            textColor: context.appTheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                    AuthButton(
                      title: "Register",
                      onPressed: ()async{
                        await StorageService.storeData(key: StorageKey.userName, value: nameCtr.text);
                        await StorageService.storeData(key: StorageKey.userEmail, value: emailCtr.text);
                        await StorageService.storeData(key: StorageKey.userPassword, value: passwordCtr.text);
                        nameCtr.clear();
                        emailCtr.clear();
                        passwordCtr.clear();
                        context.go(AppRouteName.subject);
                      },
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
