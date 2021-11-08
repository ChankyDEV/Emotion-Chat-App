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
}
