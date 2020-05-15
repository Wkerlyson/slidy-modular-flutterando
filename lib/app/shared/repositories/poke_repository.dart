import 'package:dio/dio.dart';
import 'package:slidy_modular_flutterando/app/shared/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = [];

    for (var json in response.data['results'] as List) {
      PokemonModel pokemon = PokemonModel(name: json['name'], url: json['url']);
      list.add(pokemon);
    }

    return list;
  }
}
