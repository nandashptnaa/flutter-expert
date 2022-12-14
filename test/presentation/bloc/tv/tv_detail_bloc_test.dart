import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tvseries/get_detail_tvseries.dart';
import 'package:ditonton/domain/usecases/tvseries/get_watchlist_status_tv.dart';
import 'package:ditonton/domain/usecases/tvseries/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tvseries/save_watchlist_tv.dart';
import 'package:ditonton/presentation/bloc/tvseries/tv_series_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tvseries/tv_series_detail_event.dart';
import 'package:ditonton/presentation/bloc/tvseries/tv_series_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetWatchlistStatusTvSeries,
  SaveWatchlistTvSeries,
  RemoveWatchlistTvSeries,
])
void main() {
  late TvDetailBloc detailBloc;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetWatchListStatusTvSeries mockGetWatchListStatusTvSeries;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTvseries mockRemoveWatchlist;

  setUp(() {
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    mockGetWatchListStatusTvSeries = MockGetWatchListStatusTvSeries();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockRemoveWatchlist = MockRemoveWatchlistTvseries();
    detailBloc = TvDetailBloc(
      getTvseriesDetail: mockGetTvSeriesDetail,
      getTvWatchListStatus: mockGetWatchListStatusTvSeries,
      saveTvWatchlist: mockSaveWatchlistTvSeries,
      removeTvWatchlist: mockRemoveWatchlist,
    );
  });

  const tId = 1;

  group('Get Tvseries Detail', () {
    test('initial state should be empty', () {
      expect(detailBloc.state.tvState, RequestState.Empty);
    });

    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit when data is gotten successfully',
      build: () {
        when(mockGetTvSeriesDetail.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesDetail));
        return detailBloc;
      },
      act: (bloc) => bloc.add(FetchTvseriesDetailById(tId)),
      expect: () => [
        TvDetailState.initial().copyWith(tvState: RequestState.Loading),
        TvDetailState.initial().copyWith(
          tvState: RequestState.Loaded,
          tvseriesDetail: testTvSeriesDetail,
        ),
      ],
      verify: (_) {
        verify(mockGetTvSeriesDetail.execute(tId));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit when get top rated tv is unsuccessful',
      build: () {
        when(mockGetTvSeriesDetail.execute(tId)).thenAnswer(
            (_) async => Left(ServerFailure('Server Failure')));
        return detailBloc;
      },
      act: (bloc) => bloc.add(FetchTvseriesDetailById(tId)),
      expect: () => [
        TvDetailState.initial().copyWith(tvState: RequestState.Loading),
        TvDetailState.initial().copyWith(
          tvState: RequestState.Error,
        ),
      ],
      verify: (_) {
        verify(mockGetTvSeriesDetail.execute(tId));
      },
    );
  });

  group('Watchlist tv series Status', () {
    blocTest<TvDetailBloc, TvDetailState>(
      'Get Watchlist tv series Status',
      build: () {
        when(mockGetWatchListStatusTvSeries.execute(tId)).thenAnswer((_) async => true);
        return detailBloc;
      },
      act: (bloc) => bloc.add(TvWatchlistStatusHasData(tId)),
      expect: () => [
        TvDetailState.initial().copyWith(
          tvseriesDetail: testTvSeriesDetail,
          isAddedToWatchlist: true,
        ),
      ],
      verify: (_) {
        verify(mockGetWatchListStatusTvSeries.execute(tId));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'Should execute save watchlist tv series when function called',
      build: () {
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Right('Success'));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => true);
        return detailBloc;
      },
      act: (bloc) => bloc.add(AddTvWatchlist(testTvSeriesDetail)),
      expect: () => [
        TvDetailState.initial().copyWith(
            tvseriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: false,
            watchlistTvMessage: 'Success'),
        TvDetailState.initial().copyWith(
            tvseriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: true,
            watchlistTvMessage: 'Success'),
      ],
      verify: (_) {
        verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'should execute remove watchlist tv series when function called',
      build: () {
        when(mockRemoveWatchlist.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Right('Removed'));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(RemoveTvWatchlist(testTvSeriesDetail)),
      expect: () => [
        TvDetailState.initial().copyWith(
            tvseriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: false,
            watchlistTvMessage: 'Removed'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(testTvSeriesDetail));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'should update watchlist message when add watchlist tv series failed',
      build: () {
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail)).thenAnswer(
            (_) async => Left(ServerFailure('Server Failure')));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(AddTvWatchlist(testTvSeriesDetail)),
      expect: () => [
        TvDetailState.initial().copyWith(
            tvseriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: false,
            watchlistTvMessage: 'Server Failure'),
      ],
      verify: (_) {
        verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'should update watchlist message when remove watchlist tv series failed',
      build: () {
        when(mockRemoveWatchlist.execute(testTvSeriesDetail)).thenAnswer(
            (_) async => Left(ServerFailure('Server Failure')));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        return detailBloc;
      },
      act: (bloc) => bloc.add(RemoveTvWatchlist(testTvSeriesDetail)),
      expect: () => [
        TvDetailState.initial().copyWith(
            tvseriesDetail: testTvSeriesDetail,
            isAddedToWatchlist: false,
            watchlistTvMessage: 'Server Failure'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(testTvSeriesDetail));
      },
    );
  });
}
