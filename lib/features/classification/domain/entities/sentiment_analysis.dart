import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis_result.dart';
import 'package:equatable/equatable.dart';

class SentimentAnalysis extends Equatable {
  final double sadness;
  final double other;

  const SentimentAnalysis(
    this.sadness,
    this.other,
  );

  factory SentimentAnalysis.empty() => SentimentAnalysis(-1, -1);

  @override
  List<Object?> get props => [sadness, other];

  @override
  bool? get stringify => true;

  SentimentAnalysisResult get result => _getResult();

  SentimentAnalysisResult _getResult() {
    if (sadness == -1 || other == -1) {
      return SentimentAnalysisResult.none;
    }
    return sadness > 0.5
        ? SentimentAnalysisResult.sad
        : SentimentAnalysisResult.other;
  }
}
