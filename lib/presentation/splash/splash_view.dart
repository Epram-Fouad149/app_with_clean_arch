import 'dart:async';

import 'package:app_with_clean_arch/app/app_prefs.dart';
import 'package:app_with_clean_arch/app/di.dart';
import 'package:app_with_clean_arch/presentation/resources/assets_manager.dart';
import 'package:app_with_clean_arch/presentation/resources/color_manager.dart';
import 'package:app_with_clean_arch/presentation/resources/constants_manager.dart';
import 'package:app_with_clean_arch/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              // navigate to main screen
              Navigator.pushReplacementNamed(context, Routes.mainRoute)
            }
          else
            {
              _appPreferences.isOnBoardingScreenViewed().then((isOnBoardingScreenViewed) => {
                    if (isOnBoardingScreenViewed)
                      {
                        // navigate to login screen

                        Navigator.pushReplacementNamed(context, Routes.loginRoute)
                      }
                    else
                      {
                        // navigate to onboarding screen

                        Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
                      }
                  })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
