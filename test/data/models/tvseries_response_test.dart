import 'dart:convert';
import 'package:ditonton/data/models/tvseries/tvseries_model.dart';
import 'package:ditonton/data/models/tvseries/tvseries_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main(){
  final tvSeriesModel = TvSeriesModel(
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
    id: 1,
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    name: "Name",
    voteAverage: 1.0,
    voteCount: 1,
    originalName: '',
    originalLanguage: 'en',
    originCountry: ["US"],
  );
  final tvResponseModel = TvResponseModel(tvList: <TvSeriesModel>[tvSeriesModel]);

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = tvResponseModel.toJson();
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2, 3, 4],
            "id": 1,
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "name": "Name",
            "vote_average": 1.0,
            "vote_count": 1,
            "original_name": '',
            "original_language": 'en',
            "origin_country": ["US"],
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/on_the_air.json'));
      final result = TvResponseModel.fromJson(jsonMap);
      expect(result, tvResponseModel);
    });
  });
}