import 'package:dio/dio.dart';
import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/domain/repositories/classification_repository.dart';
import 'package:emotion_chat/utils/data/utils/error_messages.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';

class ClassificationRepositoryImpl implements ClassificationRepository {
  final Dio _dio;

  ClassificationRepositoryImpl(this._dio);

  final _url =
      'https://depressionclassification.herokuapp.com/text_classification';

  @override
  Future<SentimentAnalysisDTO> getSentimentAnalysis(Content content) async {
    final queryParameters = {
      'message': content.value,
    };
    try {
      final response = await _dio.post(_url, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return SentimentAnalysisDTO.fromJson(response.data);
      } else {
        throw ClassificationException(
            message: ErrorMessages.classification.error);
      }
    } catch (e) {
      throw ClassificationException(message: ErrorMessages.internet.error);
    }
  }
}
