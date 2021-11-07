import 'package:emotion_chat/constants/data.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<ConnectionStatus> get onNetworkStatusChange;
}
