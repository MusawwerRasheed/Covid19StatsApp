import 'package:covid19api/presentation/widgets/animated_pie_chart.dart';
import 'package:covid19api/presentation/widgets/country_card.dart';
import 'package:flutter/material.dart';
import '../../data/models/country_data_model.dart';
  
 

  class CountrySpecificPage extends StatelessWidget {
  final String country;
  final int cases;
  final int deaths;
  final int recovered;
  final int? active;
  final int? critical; 
  final int? population;
  final int? todaycases;
  final int? tests; 
  final String? continent; 
  final String flagUrl; 
  
  // String flagUrl = countryData.countryInfo?.flag ?? '';
 
  const CountrySpecificPage({
    Key? key,
    required this.country,
    required this.cases,
    required this.deaths,
    required this.recovered, 
    this.todaycases,
    this.active, 
    this.critical,
    this.population,
    this.tests, 
    required this.flagUrl, 
    this.continent,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country),
      ),
      


      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:28.0),
                child: CountryCard(
                title: country,
                cases: cases,
                deaths: deaths,
                recovered: recovered,
                avatar: NetworkImage(flagUrl), 
                critial: critical,
                 todaycases: todaycases,
                  active: active, 
                  tests: tests, 
                  population:population,  
                  
                      ),
              ),
Padding(
  padding: const EdgeInsets.only(top:18.0),
  child:   AnimatedPieChart(cases: cases, deaths: deaths, recovered:recovered),
),]),),),
    );
  }
}



