import 'package:covid19api/blocs/cubits/country_data_cubit.dart';
import 'package:covid19api/blocs/cubits/search_cubit.dart';
import 'package:covid19api/blocs/states/country_data_state.dart';
import 'package:covid19api/blocs/states/global_data_state.dart';
import 'package:covid19api/presentation/screens/countries_page.dart';
import 'package:covid19api/presentation/screens/country_specific_page.dart';
import 'package:covid19api/presentation/screens/profile_page.dart';
import 'package:covid19api/presentation/widgets/animated_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/cubits/bottom_navigation_cubit.dart';
import '../../blocs/cubits/global_data_cubit.dart';
import '../../blocs/states/bottom_navigation_state.dart';
import '../widgets/country_card.dart';

  



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
  BlocProvider.of<GlobalDataCubit>(context).fetchGlobalData();
  BlocProvider.of<CountryDataCubit>(context).fetchCountryData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // final bloc = context.watch<BottomNavigationCubit>().state;
    final _bloc = context.read<BottomNavigationCubit>();
 
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Stats')
         



      ),
      body: BlocBuilder<BottomNavigationCubit,BottomNavigationState>(builder: (context,state){
        if(state is BottomNavigationHome){

          return
           SingleChildScrollView(
             child: Column(
              children: [
                  BlocBuilder<GlobalDataCubit, GlobalDataState>(
                     builder: (context, state) {
              if (state is GlobalDataLoaded) {
                print(state); 
                final globalData = state.globalData;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [ 
           
                  const SizedBox(height: 16),
           
                   CountryCard(
                        title: 'Global',
                        cases: globalData.cases,
                        deaths: globalData.deaths,
                        recovered: globalData.recovered,    
                        tests:globalData.tests, 
                        population:globalData.population,
                        todaycases: globalData.todaycases, 
                        critial: globalData.critial,
                        active: globalData.active, 
           
                      ),            
                  
                  SizedBox(height: 8,),
 

AnimatedPieChart(cases: globalData.cases, deaths:globalData.deaths, recovered: globalData.recovered), 

                  
                  
                 
           
                
                  ],
                
           
                );
              } 
           
           
           
              else if 
              (state is GlobalDataError) {
                print(state);
                
                return Center(child: Text(state.errorMessage));
              }
           
           
               else {
                print(state); 
                return Padding(
                  padding: const EdgeInsets.only(top:200.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                       const CircularProgressIndicator(),
                    ],
                  ),
                );
              }
           
                     },
           
                   ),
           
           
           
                     
                     
                     
              ],
           
                     ),
           );

        }
         

        if(state is BottomNavigationCountries){
          
final countryStatedata = context.watch<CountryDataCubit>().state; 
 return CountriesPage(countryName: countryStatedata.country, totalCases: countryStatedata.cases, 
 totalDeaths:countryStatedata.deaths, totalRecovered: countryStatedata.recovered); 

       



        
        }if(state is BottomNavigationProfile){
          return const ProfilePage();
        }else{
          return const Center(
          child: Text("No Page defined"),
        );
        }
      }),
       
      
      bottomNavigationBar: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state is BottomNavigationHome
                ? 0
                : state is BottomNavigationCountries
                    ? 1
                    : 2,
            onTap: (index) {
              if (index == 0) {
                print(state); 
                 print(index);
                context.read<BottomNavigationCubit>().showHome();
              } else if (index == 1) {
        print(index); 
        print(state);
                context.read<BottomNavigationCubit>().showCountries();
              } else if (index == 2) {
                print(state);
             print(index); 
                context.read<BottomNavigationCubit>().showProfile();
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.public),
                label: 'Countries',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
