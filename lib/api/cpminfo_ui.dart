// import 'package:flutter/material.dart';
// import 'package:test/api/bloc/companybloc.dart';

// class CompanyInfoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Company Info'),
//       ),
//       body: BlocProvider(
//         create: (context) => CompanyInfoBloc(GetIt.instance.get<CompanyRepository>()),
//         child: BlocBuilder<CompanyInfoBloc, CompanyInfoState>(
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state.error != null) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else {
//               final companyInfo = state.companyInfo!; // Access company information
//               return SingleChildScrollView( // Allow content to scroll if it overflows
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Name: ${companyInfo.name}', style: const TextStyle(fontSize: 18.0)),
//                     const SizedBox(height: 10.0),
//                     Text('Founder: ${companyInfo.founder}'),
//                     const SizedBox(height: 10.0),
//                     Text('Year Founded: ${companyInfo.yearFounded}'),
//                     const SizedBox(height: 10.0),
//                     Text('Employees: ${companyInfo.employees}'),
//                     const SizedBox(height: 10.0),
//                     Text('Launch Sites: ${companyInfo.launchSites}'),
//                     const SizedBox(height: 10.0),
//                     Text('Vehicles: ${companyInfo.vehicles}'),
//                     const SizedBox(height: 10.0),
//                     Text('Headquarters: ${companyInfo.headquarters}'),
//                     const SizedBox(height: 10.0),
//                     Text('Website: ${companyInfo.links.website}'),
//                     const SizedBox(height: 10.0),
//                     // Display other links (flickr, twitter, youtube) as needed
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.read<CompanyInfoBloc>().add(FetchCompanyInfo()), // Fetch data on button press
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }
