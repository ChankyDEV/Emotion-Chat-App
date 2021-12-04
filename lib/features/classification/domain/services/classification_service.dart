import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis.dart';
import 'package:emotion_chat/utils/domain/failure.dart';

abstract class ClassificationService {
  Future<Either<Failure, SentimentAnalysis>> getSentimentAnalysis(
    Content content,
  );
}
