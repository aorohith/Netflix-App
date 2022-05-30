import 'package:netflix/core/failures.dart/main_failure.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:dartz/dartz.dart';

abstract class IDownlodsRepo{
  Future<Either<MainFailure,List<Downloads>>> getDownloadsImage();
}