import 'dart:async';

import 'package:emotion_chat/features/network/presentation/blocs/network/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CustomState<T extends StatefulWidget> extends State {
  bool _hasInternetConnection = true;

  bool get isOrientedVertically =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  bool get isOrientedHorizontally =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;

  bool get hasInternetConnection => _hasInternetConnection;

  T get widget => super.widget as T;

  late final StreamSubscription<NetworkState> _networkStreamSub;

  @override
  void initState() {
    _networkStreamSub = BlocProvider.of<NetworkBloc>(context)
        .stream
        .asBroadcastStream()
        .listen((networkState) {
      setState(() {
        _hasInternetConnection = networkState.hasInternetConnection;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _networkStreamSub.cancel();
    super.dispose();
  }
}
