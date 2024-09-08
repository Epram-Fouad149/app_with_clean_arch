
import 'dart:async';

import 'package:app_with_clean_arch/presentation/resources/assets_manager.dart';
import 'package:app_with_clean_arch/presentation/resources/color_manager.dart';
import 'package:app_with_clean_arch/presentation/resources/constants_manager.dart';
import 'package:app_with_clean_arch/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(  const Duration(seconds: AppConstants.splashDelay), _goNext);
  }


  void _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
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
