import 'package:emotion_chat/constants/data.dart';

abstract class INetworkService {
  Future<bool> get isConnected;
  Stream<ConnectionStatus> get onNetworkStatusChange;
}
