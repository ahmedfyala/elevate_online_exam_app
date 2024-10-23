import 'package:elevate_online_exam_app/features/explore/presentation/explore_screen.dart';
import 'package:elevate_online_exam_app/features/home/presentation/viewmodel/home_state.dart';
import 'package:elevate_online_exam_app/features/profile/presentation/profile_screen.dart';
import 'package:elevate_online_exam_app/features/results/presentation/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_strings.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(HomeInitial());

  int _currentIndex = 0;

  // Expose current index
  int get currentIndex => _currentIndex;

  final List<String> _titles = [
    AppStrings.Survey,
    AppStrings.Results,
    AppStrings.profile,
  ];

  final List<Widget> _screens = [
    const ExploreScreen(),
    ResultsScreen(),
    const ProfileScreen(),
  ];

  String get currentTitle => _titles[_currentIndex];
  Widget get currentScreen => _screens[_currentIndex];

  void updateCurrentIndex(int index) {
    _currentIndex = index;
    emit(HomeStateUpdated());
  }
}
