import 'dart:async';
import 'package:application/models/test_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MovieApiProvider {
  Client client = Client();
  final _uri = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=4beef64c69d0087eebe5509069309011");
  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(_uri);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<ItemModel> fetchNextMovieList(int page) async {
    print("entered");
    final uri = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=4beef64c69d0087eebe5509069309011&page=$page");
    final response = await client.get(uri);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
