import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tvseries/save_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SaveWatchlistTvSeries(mockTvSeriesRepository);
  });

  test('should GetTvSeriesWatchlistSave movie to the repository', () async {
    // arrange
    when(mockTvSeriesRepository.saveWatchlistTvSeries(testTvSeriesDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTvSeriesDetail);
    // assert
    verify(mockTvSeriesRepository.saveWatchlistTvSeries(testTvSeriesDetail));
    expect(result, Right('Added to Watchlist'));
  });
}