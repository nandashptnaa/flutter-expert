import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvseries/tvseries.dart';
import 'package:ditonton/domain/repositories/tvseries_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedTvSeries{
  final TvRepository repository;

  GetTopRatedTvSeries(this.repository);
  Future<Either<Failure, List<TvSeries>>> execute(){
    return repository.getTopRatedTvSeries();
  }
}