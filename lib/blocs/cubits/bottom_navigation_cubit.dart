
import 'package:covid19api/blocs/states/bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid19api/blocs/states/bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavigationTab {
  home,
  countries,
  profile,
}

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationHome());

  void showHome() {
    emit(BottomNavigationHome());
  }

  void showCountries() {
    emit(BottomNavigationCountries());
  }

  void showProfile() {
    emit(BottomNavigationProfile());
  }
}
