import 'dart:async';
import 'package:application/models/test_model.dart';
import 'package:application/repository/test_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<ItemModel> fetchNextMovies(int page) =>
      moviesApiProvider.fetchNextMovieList(page);
}
