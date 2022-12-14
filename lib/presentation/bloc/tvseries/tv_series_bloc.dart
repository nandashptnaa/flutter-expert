import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/tvseries/get_airing_today_tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_on_the_air_tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_popular_tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_top_rated_tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_tvseries_recommendation.dart';
import 'package:ditonton/domain/usecases/tvseries/get_watchlist_tv.dart';
import 'package:ditonton/presentation/bloc/tvseries/tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tvseries/tv_series_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesAiringTodayBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetAiringTodayTvSeries _getAiringTodayTvseries;

  TvSeriesAiringTodayBloc(this._getAiringTodayTvseries) : super(EmptyTvData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingTvData());
      final result = await _getAiringTodayTvseries.execute();

      result.fold(
        (failure) {
          emit(ErrorTvData(failure.message));
        },
        (data) {
          emit(TvHasData(data));
        },
      );
    });
  }
}

class TvSeriesOnTheAirBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetOnTheAirTvSeries _getOnTheAirTvseries;

  TvSeriesOnTheAirBloc(this._getOnTheAirTvseries) : super(EmptyTvData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingTvData());
      final result = await _getOnTheAirTvseries.execute();

      result.fold(
        (failure) {
          emit(ErrorTvData(failure.message));
        },
        (messageTv) {
          emit(TvHasData(messageTv));
        },
      );
    });
  }
}

class PopularTvBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetPopularTvSeries _getPopularTvseries;
  PopularTvBloc(this._getPopularTvseries) : super(EmptyTvData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingTvData());
      final result = await _getPopularTvseries.execute();

      result.fold(
        (failure) {
          emit(ErrorTvData(failure.message));
        },
        (data) {
          emit(TvHasData(data));
        },
      );
    });
  }
}

class TopRatedTvseriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTopRatedTvSeries _getTopRatedTvSeries;
  TopRatedTvseriesBloc(this._getTopRatedTvSeries) : super(EmptyTvData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingTvData());
      final result = await _getTopRatedTvSeries.execute();

      result.fold(
        (failure) {
          emit(ErrorTvData(failure.message));
        },
        (data) {
          emit(TvHasData(data));
        },
      );
    });
  }
}

class WatchlistTvseriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetWatchlistTvSeries _getWatchlistTvSeries;
  WatchlistTvseriesBloc(this._getWatchlistTvSeries) : super(EmptyTvData()) {
    on<FetchTvSeriesData>((event, emit) async {
      emit(LoadingTvData());
      final result = await _getWatchlistTvSeries.execute();

      result.fold(
        (failure) {
          emit(ErrorTvData(failure.message));
        },
        (data) {
          emit(TvHasData(data));
        },
      );
    });
  }
}

class RecommendationTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTvSeriesRecommendations _getTvSeriesRecommendations;

  RecommendationTvSeriesBloc(
    this._getTvSeriesRecommendations,
  ) : super(EmptyTvData()) {
    on<FetchTvSeriesById>((event, emit) async {
      final id = event.id;
      emit(LoadingTvData());
      final result = await _getTvSeriesRecommendations.execute(id);

      result.fold(
        (failure) {
          emit(ErrorTvData(failure.message));
        },
        (data) {
          emit(TvHasData(data));
        },
      );
    });
  }
}
