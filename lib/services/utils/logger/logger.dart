import 'package:logger/logger.dart';

abstract class ChatLogger {
  void info(String message);
  void warning(String message);
  void error(String message);
}

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
