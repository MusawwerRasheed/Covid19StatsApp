import 'package:covid19api/blocs/states/country_data_state.dart';
import 'package:covid19api/blocs/states/search_states.dart';
import 'package:covid19api/presentation/screens/country_specific_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/cubits/country_data_cubit.dart';
import '../../blocs/cubits/search_cubit.dart';
import '../widgets/country_card.dart';
 

 









class CountriesPage extends StatefulWidget {
const CountriesPage({
super.key,
required String? countryName, 
required int totalCases,
 required int totalDeaths, 
 required int totalRecovered});
  

  @override
  State<CountriesPage> createState() => _CountriesPageState();

}

class _CountriesPageState extends State<CountriesPage> {
  

  var searchController = TextEditingController(); 

   @override
  void initState()
  {
    BlocProvider.of<CountryDataCubit>(context).fetchCountryData(); 
         super.initState();
}
  

    @override
  void dispose() {
    searchController.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  
    var searchController;

    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.white, 
        elevation: 0,
        title:  TextField(
          controller: searchController,

      onChanged: (query) {
        context.read<SearchCubit>().searchCountries(query);
        if(query.isEmpty){
          searchController.clear();
        }
      },
      decoration: const InputDecoration(
        hintText: 'Search country',
        prefixIcon: Icon(Icons.search),
      ),
    ),),
     
      body: 
      
      BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
        
          if (state is SearchResults) 
          
          {            
            
            final searchresultobject = state.result; 
            Text(searchresultobject.country);

            return  
                      GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CountrySpecificPage(
        country: searchresultobject.country, flagUrl:searchresultobject.flagurl,
         cases: searchresultobject.cases, deaths: searchresultobject.deaths,
         recovered: searchresultobject.recovered, 
         tests: searchresultobject.tests , population: searchresultobject.population, active: searchresultobject.active, critical: searchresultobject.critial,)), // Replace with your screen's name
    
    );

  },
 //child section 
 
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom:241.0),
                            child: CountryCard(title: searchresultobject.country,
                             cases: searchresultobject.cases,
                              deaths: searchresultobject.deaths, 
                              recovered: searchresultobject.recovered,
                              avatar: NetworkImage(searchresultobject.flagurl),
                               critial: null, 
                               todaycases: null, 
                               active: null, 
                               tests: null, 
                               population: null),
                          ),
                        ),
                      );
 
  } 
  else{ 

    return 
     BlocBuilder<CountryDataCubit, CountryDataState>(
        builder: (context, state) {

if (state is CountryDataLoaded){  


 final countryDataList = state.countryDataList;

 print('countries page is: $countryDataList'); 

 return Column(

  children: [
    

 Expanded(

  child: ListView.builder(
    itemCount: countryDataList.length,
    itemBuilder: (context, index) {
      final countryData = countryDataList[index];
      print('country item is: $index'); 
      
      return GestureDetector(

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CountrySpecificPage(
                cases: countryData.cases,
                recovered: countryData.recovered,
                deaths: countryData.deaths,
                country: countryData.country,
                critical: countryData.critial,
                todaycases: countryData.todaycases,
                active: countryData.active,
                tests: countryData.tests,
                population: countryData.population,
                flagUrl: countryData.flagurl,


              ),
            ),
          );
        },

        
        child: CountryCard(
          title: countryData.country,
          cases: countryData.cases,
          deaths: countryData.deaths,
          recovered: countryData.recovered,
          avatar: NetworkImage(countryData.flagurl), 
                   
          critial: null, todaycases: null, active: null, tests: null, population: null,  
        ),
      );
    },
  ),
), 
  ],
 );   
}
else if(state is CountryDataError){ 
return Center(child: Text(state.errorMessage));
}
else return Center(child: CircularProgressIndicator());     
    // print(state); 
  },
);
 }
  }
    )
      );
       }
  }

          

      


















 