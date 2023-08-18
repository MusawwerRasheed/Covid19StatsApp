class CountryDataModel {

final String country;
final int cases;
final int deaths;
final int recovered;
final int? active ;
final int? critial; 
final int? population; 
final int? tests; 
final int? todaycases; 
final String flagurl; 


 
  
   
  CountryDataModel({this.active, this.critial, this.population, this.tests,  required this.flagurl,
  this.todaycases, required this.country, required this.cases, required this.deaths, required this.recovered,  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) {
    return CountryDataModel(
      country: json['country'],
          cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
      critial: json['critical'],
      population:json['population'],
      tests: json['tests'],
      todaycases: json['todaycases'],  
      flagurl: json['countryInfo']['flag'], 
   
    );
  }
  
}
class CountryInfo {
 
  String? flag;

  CountryInfo({this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
  
    flag = json['flag'];
  }
}