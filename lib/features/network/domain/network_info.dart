import 'package:emotion_chat/features/network/domain/entities/connection_status.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<ConnectionStatus> get onNetworkStatusChange;
}
