import "dart:async";
import "dart:developer";
import "package:coder_shifu/src/core/widgets/text_widget.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:coder_shifu/src/core/constants/context_extension.dart";
import "package:coder_shifu/src/core/storage/app_storage.dart";
import "package:lottie/lottie.dart";
import "../../../../core/routes/app_route_name.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? enterUser;

  Future<bool?> isEnterUser() async {
    enterUser = await AppStorage.$read(key: StorageKey.enter);
    log("enterUser ==  ${enterUser!}");
    if (enterUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    navigateToNextPage();
  }

  void navigateToNextPage() async {
    bool? isEntered = await isEnterUser();
    Timer(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          if (isEntered == true) {
            context.go(AppRouteName.subject);
          } else {
            context.go(AppRouteName.welcomePage);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 50),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset('assets/lottie/splash.json'),
              CustomTextWidget(
                "Code Guide",
                textColor: context.appTheme.onSecondary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
