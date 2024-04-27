import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/web%20services/web_services.dart';
import 'package:test/features/ships/data/cubit/ships_cubit.dart';
import 'package:test/features/ships/data/repo/ships_repo.dart';
import 'package:test/features/ships/ui/widgets/ship_container.dart';

Dio dio = Dio();
WebServices webServices = WebServices(dio);
ShipsRepository shipsRepository = ShipsRepository(webServices);
final cubit = ShipsCubit(shipsRepository);

class ShipsListView extends StatefulWidget {
  const ShipsListView({super.key});

  @override
  State<ShipsListView> createState() => _ShipsListViewState();
}

class _ShipsListViewState extends State<ShipsListView> {
  @override
  void initState() {
    super.initState();
    cubit.fetchShips();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SpaceX Ships'),
        ),
        body: BlocBuilder<ShipsCubit, ShipsState>(
          builder: (context, state) {
            if (state is ShipsInitial) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            } else if (state is ShipsLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            } else if (state is ShipsLoaded) {
              final ships = state.ships;
              return ListView.builder(
                itemCount: ships.length,
                itemBuilder: (context, index) {
                  final ship = ships[index];
                  return shipContainer(
                      context,
                      ship.image ?? 'https://i.imgur.com/woCxpkj.jpg',
                      ship.name ?? 'No Name',
                      ship.yearBuilt ?? 00,
                      ship.massKg ?? 00,
                      ship.type ?? 'Not Definded');
                },
              );
            } else if (state is ShipsError) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Text(
                  'Unexpected state: $state'); // Handle unexpected states
            }
          },
        ),
      ),
    );
  }
}

    
    //  BlocProvider<ShipsCubit>(
    //     create: (context) => cubit,
    //     child: SizedBox(
    //       height: MediaQuery.of(context).size.height / 5.5,
    //       child: BlocBuilder<ShipsCubit, ApiState<Ships>>(
    //         builder: (context, state) {
    //           if (state is Success<List<Ships>>) {
    //             final List<Ships> allShips = state as List<Ships>;
                
    //             return ListView.builder(
    //               itemBuilder: (context, index) {
    //                 return shipContainer(context, allShips[index].image.toString(),
    //                     allShips[index].name.toString());
    //               },
    //             );
    //           } else if (state is Error<Ships>) {
    //             return const CircularProgressIndicator(
    //               color: Colors.red,
    //             );
    //           } else if (state is Loading<Ships>) {
    //             return const CircularProgressIndicator(
    //               color: Colors.amber,
    //             );
    //           } else if (state is Initial<Ships>) {
    //             return const CircularProgressIndicator(
    //               color: Colors.purple,
    //             );
    //           } else {
    //             return Text('no data');
    //           }
    //         },
    //       ),
    //     ));
//   }
// }

// import 'package:bloc/bloc.dart';
// import 'package:test/core/states/api_states.dart';
// import 'package:test/features/ships/data/repo/ships_repo.dart';

// import '../model/ships_model.dart';

// class ShipsCubit extends Cubit<ApiState<Ships>> {
//   final ShipsRepository shipsRepository;

//   ShipsCubit({required this.shipsRepository}) : super(const Initial<Ships>());

//   Future<void> fetchShips() async {
//     emit(const Loading<Ships>());
//     try {
//       final ships = await shipsRepository.fetchAllShips();
//       emit(Success<Ships>(ships as Ships));
//     } on Exception catch (error) {
//       emit(Error<Ships>(error.toString()));
//     }
//   }
// }
