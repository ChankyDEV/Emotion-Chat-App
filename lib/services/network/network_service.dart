import 'package:emotion_chat/constants/data.dart';

abstract class NetworkService {
  Future<bool> get isConnected;
  Stream<ConnectionStatus> get onNetworkStatusChange;
}
