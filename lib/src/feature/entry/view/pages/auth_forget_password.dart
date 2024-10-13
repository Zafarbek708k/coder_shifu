import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:coder_shifu/src/feature/entry/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_textfield_widget.dart';

class AuthForgetPassword extends ConsumerWidget {
  const AuthForgetPassword({super.key});

  static final _formKey = GlobalKey<FormState>();

  static TextEditingController ctrlEmail = TextEditingController();
  static TextEditingController ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                SizedBox(
                    height: 220,
                    child: SvgPicture.asset("assets/svg/Forgot password-bro.svg")),
                const CustomTextWidget(
                  "Forget password",
                  textAlign: TextAlign.center,
                  fontSize: 24,
                ),
                const Spacer(flex: 2),
                CustomTextFieldWidget(
                  hintText: "Email",
                  controller: ctrlEmail,
                ),
                CustomTextFieldWidget(
                  hintText: "Password",
                  controller: ctrlPassword,
                ),
                const Spacer(flex: 1),
                AuthButton(
                  title: "Send Code",
                  onPressed: () {
                    context.pop();
                  },
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
