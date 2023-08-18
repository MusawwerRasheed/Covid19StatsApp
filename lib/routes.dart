import 'package:flutter/material.dart';
import 'data/models/country_data_model.dart';
import 'presentation/screens/main_page.dart';
import 'presentation/screens/countries_page.dart';
import 'presentation/screens/country_specific_page.dart';
import 'presentation/screens/profile_page.dart';

class AppRoutes {
  static const String main = '/';
  static const String countries = '/countries';
  static const String countrySpecific = '/country_specific';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => const MainPage());
      
      // case countrySpecific:
      //   final countryData = settings.arguments as CountryDataModel;
      //   return MaterialPageRoute(builder: (_) => CountrySpecificPage( countryData, cases: countryData.cases, deaths: countryData.deaths, recovered: countryData.recovered,));
     
      case profile:


        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
