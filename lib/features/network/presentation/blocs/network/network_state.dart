part of 'network_bloc.dart';

@immutable
abstract class NetworkState {
  final bool hasInternetConnection;

  NetworkState({required this.hasInternetConnection});
}

class HasInternetConnection extends NetworkState {
  HasInternetConnection() : super(hasInternetConnection: true);
}

class NoInternetConnection extends NetworkState {
  NoInternetConnection() : super(hasInternetConnection: false);
}
