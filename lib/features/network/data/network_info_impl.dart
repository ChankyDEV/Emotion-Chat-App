import 'package:emotion_chat/features/network/domain/entities/connection_status.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker dataConnectionChecker;

  NetworkInfoImpl(this.dataConnectionChecker);

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
