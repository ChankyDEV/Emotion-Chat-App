import 'dart:convert';

import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/domain/repositories/classification_repository.dart';
import 'package:emotion_chat/utils/data/utils/error_messages.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:http/http.dart';

class ClassificationRepositoryImpl implements ClassificationRepository {
  final Client _client;

  ClassificationRepositoryImpl(this._client);

  final String _url = 'http://127.0.0.1:5000/text_classification';

  @override
  Future<SentimentAnalysisDTO> getSentimentAnalysis(Content content) async {
    final path = '$_url/${content.value}';
    final response = await _client.get(
      Uri(path: path),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return SentimentAnalysisDTO.fromJson(jsonDecode(response.body), content);
    } else {
      throw ClassificationException(
          message: ErrorMessages.classification.error);
    }
  }
}
