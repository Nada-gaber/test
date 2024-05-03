import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/web%20services/web_services.dart';
import 'package:test/features/ships/data/cubit/ships_cubit.dart';
import 'package:test/features/ships/data/cubit/ships_state.dart';
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
  bool _isSearchBarActive = false;
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    cubit.fetchShips();
  }

  void _handleSearchClick() {
    setState(() {
      _isSearchBarActive = !_isSearchBarActive;
      if (!_isSearchBarActive) {
        _searchTerm = '';
        cubit.fetchShips();
      }
    });
  }

  void _handleSearchChange(String value) {
    setState(() {
      _searchTerm = value;

      cubit.fetchShips(searchTerm: _searchTerm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: _isSearchBarActive
              ? TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search Ships...',
                  ),
                  onChanged: _handleSearchChange,
                )
              : const Text('SpaceX Ships'),
          actions: [
            IconButton(
              icon: Icon(_isSearchBarActive ? Icons.close : Icons.search),
              onPressed: _handleSearchClick,
            ),
          ],
        ),
        body: BlocBuilder<ShipsCubit, ShipsState>(
          builder: (context, state) {
            if (state is ShipsInitial) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            } else if (state is ShipsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (state is ShipsLoaded) {
              final ships = state.ships;
              final filteredShips = _searchTerm.isEmpty
                  ? ships
                  : ships
                      .where((ship) =>
                          ship.name
                              ?.toLowerCase()
                              .contains(_searchTerm.toLowerCase()) ??
                          false)
                      .toList();
              return ListView.builder(
                itemCount: filteredShips.length,
                itemBuilder: (context, index) {
                  final ship = filteredShips[index];
                  return 
                  
                  shipContainer(
                    context,
                    ship.image ?? 'https://i.imgur.com/woCxpkj.jpg',
                    ship.name ?? 'No Name',
                    ship.yearBuilt ?? 00,
                    ship.massKg ?? 00,
                    ship.type ?? 'Not Definded',
                  );
                },
              );
            } else if (state is ShipsError) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Text(
                'Unexpected state: $state',
              );
            }
          },
        ),
      ),
    );
  }
}
