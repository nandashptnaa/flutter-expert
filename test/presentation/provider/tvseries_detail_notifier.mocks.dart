// Mocks generated by Mockito 5.0.8 from annotations
// in ditonton/test/presentation/provider/movie_detail_notifier_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:ditonton/common/failure.dart' as _i6;
import 'package:ditonton/domain/entities/tvseries/tvseries.dart' as _i9;
import 'package:ditonton/domain/entities/tvseries/tvseries_detail.dart' as _i7;
import 'package:ditonton/domain/repositories/tvseries_repository.dart' as _i2;
import 'package:ditonton/domain/usecases/tvseries/get_detail_tvseries.dart' as _i4;
import 'package:ditonton/domain/usecases/tvseries/get_tvseries_recommendation.dart' as _i8;
import 'package:ditonton/domain/usecases/tvseries/get_watchlist_status_tv.dart' as _i10;
import 'package:ditonton/domain/usecases/tvseries/remove_watchlist_tv.dart' as _i12;
import 'package:ditonton/domain/usecases/tvseries/save_watchlist_tv.dart' as _i11;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeTvSeriesRepository extends _i1.Fake implements _i2.TvRepository {}

class _FakeEither<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetTvSeriesDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesDetail extends _i1.Mock implements _i4.GetTvSeriesDetail {
  MockGetTvSeriesDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvSeriesRepository()) as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.TvSeriesDetail>> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<_i3.Either<_i6.Failure, _i7.TvSeriesDetail>>.value(
              _FakeEither<_i6.Failure, _i7.TvSeriesDetail>())) as _i5
          .Future<_i3.Either<_i6.Failure, _i7.TvSeriesDetail>>);
}

/// A class which mocks [GetMovieRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesRecommendations extends _i1.Mock
    implements _i8.GetTvSeriesRecommendations {
  MockGetTvSeriesRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvSeriesRepository()) as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i9.TvSeries>>> execute(dynamic id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i9.TvSeries>>>.value(
              _FakeEither<_i6.Failure, List<_i9.TvSeries>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i9.TvSeries>>>);
}

/// A class which mocks [GetTvSeriesWatchlistStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesWatchListStatus extends _i1.Mock
    implements _i10.GetWatchlistStatusTvSeries {
  MockGetTvSeriesWatchListStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvSeriesRepository()) as _i2.TvRepository);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [SaveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesSaveWatchlist extends _i1.Mock implements _i11.SaveWatchlistTvSeries {
  MockTvSeriesSaveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvSeriesRepository()) as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i7.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(Invocation.method(#execute, [tvSeries]),
              returnValue: Future<_i3.Either<_i6.Failure, String>>.value(
                  _FakeEither<_i6.Failure, String>()))
          as _i5.Future<_i3.Either<_i6.Failure, String>>);
}

/// A class which mocks [RemoveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoveWatchlist extends _i1.Mock implements _i12.RemoveWatchlistTvSeries {
  MockTvSeriesRemoveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTvSeriesRepository()) as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i7.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(Invocation.method(#execute, [tvSeries]),
              returnValue: Future<_i3.Either<_i6.Failure, String>>.value(
                  _FakeEither<_i6.Failure, String>()))
          as _i5.Future<_i3.Either<_i6.Failure, String>>);
}
