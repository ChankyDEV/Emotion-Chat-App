import 'package:emotion_chat/features/logger/domain/chat_logger.dart';
import 'package:logger/logger.dart';

class ChatLoggerImpl implements ChatLogger {
  final Logger logger;

  ChatLoggerImpl(this.logger);

  @override
  void error(String message) => logger.e(message);

  @override
  void info(String message) => logger.i(message);

  @override
  void warning(String message) => logger.w(message);
}
