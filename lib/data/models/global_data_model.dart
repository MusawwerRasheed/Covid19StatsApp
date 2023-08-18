class GlobalDataModel {
final int cases;
final int deaths;
final int recovered;
final int? active ;
final int? critial; 
final int? population; 
final int? tests; 
final int? todaycases; 

  GlobalDataModel({this.population, this.tests, this.todaycases, this.critial,
    this.active,  required this.cases, required this.deaths, required this.recovered});

  factory GlobalDataModel.fromJson(Map<String, dynamic> json) {
    return GlobalDataModel(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
      critial: json['critical'],
      population:json['population'],
      tests: json['tests'],
      todaycases: json['todaycases'],  
      
    );
  }
}
