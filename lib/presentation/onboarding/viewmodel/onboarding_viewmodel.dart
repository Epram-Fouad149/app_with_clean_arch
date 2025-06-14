import 'dart:async';

import 'package:app_with_clean_arch/domain/model/models.dart';
import 'package:app_with_clean_arch/presentation/base/base_viewmodel.dart';
import 'package:app_with_clean_arch/presentation/resources/assets_manager.dart';
import 'package:app_with_clean_arch/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingViewModel extends BaseViewModel implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers outputs
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //OnBoarding ViewModel Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //OnBoarding ViewModel outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
            AppStrings.onBoardingTitle1.tr(), AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1.tr()),
        SliderObject(
            AppStrings.onBoardingTitle2.tr(), AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2.tr()),
        SliderObject(
            AppStrings.onBoardingTitle3.tr(), AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3.tr()),
        SliderObject(
            AppStrings.onBoardingTitle4.tr(), AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4.tr()),
      ];
}

// inputs mean that "Orders" that our view model will receive from view
abstract class OnBoardingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe left
  int goPrevious(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
