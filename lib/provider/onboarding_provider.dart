import 'package:flutter/material.dart';
import 'package:handies/data/model/response/base/api_response.dart';
import 'package:handies/data/model/response/onboarding_model.dart';
import 'package:handies/data/repository/onboarding_repo.dart';
import 'package:handies/helper/api_checker.dart';

class OnBoardingProvider with ChangeNotifier {
  final OnBoardingRepo onboardingRepo;

  OnBoardingProvider({@required this.onboardingRepo});

  List<OnboardingModel> _onBoardingList = [];
  List<OnboardingModel> get onBoardingList => _onBoardingList;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  changeSelectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void initBoardingList(BuildContext context) async {
    ApiResponse apiResponse = await onboardingRepo.getOnBoardingList(context);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _onBoardingList.clear();
      _onBoardingList.addAll(apiResponse.response.data);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }
}
