//import '';
import 'package:bloc_pattern_network_fetch/model/api_model.dart';
import 'package:flutter/cupertino.dart';

abstract class PlayerListingEvent{}

class PlayerListingCountrySelectedEvent extends PlayerListingEvent {

  final Nation nation;

  PlayerListingCountrySelectedEvent({@required this.nation});

}

class PlayerListingNameSearchedEvent extends PlayerListingEvent {


  final String searchTerm;

  PlayerListingNameSearchedEvent({@required this.searchTerm});

}


