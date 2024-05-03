import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/ships_repo.dart';
import 'ships_state.dart';

class ShipsCubit extends Cubit<ShipsState> {
  final ShipsRepository _repository;

  ShipsCubit(this._repository) : super(ShipsInitial());

  Future<void> fetchShips({String searchTerm = ''}) async {
    emit(ShipsLoading());
    try {
      final ships = await _repository.getShips();
      emit(ShipsLoaded(ships));
    } on Exception catch (e) {
      emit(ShipsError(e.toString()));
    }
  }
}
