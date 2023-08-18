import 'package:covid19api/data/models/country_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/country_model.dart';
import '../models/global_data_model.dart';

class Repository {
  static const String baseUrl = 'https://disease.sh/v3/covid-19';
  final http.Client httpClient;

  Repository(this.httpClient);

  Future<GlobalDataModel> fetchGlobalData() async {
    final response = await httpClient.get(Uri.parse('$baseUrl/all'));
    if (response.statusCode == 200) {
      print('global api good');
      final json = jsonDecode(response.body);
      return GlobalDataModel.fromJson(json);
    } 
    else {
      print('global api not good'); 
      throw Exception('Failed to fetch global data');
    }
  }

  




  Future<List<CountryDataModel>> fetchCountryData() async {
    final response = await httpClient.get(Uri.parse('$baseUrl/countries'));
    if (response.statusCode == 200) {      
      print('coutnry api good');
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<CountryDataModel> countryDataList =
          jsonList.map((json) => CountryDataModel.fromJson(json)).toList();
      return countryDataList;
    } else {
      print('country api bad'); 
      throw Exception('Failed to fetch country data');
    }
  }

 



Future<CountryDataModel> searchCountries(String query) async {
  final response =
      await httpClient.get(Uri.parse('$baseUrl/countries/$query'));
      print('query is $query'); 
      
  if (response.statusCode == 200) {




    print('search good'); 
    print('---------');
 

    final dynamic jsonData = jsonDecode(response.body);
    print(jsonData['country']);

    
    final CountryDataModel searchResult =  CountryDataModel.fromJson(jsonData);    
     
    return searchResult;

      } 
   
   else
   
    {
   
   throw Exception('Failed to search country');
  }
}














// Future<CountryDataModel> searchCountries(String query) async {
//   final response =
//       await httpClient.get(Uri.parse('$baseUrl/countries?query=$query'));
//       print(query); 
//   if (response.statusCode == 200) {
//     print('search good'); 


//     print('---------');

//     print('------------');

//     print('----------');

//     print('-----------');
//     final dynamic jsonData = jsonDecode(response.body);
//     print(jsonData);

//     final CountryDataModel searchResult =

//     CountryDataModel.fromJson(jsonData);
 
//     print(searchResult);

//     return searchResult;
   
//    } else {
//     throw Exception('Failed to search country');
//   }
// }













}

















































// class Repository {
//   static const String baseUrl = 'https://disease.sh/v3/covid-19';
//   final http.Client httpClient;

//   Repository(this.httpClient);

//   Future<GlobalDataModel> fetchGlobalData() async {
//     final response = await httpClient.get(Uri.parse('$baseUrl/countries'));
//     if (response.statusCode == 200) {
//       print('api good'); 
//       final json = jsonDecode(response.body);
//       return GlobalDataModel.fromJson(json);
      
//     } else {
//       throw Exception('Failed to fetch global data');
//     }
//   }

//   Future<List<CountryDataModel>> fetchCountryData() async {
//     final response = await httpClient.get(Uri.parse('$baseUrl/countries'));
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = jsonDecode(response.body);
//       final List<CountryDataModel> countryDataList =
//           jsonList.map((json) => CountryDataModel.fromJson(json)).toList();
//       return countryDataList;
//     } else {
//       throw Exception('Failed to fetch country data');
//     }
//   }

//   Future<List<CountryModel>> searchCountries(String query) async {
//     final response = await httpClient.get(Uri.parse('$baseUrl/countries?query=$query'));
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = jsonDecode(response.body);
//       final List<CountryModel> searchResults = jsonList.map((json) => CountryModel.fromJson(json)).toList();
//       return searchResults;
//     } else {
//       throw Exception('Failed to search countries');
//     }
//   }
// }
