import 'package:covid19api/blocs/states/search_states.dart';
import 'package:covid19api/data/models/country_data_model.dart';
import 'package:covid19api/data/models/country_model.dart';
import 'package:covid19api/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
 



class SearchCubit extends Cubit<SearchState> {
  final Repository repository;

  SearchCubit(this.repository) : super(SearchInitial());

  Future<void> searchCountries(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());


    try {
      final CountryDataModel result = await repository.searchCountries(query);
      print('search cubit result : $result');
      emit(SearchResults(result));
    } catch (e) {
      emit(SearchError("Failed to perform search. Please try again."));
    }
  }
}
