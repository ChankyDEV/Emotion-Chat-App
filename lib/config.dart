import 'dart:async';

import 'package:emotion_chat/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:emotion_chat/features/chat/data/services/chat_service_impl.dart';
import 'package:emotion_chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:emotion_chat/features/chat/domain/services/chat_service.dart';
import 'package:emotion_chat/features/friend/data/repositories/friends_repository_impl.dart';
import 'package:emotion_chat/features/friend/data/services/friends_service_impl.dart';
import 'package:emotion_chat/features/friend/domain/repositories/friends_repository.dart';
import 'package:emotion_chat/features/friend/domain/services/friends_service.dart';
import 'package:emotion_chat/features/image/data/repositories/image_repository_impl.dart';
import 'package:emotion_chat/features/image/data/services/image_service_impl.dart';
import 'package:emotion_chat/features/image/domain/repositories/image_repository.dart';
import 'package:emotion_chat/features/image/domain/services/image_service.dart';
import 'package:emotion_chat/features/logger/data/chat_logger_impl.dart';
import 'package:emotion_chat/features/logger/domain/chat_logger.dart';
import 'package:emotion_chat/features/network/data/network_info_impl.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/features/permission/data/permission_info_impl.dart';
import 'package:emotion_chat/features/permission/domain/permission_info.dart';
import 'package:emotion_chat/features/routing/routing_service.dart';
import 'package:emotion_chat/features/user/data/dtos/user_dto.dart';
import 'package:emotion_chat/features/user/data/repositories/auth_repository_impl.dart';
import 'package:emotion_chat/features/user/data/repositories/local_repository_impl.dart';
import 'package:emotion_chat/features/user/data/repositories/user_repository_impl.dart';
import 'package:emotion_chat/features/user/data/services/user_service_impl.dart';
import 'package:emotion_chat/features/user/domain/repositories/auth_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/local_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:emotion_chat/features/user/domain/services/auth_service.dart';
import 'package:emotion_chat/features/user/presentation/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/features/user/presentation/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/utils/data/utils/validator.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'features/user/presentation/blocs/auth/auth_cubit.dart';

class Config {
  final getItInstance = GetIt.instance;

  Future<void> setup() async {
    _configureLogger();
    await configureLocalStorage();
    await configureDependencies();
  }

  void _configureLogger() {
    getItInstance.registerSingleton<ChatLogger>(
      ChatLoggerImpl(
        Logger(
          printer: PrettyPrinter(),
        ),
      ),
    );
  }

  Future<void> configureDependencies() async {
    await _registerServices();
    await _registerBlocs();
    _registerRouting();
  }

  void _registerRouting() {
    getItInstance.registerSingleton<RoutingService>(
      RoutingService(
        GetIt.I.get<AuthCubit>(),
        GetIt.I.get<AuthFormBloc>(),
        GetIt.I.get<AdditionalInfoBloc>(),
      ),
    );
  }

  Future<void> _registerServices() async {
    final logger = getItInstance.get<ChatLogger>();
    getItInstance
      ..registerSingleton<Validator>(Validator())
      ..registerSingleton<FriendsRepository>(FriendsRepositoryImpl(logger))
      ..registerSingleton<UserRepository>(UserRepositoryImpl(logger))
      ..registerSingleton<AuthRepository>(
        AuthRepositoryImpl(
          getItInstance.get<UserRepository>(),
          StreamController<UserDTO>(),
        ),
      )
      ..registerSingleton<ChatRepository>(ChatRepositoryImpl(logger))
      ..registerSingleton<ImageRepository>(ImageRepositoryImpl())
      ..registerSingleton<LocalRepository>(LocalRepositoryImpl())
      ..registerSingleton<NetworkInfo>(NetworkInfoImpl(
        InternetConnectionChecker(),
      ))
      ..registerSingleton<PermissionInfo>(PermissionInfoImpl())
      ..registerSingleton<AuthService>(
        UserServiceImpl(
          imageRepository: getItInstance.get<ImageRepository>(),
          authRepository: getItInstance.get<AuthRepository>(),
          localRepository: getItInstance.get<LocalRepository>(),
          networkInfo: getItInstance.get<NetworkInfo>(),
          userRepository: getItInstance.get<UserRepository>(),
        ),
      )
      ..registerSingleton<ImageService>(
        ImageServiceImpl(
            imageRepository: getItInstance.get<ImageRepository>(),
            permissionHandler: getItInstance.get<PermissionInfo>()),
      )
      ..registerSingleton<FriendsService>(
        FriendsServiceImpl(
          getItInstance.get<FriendsRepository>(),
          getItInstance.get<UserRepository>(),
          getItInstance.get<LocalRepository>(),
          getItInstance.get<NetworkInfo>(),
        ),
      )
      ..registerSingleton<ChatService>(
        ChatServiceImpl(
          getItInstance.get<LocalRepository>(),
          getItInstance.get<NetworkInfo>(),
          getItInstance.get<ChatRepository>(),
          getItInstance.get<UserRepository>(),
        ),
      );
  }

  Future<void> _registerBlocs() async {
    getItInstance
      ..registerSingleton<AuthCubit>(
        AuthCubit(authRepository: getItInstance.get<AuthService>()),
      )
      ..registerSingleton<AuthFormBloc>(
        AuthFormBloc(
            userRepository: getItInstance.get<AuthService>(),
            authCubit: getItInstance.get<AuthCubit>(),
            networkService: getItInstance.get<NetworkInfo>()),
      )
      ..registerSingleton<AdditionalInfoBloc>(
        AdditionalInfoBloc(
            imagePickerRepository: getItInstance.get<ImageService>(),
            userRepository: getItInstance.get<AuthService>()),
      );
  }

  Future<void> configureLocalStorage() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(UserDTOAdapter());
  }
}
