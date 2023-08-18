
import '../../data/models/country_data_model.dart';

abstract class CountryDataState {
  get country => 'country';

  get cases => 23;

  get deaths => 44;

  get recovered => 1;
 
   
}

class CountryDataInitial extends CountryDataState {}

class CountryDataLoaded extends CountryDataState {
  final List<CountryDataModel> countryDataList;

  CountryDataLoaded(this.countryDataList);
}

class CountryDataError extends CountryDataState {
  final String errorMessage;

  CountryDataError(this.errorMessage);
}

