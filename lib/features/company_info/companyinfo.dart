// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/features/company_info/cubit/company_cubit.dart';
// import 'package:test/features/company_info/repo/repo.dart';
// import 'package:test/features/company_info/cubit/states.dart';
// import 'package:test/core/web%20services/web_services.dart';

// Dio dio = Dio();
// WebServices webServices = WebServices(dio);
// CompanyRepository companyRepository = CompanyRepository(webServices);

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final cubit = CompanyCubit(companyRepository: companyRepository);

//   @override
//   void initState() {
//     super.initState();
//     cubit.fetchCompanyInfo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CompanyCubit>(
//       create: (context) => cubit, // Provide the Cubit instance
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Company Info'),
//         ),
//         body: Center(
//           child: BlocListener<CompanyCubit, CompanyInfoState>(
//             listener: (context, state) {
//               if (state is Error) {
//                 // Handle error state (e.g., show a snackbar)
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Error: ${state.error}'),
//                   ),
//                 );
//               }
//             },
//             child: _buildCompanyInfo(
//                 context), // Separate widget for company info display
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => cubit.fetchCompanyInfo(), // Emit event to fetch data
//           child: Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }

//   Widget _buildCompanyInfo(BuildContext context) {
//     return BlocBuilder<CompanyCubit, CompanyInfoState>(
//       builder: (context, state) {
//         if (state is Initial) {
//           return CircularProgressIndicator(); // Show loading indicator initially
//         } else if (state is Loading) {
//           return CircularProgressIndicator(); // Show loading indicator while fetching
//         } else if (state is Success) {
//           final companyInfo = state.companyInfo;
//           return Text(
//             'Company Name: ${companyInfo.ceo}', // Change to desired field
//             style: TextStyle(fontSize: 20),
//           );
//         } else {
//           return Text('Unexpected state: $state');
//         }
//       },
//     );
//   }
// }
