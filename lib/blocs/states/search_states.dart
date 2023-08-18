import 'package:covid19api/data/models/country_data_model.dart';

import '../../data/models/country_model.dart';



 
abstract class SearchState {
  Object? get country => null;
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResults extends SearchState {
  final CountryDataModel result;
 
  SearchResults(this.result);

 
}

class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);
}
