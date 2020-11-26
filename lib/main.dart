import 'package:bloc_pattern_network_fetch/bloc/player_event.dart';
import 'package:bloc_pattern_network_fetch/bloc/player_state.dart';

import 'repository/play_repository.dart';
import 'package:bloc_pattern_network_fetch/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/player_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Player football',
        theme: ThemeData(
          fontFamily: "GoogleSans",
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final PlayerListingBloc _bloc =
      PlayerListingBloc(playerRepo: PlayerRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Football Players"),
      ),
      body: BlocProvider(
        builder: (context) => _bloc,
        child: PlayerListing(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            final PlayerListingEvent event = PlayerListingNameSearchedEvent(searchTerm: ""); 
            this._bloc.dispatch(event);
          },
      ),
    );
  }
}

class PlayerListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<PlayerListingBloc>(context),
      builder: (context, state) {
        print("rerender");
        if (state is PlayerUninitializeState) {
          return Center(child: Text("Uninitialize State"));
        } else if (state is PlayerEmptyState) {
          return Center(child: Text("Empty State"));
        } else if (state is PlayerErrorState) {
          return Center(child: Text("Uninitialize State"));
        } else if (state is PlayerFetchingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PlayerFetchedState) {
          return ListView.builder(
              itemCount: state.players.length,
              itemBuilder: (context,index)=>ListTile(title: Text(state.players[index].name),),
          );
        }
      },
    );
  }
}
