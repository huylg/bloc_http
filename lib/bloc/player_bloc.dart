import 'package:bloc_pattern_network_fetch/repository/play_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc_pattern_network_fetch/model/api_model.dart';

import 'player_event.dart';
import 'player_state.dart';
import 'package:bloc/bloc.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepo;

  PlayerListingBloc({@required this.playerRepo}) : assert(playerRepo != null);

  @override
  PlayerListingState get initialState => PlayerUninitializeState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    yield PlayerFetchingState();
    List<Player> players;
    try{

      if (event is PlayerListingCountrySelectedEvent){

        players = await this.playerRepo.fetchPlayersByCountry(event.nation.id.toString());


      }else if(event is PlayerListingNameSearchedEvent){
        players = await this.playerRepo.fetchPlayersByName(event.searchTerm);

      }

      yield players.isEmpty ? PlayerEmptyState() : PlayerFetchedState(players: players);

    }catch(e){

      yield PlayerErrorState();

    }

  }
}
