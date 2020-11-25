import 'package:bloc_pattern_network_fetch/data_provider/api_provider.dart';
import 'package:bloc_pattern_network_fetch/model/api_model.dart';

class PlayerRepository {
  PlayerApiProvider provider = PlayerApiProvider();

  Future<List<Players>> fetchPlayersByCountry(String countryId) =>
      provider.fetchPlayersByCountry(countryId);
  Future<List<Players>> fetchPlayersByName(String countryId) =>
      provider.fetchPlayersByName(countryId);
}
