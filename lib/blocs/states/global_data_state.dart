import '../../data/models/global_data_model.dart';

class GlobalDataState {}

class GlobalDataInitial extends GlobalDataState {}
  
  
  class GlobalDataLoaded extends GlobalDataState {
  final GlobalDataModel globalData; 

  GlobalDataLoaded(this.globalData);


}

class GlobalDataError extends GlobalDataState {
  final String errorMessage;

  GlobalDataError(this.errorMessage);
}

