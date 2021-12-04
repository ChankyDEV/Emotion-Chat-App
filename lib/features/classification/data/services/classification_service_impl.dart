import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/mappers/sentiment_analysis_mapper.dart';
import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis.dart';
import 'package:emotion_chat/features/classification/domain/repositories/classification_repository.dart';
import 'package:emotion_chat/features/classification/domain/services/classification_service.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/utils/data/utils/error_messages.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

class ClassificationServiceImpl implements ClassificationService {
  final ClassificationRepository _repository;
  final SentimentAnalysisMapper _mapper;
  final NetworkInfo _networkInfo;

  ClassificationServiceImpl(
    this._repository,
    this._mapper,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, SentimentAnalysis>> getSentimentAnalysis(
    Content content,
  ) async {
    try {
      if (await _networkInfo.isConnected) {
        final dto = await _repository.getSentimentAnalysis(content);
        return right(_mapper.toDomain(dto));
      } else {
        return left(Failure(message: ErrorMessages.internet.noConnection));
      }
    } on ClassificationException catch (e) {
      return left(
        Failure(message: ErrorMessages.classification.error),
      );
    }
  }
}
