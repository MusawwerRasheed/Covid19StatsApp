import 'package:covid19api/blocs/states/global_data_state.dart';
import 'package:covid19api/data/models/global_data_model.dart';
import 'package:covid19api/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

class GlobalDataCubit extends Cubit<GlobalDataState> {
  final Repository repository;

  GlobalDataCubit(this.repository) : super(GlobalDataInitial());
  
  Future<void> fetchGlobalData() async {
    
    try {
      final GlobalDataModel data = await repository.fetchGlobalData();
      emit(GlobalDataLoaded(data));
     
    }
     catch (e) {
    
      emit(GlobalDataError("Failed to fetch globalct data. Please try again."));
    }
  }

  
}

 




 