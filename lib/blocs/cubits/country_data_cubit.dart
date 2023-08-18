
import 'package:covid19api/blocs/states/country_data_state.dart';
import 'package:covid19api/data/models/country_data_model.dart';
import 'package:covid19api/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

class CountryDataCubit extends Cubit<CountryDataState> {
  final Repository repository;

  CountryDataCubit(this.repository) : super(CountryDataInitial());

  Future<void> fetchCountryData() async {
    
   
    try 
    {

      final List<CountryDataModel> data = await repository.fetchCountryData();
   
      emit(CountryDataLoaded(data));

    } 
    
    catch (e) {
      emit(CountryDataError("Failed to fetch country data. Please try again."));
    }
  }
}


 
