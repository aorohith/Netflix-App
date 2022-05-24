import 'dart:convert';

import 'package:netflix/presentation/downloads/models/all_data_model.dart/all_data_model.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiCalls {
  Future getAllMovies();
  Future getPopular();
}

class MovieDB extends ApiCalls {
  @override
  Future<List<DataModel>> getAllMovies() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/trending/all/day?api_key=f88b478026037712e036ac5db7fe2109"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<DataModel>> getPopular() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }
}

Future<List<DataModel>> dataFromServer(String callFrom) async {
  final result;
      result = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&page=1"));
      Map<String, dynamic> map = json.decode(result.body);
      final data = AllDataModel.fromJson(map);
      return data.results;

    
}
