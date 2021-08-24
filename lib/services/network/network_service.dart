import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService implements INetworkService {
  final InternetConnectionChecker dataConnectionChecker;

  NetworkService(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;

  @override
  Stream<ConnectionStatus> get onNetworkStatusChange =>
      dataConnectionChecker.onStatusChange
          .map((status) => networkStatusConverter(status));

  @visibleForTesting
  ConnectionStatus networkStatusConverter(InternetConnectionStatus status) {
    List<ConnectionStatus> possibleStatus = [
      ConnectionStatus.connected,
      ConnectionStatus.disconnected,
    ];
    return possibleStatus[status.index];
  }
}
