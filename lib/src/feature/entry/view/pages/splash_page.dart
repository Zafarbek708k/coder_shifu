import "dart:async";
import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:coder_shifu/src/core/constants/context_extension.dart";
import "package:coder_shifu/src/core/storage/app_storage.dart";
import "../../../../core/routes/app_route_name.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final String? enterUser;

  Future<bool?> isEnterUser() async {
    enterUser = await AppStorage.$read(key: StorageKey.enter);
    log(enterUser ?? "enter user = null");
    if (enterUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void didChangeDependencies() async {
    bool? a = await isEnterUser();
    log("a ==  $a");
    Timer(const Duration(seconds: 2), () {
      if (a != null && a == true) {
        context.go(AppRouteName.home);
      } else {
        context.go(AppRouteName.welcomePage);
      }
    });
    super.didChangeDependencies();
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
              Container(
                height: 150.h,
                width: 150.h,
                decoration: BoxDecoration(
                  color: context.appTheme.primary,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: context.appTheme.secondary),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/app_logo.png"),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              Text("Movie App", style: context.appTextStyle.bodyLarge),


            ],
          ),
        ),
      ),
    );
  }
}

/// Example of using color them and locale

///     Text(
//                 context.localized.welcome3description,
//                 style: context.appTextStyle.bodyMedium,
//               ),
//               MaterialButton(
//                 onPressed: () async {
//                   themeController.switchTheme(); // Using the shared instance
//                 },
//                 shape: const StadiumBorder(side: BorderSide(color: Colors.orangeAccent)),
//                 child: Text(
//                   "switch them",
//                   style: TextStyle(color:  Theme.of(context).colorScheme.secondary),
//                 ),
//               ),
//
//               MaterialButton(
//                 onPressed: () async {
//                   localController.changeLocal(LangCodes.en);
//                 },
//                 shape: const StadiumBorder(side: BorderSide(color: Colors.orangeAccent)),
//                 child: Text(
//                   "switch Lang",
//                   style: TextStyle(color:  Theme.of(context).colorScheme.secondary),
//                 ),
//               ),
//
