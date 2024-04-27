import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test/features/ships/data/model/ships_model.dart';
import 'package:test/features/ships/data/repo/ships_repo.dart';

part 'ships_state.dart';

@immutable
abstract class ShipsState {}

class ShipsInitial extends ShipsState {}

class ShipsLoading extends ShipsState {}

class ShipsLoaded extends ShipsState {
  final List<Ships> ships;

  ShipsLoaded(this.ships);
}

class ShipsError extends ShipsState {
  final String error;

  ShipsError(this.error);
}

class ShipsCubit extends Cubit<ShipsState> {
  final ShipsRepository _repository;

  ShipsCubit(this._repository) : super(ShipsInitial());

  Future<void> fetchShips() async {
    emit(ShipsLoading());
    try {
      final ships = await _repository.getShips();
      emit(ShipsLoaded(ships));
    } on Exception catch (e) {
      emit(ShipsError(e.toString()));
    }
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:test/core/states/api_states.dart';
// import 'package:test/features/ships/data/repo/ships_repo.dart';

// import '../model/ships_model.dart';

// class ShipsCubit extends Cubit<ApiState<Ships>> {
//   final ShipsRepository shipsRepository;

//   ShipsCubit({required this.shipsRepository})
//       : super(const Initial<Ships>());

//   Future<void> fetchShips() async {
//     emit(const Loading<Ships>());
//     try {
//       final ships = await shipsRepository.fetchAllShips();
//       emit(Success<Ships>(ships));
//     } on Exception catch (error) {
//       emit(Error<Ships>(error.toString()));
//     }
//   }  }
