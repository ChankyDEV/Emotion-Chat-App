import 'package:dio/dio.dart';
import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/domain/repositories/classification_repository.dart';
import 'package:emotion_chat/utils/data/utils/error_messages.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:http/http.dart';

class ClassificationRepositoryImpl implements ClassificationRepository {
  final Client _client;

  ClassificationRepositoryImpl(this._client);

  final _url = 'http://192.168.0.107:5000//text_classification';

  @override
  Future<SentimentAnalysisDTO> getSentimentAnalysis(Content content) async {
    final queryParameters = {
      'message': content.value,
    };
    final dio = Dio();
    final response = await dio.post(_url, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return SentimentAnalysisDTO.fromJson(response.data);
    } else {
      throw ClassificationException(
          message: ErrorMessages.classification.error);
    }
  }
}
