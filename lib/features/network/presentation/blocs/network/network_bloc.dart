import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/constants/services.dart';
import 'package:meta/meta.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final NetworkInfo _network;
  late final StreamSubscription<ConnectionStatus> _networkSub;

  NetworkBloc(this._network) : super(HasInternetConnection()) {
    _networkSub = _network.onNetworkStatusChange.listen((status) {
      if (status == ConnectionStatus.connected) {
        add(HasInternetConnectionEvent());
      } else {
        add(NoInternetConnectionEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _networkSub.cancel();
    return super.close();
  }

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is HasInternetConnectionEvent) {
      yield HasInternetConnection();
    } else {
      yield NoInternetConnection();
    }
  }
}
