
class CountryModel {
  
  final String country; 
  // final int cases; 
  // final int deaths; 

 


  CountryModel({required this.country,
  //  required this.cases, required this.deaths
    });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
     
         country: json['country'],
      // cases: json['cases'],
      // deaths: json['deaths'],
    );
  }
}

 
 