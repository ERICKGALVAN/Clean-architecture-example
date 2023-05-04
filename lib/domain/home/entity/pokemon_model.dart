import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  int count;
  String? next;
  String? previous;
  List<PokemonDetail> pokemonDetail;

  PokemonModel({
    required this.count,
    required this.next,
    this.previous,
    required this.pokemonDetail,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        pokemonDetail: List<PokemonDetail>.from(
            json["results"].map((x) => PokemonDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(pokemonDetail.map((x) => x.toJson())),
      };
}

class PokemonDetail {
  String name;
  String url;

  PokemonDetail({
    required this.name,
    required this.url,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
