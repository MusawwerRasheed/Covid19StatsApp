 import 'package:covid19api/blocs/cubits/bottom_navigation_cubit.dart';
import 'package:covid19api/blocs/cubits/country_data_cubit.dart';
import 'package:covid19api/blocs/cubits/global_data_cubit.dart';
import 'package:covid19api/blocs/cubits/search_cubit.dart';
import 'package:covid19api/data/repository/repository.dart';
import 'package:covid19api/data/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';

void main() {

final repository = Repository(ApiService.httpClient);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
final Repository repository;



const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalDataCubit>(
          create: (context) => GlobalDataCubit(repository),
        ),
        BlocProvider<CountryDataCubit>(
          create: (context) => CountryDataCubit(repository),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(repository),
        ),
        BlocProvider<BottomNavigationCubit>(
          create: (context) => BottomNavigationCubit(),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'COVID-19 Tracker',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

 
 