import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit/company_cubit.dart';
import 'package:test/repo.dart';
import 'package:test/states.dart';
import 'package:test/web_services.dart';

Dio dio = Dio();
WebServices webServices = WebServices(dio);
CompanyRepository companyRepository = CompanyRepository(webServices);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cubit = CompanyCubit(companyRepository: companyRepository);

  @override
  void initState() {
    super.initState();
    cubit.fetchCompanyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyCubit>(
      create: (context) => cubit, // Provide the Cubit instance
      child: Scaffold(
        appBar: AppBar(
          title: Text('Company Info'),
        ),
        body: Center(
          child: BlocListener<CompanyCubit, CompanyInfoState>(
            listener: (context, state) {
              if (state is Error) {
                // Handle error state (e.g., show a snackbar)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${state.error}'),
                  ),
                );
              }
            },
            child: _buildCompanyInfo(
                context), // Separate widget for company info display
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => cubit.fetchCompanyInfo(), // Emit event to fetch data
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }

  Widget _buildCompanyInfo(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyInfoState>(
      builder: (context, state) {
        if (state is Initial) {
          return CircularProgressIndicator(); // Show loading indicator initially
        } else if (state is Loading) {
          return CircularProgressIndicator(); // Show loading indicator while fetching
        } else if (state is Success) {
          final companyInfo = state.companyInfo;
          return Text(
            'Company Name: ${companyInfo.ceo}', // Change to desired field
            style: TextStyle(fontSize: 20),
          );
        } else {
          return Text('Unexpected state: $state');
        }
      },
    );
  }
}







// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/cubit/company_cubit.dart';
// import 'package:test/repo.dart';
// import 'package:test/states.dart';
// import 'package:test/web_services.dart'; // Assuming Cubit file path

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Dio dio = Dio();
//   final companyInfoRepository = CompanyRepository( );

//   @override
//   void initState() {
//     super.initState();
//     companyInfoRepository.getCompanyInfo(); // Fetch data on initialization (optional)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Company Info'),
//       ),
//       body: Center(
//         child: BlocListener<CompanyCubit, CompanyInfoState>(
//           listener: (context, state) {
//             if (state is Error) {
//               // Handle error state (e.g., show a snackbar)
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Error: ${state.error}'),
//                 ),
//               );
//             }
//           },
//           child: BlocBuilder<CompanyCubit, CompanyInfoState>(
//             // Use BlocBuilder with Cubit
//             bloc: cubit,
//             builder: (context, state) {
//               if (state is Initial) {
//                 return CircularProgressIndicator(); // Show loading indicator initially
//               } else if (state is Loading) {
//                 return CircularProgressIndicator(); // Show loading indicator while fetching
//               } else if (state is Success) {
//                 final companyInfo = state.companyInfo;
//                 return Text(
//                   'Company Name: ${companyInfo.name}',
//                   style: TextStyle(fontSize: 20),
//                 ); // Display company name
//               } else {
//                 return Text('Unexpected state: $state');
//               }
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           cubit.fetchCompanyInfo(); // Emit event to fetch data
//         },
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }



// // company_info_screen.dart
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/companyinfo_model.dart';
// import 'package:test/repo.dart';
// import 'package:test/web_services.dart';

// import 'cubit.dart';

// class CompanyInfoScreen extends StatelessWidget {
//   const CompanyInfoScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CompanyInfoCubit>(
//       create: (context) =>
//           CompanyInfoCubit(CompanyRepository(WebServices(Dio()))),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('SpaceX Company Info'),
//         ),
//         body: BlocBuilder<CompanyInfoCubit, CompanyInfoCubitState>(
//           builder: (context, state) {
//             return state.when(
//               initial: () => const Center(child: Text('Loading...')),
//               loading: () => const Center(child: CircularProgressIndicator()),
//               success: (companyInfo) => _buildCompanyInfo(context, companyInfo),
//               error: (error) => Center(child: Text('Error: $error')),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildCompanyInfo(BuildContext context, CompanyInfo companyInfo) {
//     // Build UI based on companyInfo
//     // ... your UI logic
//     return Text('');
//   }
// }
