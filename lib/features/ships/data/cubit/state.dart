// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/features/ships/data/repo/ships_repo.dart';

// part 'ships_state.dart';

// @immutable
// abstract class ShipsState {}

// class ShipsInitial extends ShipsState {}

// class ShipsLoading extends ShipsState {}

// class ShipsLoaded extends ShipsState {
//   final List<Ship> ships;

//   ShipsLoaded(this.ships);
// }

// class ShipsError extends ShipsState {
//   final String error;

//   ShipsError(this.error);
// }

// class ShipsCubit extends Cubit<ShipsState> {
//   final ShipsRepository _repository;

//   ShipsCubit(this._repository) : super(ShipsInitial());

//   Future<void> fetchShips() async {
//     emit(ShipsLoading());
//     try {
//       final ships = await _repository.getShips();
//       emit(ShipsLoaded(ships));
//     } on Exception catch (e) {
//       emit(ShipsError(e.toString()));
//     }
//   }
// }

// import 'package:test/features/ships/data/model/ships_model.dart';
// import 'package:test/core/states/api_states.dart';

// class GetAllShipsSuccess extends ApiState<List<Ships>> {
//   final List<Ships> allShips;

//   GetAllShipsSuccess(this.allShips) : super();
// }
