import 'dart:async';

import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/features/friend/data/repositories/friends_repository_impl.dart';
import 'package:emotion_chat/features/friend/data/services/friends_service_impl.dart';
import 'package:emotion_chat/features/friend/domain/repositories/friends_repository.dart';
import 'package:emotion_chat/features/friend/domain/services/friends_service.dart';
import 'package:emotion_chat/features/image/data/repositories/image_repository_impl.dart';
import 'package:emotion_chat/features/image/data/services/image_service_impl.dart';
import 'package:emotion_chat/features/image/domain/repositories/image_repository.dart';
import 'package:emotion_chat/features/image/domain/services/image_service.dart';
import 'package:emotion_chat/features/network/data/network_info_impl.dart';
import 'package:emotion_chat/features/network/domain/network_info.dart';
import 'package:emotion_chat/features/user/data/dtos/user_dto.dart';
import 'package:emotion_chat/features/user/data/repositories/user_repository_impl.dart';
import 'package:emotion_chat/features/user/data/services/user_service_impl.dart';
import 'package:emotion_chat/features/user/domain/repositories/auth_repository.dart';
import 'package:emotion_chat/features/user/domain/repositories/user_repository.dart';
import 'package:emotion_chat/features/user/domain/services/auth_service.dart';
import 'package:emotion_chat/features/user/presentation/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/features/user/presentation/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/helpers/validator.dart';
import 'package:emotion_chat/repositories/chat/chat_repository.dart';
import 'package:emotion_chat/repositories/chat/chat_repository_impl.dart';
import 'package:emotion_chat/services/database/conversations/conversation_database_service_impl.dart';
import 'package:emotion_chat/services/database/database_service.dart';
import 'package:emotion_chat/services/database/database_service_impl.dart';
import 'package:emotion_chat/services/local_db/local_database_service.dart';
import 'package:emotion_chat/services/local_db/local_database_service_impl.dart';
import 'package:emotion_chat/services/permission/permission_service.dart';
import 'package:emotion_chat/services/permission/permission_service_impl.dart';
import 'package:emotion_chat/services/routing/routing_service.dart';
import 'package:emotion_chat/services/utils/logger/logger.dart';
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
      ..registerSingleton<DatabaseService>(
        DatabaseServiceImpl(
          friends: FriendsRepositoryImpl(logger),
          conversations: ConversationDatabaseImpl(logger),
          users: UserRepositoryImpl(logger),
        ),
      )
      ..registerSingleton<UserRepository>(UserRepositoryImpl(logger))
      ..registerSingleton<ImageRepository>(ImageRepositoryImpl())
      ..registerSingleton<LocalDatabaseService>(LocalDatabaseServiceImpl())
      ..registerSingleton<NetworkInfo>(NetworkInfoImpl(
        InternetConnectionChecker(),
      ))
      ..registerSingleton<PermissionService>(PermissionServiceImpl())
      ..registerSingleton<AuthService>(
        UserServiceImpl(
          imageService: getItInstance.get<ImageService>(),
          authService: getItInstance.get<AuthRepository>(),
          localDatabaseService: getItInstance.get<LocalDatabaseService>(),
          networkService: getItInstance.get<NetworkInfo>(),
          db: getItInstance.get<DatabaseService>(),
        ),
      )
      ..registerSingleton<ImageService>(
        ImageServiceImpl(
            imageRepository: getItInstance.get<ImageRepository>(),
            permissionHandler: getItInstance.get<PermissionService>()),
      )
      ..registerSingleton<FriendsService>(
        FriendsServiceImpl(
          getItInstance.get<FriendsRepository>(),
          getItInstance.get<UserRepository>(),
          getItInstance.get<LocalDatabaseService>(),
          getItInstance.get<NetworkInfo>(),
        ),
      )
      ..registerSingleton<ChatRepository>(
        ChatRepositoryImpl(
          getItInstance.get<LocalDatabaseService>(),
          getItInstance.get<NetworkInfo>(),
          getItInstance.get<DatabaseService>(),
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
