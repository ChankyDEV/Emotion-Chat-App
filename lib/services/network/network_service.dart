import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: INetworkService)
class NetworkService implements INetworkService {
  final DataConnectionChecker dataConnectionChecker;

  NetworkService(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;

  @override
  Stream<ConnectionStatus> get onNetworkStatusChange =>
      dataConnectionChecker.onStatusChange
          .map((status) => networkStatusConverter(status));

  @visibleForTesting
  ConnectionStatus networkStatusConverter(DataConnectionStatus status) {
    List<ConnectionStatus> possibleStatus = [
      ConnectionStatus.disconnected,
      ConnectionStatus.connected,
    ];
    return possibleStatus[status.index];
  }
}
