import 'package:covid19api/presentation/screens/countries_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';



class CountryCard extends StatelessWidget {
  final String title;
  final int cases;
  final int deaths;
  final int recovered;
  final int? active; 
  final int? tests;
  final int? todaycases; 
  final int? population; 
  final int? critial; 
  final ImageProvider<Object>? avatar; 
   
 
  const CountryCard({
    Key? key,
    required this.title,
    required this.cases,
    required this.deaths, 
    required this.recovered,
    required this.critial,
    required this.todaycases,
    required this.active, 
    required this.tests, 
    required this.population,
    this.avatar, 

 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 2),
      child: InkWell(
        
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
              leading: avatar != null ? SizedBox(width:50, height: 100, child: CircleAvatar(backgroundImage: avatar!)) : null,
                title: Text(title),
                subtitle: Column(
                  children: [
                    Row( children: [ Text('Cases: $cases')],),
                    Row(children:[Text('Deaths: ', style: TextStyle(),), Text('$deaths')],),
                    Row(children: [Text('Recovered: $recovered')],),  
                    if (tests != null) Row(children: [Text('Tests: $tests')]),
                    if (todaycases != null) Row(children: [Text('Today cases: $todaycases')]),
                    if (population != null) Row(children: [Text('Population: $population')]),
                    if (active != null) Row(children: [Text('Active: $active')]),
                    if (critial != null) Row(children: [Text('Critical: $critial')]),
               
                    // Text('Cases: $cases, Deaths: $deaths, Recovered: $recovered, '),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 