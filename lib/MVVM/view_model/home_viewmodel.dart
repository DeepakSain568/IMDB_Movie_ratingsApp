import 'package:http_amdb/MVVM/data/response/api_response.dart';
import 'package:http_amdb/MVVM/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http_amdb/MVVM/model/movies_model.dart';
import 'package:http_amdb/MVVM/repository/home_view_repo.dart';

class MoviesData with ChangeNotifier {
  final _response = HomeRepository();

  ApiResponse<List<MoviesList>> moviesList = ApiResponse.loading();

  Future<void> moviesdata() async {
    setMoviesList(ApiResponse.loading());
    _response.GetMOviesList().then((value) {
     
      setMoviesList(ApiResponse.completed(value));
    
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

  setMoviesList(ApiResponse<List<MoviesList>> response) {
    moviesList = response;

    notifyListeners();
  }
}
