// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/core/states/api_states.dart';
// import 'package:test/features/ships/data/cubit/ships_cubit.dart';
// import 'package:test/features/ships/data/model/ships_model.dart';
// import 'package:test/features/ships/data/repo/ships_repo.dart';

// import 'package:test/features/ships/ui/widgets/ship_container.dart';

// import '../../../core/web services/web_services.dart';

// Dio dio = Dio();
// WebServices webServices = WebServices(dio);
// ShipsRepository shipsRepository = ShipsRepository(webServices);
// final cubit = ShipsCubit(shipsRepository: shipsRepository);

// class ShipsScreen extends StatefulWidget {
//   final List<Ships> allShips;

//   const ShipsScreen({super.key, required this.allShips});

//   @override
//   State<ShipsScreen> createState() => _ShipsScreenState();
// }

// class _ShipsScreenState extends State<ShipsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     cubit.fetchShips();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ShipsCubit>(
//       create: (context) => cubit,
//       child: BlocConsumer<ShipsCubit, ApiState<Ships>>(
//         listener: (context, state) {
//           if (state is Error<Ships>) {
//             final errorState = state; // Cast to Error<CompanyInfo>
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Error: ${errorState.error}'),
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state is Initial<Ships>) {
//             return const Center(
//                 child: CircularProgressIndicator(
//                     backgroundColor: Color.fromARGB(255, 63, 132, 230),
//                     color: Colors.red));
//           } else if (state is Loading<Ships>) {
//             return const Center(
//                 child: CircularProgressIndicator(
//                     backgroundColor: Color.fromARGB(255, 118, 158, 214),
//                     color: Colors.amber));
//           } else if (state is Success<Ships>) {
//             final ships = state.data;
//             return ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: ships.name!.length,
//               itemBuilder: (context, index) {
//                 return shipContainer(
//                     context, '${ships.image}', '${ships.name}');
//               },
//             );
//           } else if (state is Error<Ships>) {
//             return const Text('Error fetching ships.');
//           } else {
//             return Text('Unexpected state: $state');
//           }
//         },
//       ),
//     );
//   }
// }
