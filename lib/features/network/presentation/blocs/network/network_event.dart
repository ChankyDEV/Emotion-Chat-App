part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent {}

class HasInternetConnectionEvent extends NetworkEvent {}

class NoInternetConnectionEvent extends NetworkEvent {}
