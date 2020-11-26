import 'package:bloc_pattern_network_fetch/model/api_model.dart';
import 'package:flutter/cupertino.dart';

abstract class PlayerListingState{}

class PlayerUninitializeState extends PlayerListingState{}

class PlayerFetchingState  extends PlayerListingState{}

class PlayerFetchedState extends PlayerListingState{
  final List<Player> players;

  PlayerFetchedState({@required this.players});

}

class PlayerErrorState extends PlayerListingState{}

class PlayerEmptyState extends PlayerListingState{}

