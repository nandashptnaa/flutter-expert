// Mocks generated by Mockito 5.3.0 from annotations
// in ditonton/test/presentation/bloc/tv/tvseries_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:ditonton/common/failure.dart' as _i6;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ditonton/domain/entities/tvseries/tvseries_detail.dart' as _i7;
import 'package:ditonton/domain/repositories/tvseries_repository.dart' as _i2;
import 'package:ditonton/domain/usecases/tvseries/get_detail_tvseries.dart' as _i4;
import 'package:ditonton/domain/usecases/tvseries/get_watchlist_status_tv.dart'
    as _i8;
import 'package:ditonton/domain/usecases/tvseries/remove_watchlist_tv.dart'
    as _i10;
import 'package:ditonton/domain/usecases/tvseries/save_watchlist_tv.dart' as _i9;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeTvseriesRepository_0 extends _i1.SmartFake
    implements _i2.TvRepository {
  _FakeTvseriesRepository_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [GetTvseriesDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesDetail extends _i1.Mock implements _i4.GetTvSeriesDetail {
  MockGetTvSeriesDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
          Invocation.getter(#repository),
          returnValue:
              _FakeTvseriesRepository_0(this, Invocation.getter(#repository)))
      as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.TvSeriesDetail>> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
              returnValue:
                  _i5.Future<_i3.Either<_i6.Failure, _i7.TvSeriesDetail>>.value(
                      _FakeEither_1<_i6.Failure, _i7.TvSeriesDetail>(
                          this, Invocation.method(#execute, [id]))))
          as _i5.Future<_i3.Either<_i6.Failure, _i7.TvSeriesDetail>>);
}

/// A class which mocks [GetWatchListStatusTvseries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatusTvSeries extends _i1.Mock
    implements _i8.GetWatchlistStatusTvSeries {
  MockGetWatchListStatusTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
          Invocation.getter(#repository),
          returnValue:
              _FakeTvseriesRepository_0(this, Invocation.getter(#repository)))
      as _i2.TvRepository);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: _i5.Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [SaveWatchlistTvseries].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistTvSeries extends _i1.Mock
    implements _i9.SaveWatchlistTvSeries {
  MockSaveWatchlistTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
          Invocation.getter(#repository),
          returnValue:
              _FakeTvseriesRepository_0(this, Invocation.getter(#repository)))
      as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(
          _i7.TvSeriesDetail? tvseries) =>
      (super.noSuchMethod(Invocation.method(#execute, [tvseries]),
              returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
                  _FakeEither_1<_i6.Failure, String>(
                      this, Invocation.method(#execute, [tvseries]))))
          as _i5.Future<_i3.Either<_i6.Failure, String>>);
}

/// A class which mocks [RemoveWatchlistTvseries].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTvseries extends _i1.Mock
    implements _i10.RemoveWatchlistTvSeries {
  MockRemoveWatchlistTvseries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
          Invocation.getter(#repository),
          returnValue:
              _FakeTvseriesRepository_0(this, Invocation.getter(#repository)))
      as _i2.TvRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(
          _i7.TvSeriesDetail? tvseries) =>
      (super.noSuchMethod(Invocation.method(#execute, [tvseries]),
              returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
                  _FakeEither_1<_i6.Failure, String>(
                      this, Invocation.method(#execute, [tvseries]))))
          as _i5.Future<_i3.Either<_i6.Failure, String>>);
}
