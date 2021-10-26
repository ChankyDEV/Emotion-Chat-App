import 'dart:async';

import 'package:emotion_chat/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/data_transfer_objects/auth/user_dto.dart';
import 'package:emotion_chat/helpers/validator.dart';
import 'package:emotion_chat/repositories/chat/chat_repository.dart';
import 'package:emotion_chat/repositories/chat/chat_repository_impl.dart';
import 'package:emotion_chat/repositories/friends/friends_repository.dart';
import 'package:emotion_chat/repositories/friends/friends_repository_impl.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/repositories/image_picker/image_picker_repository.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository_impl.dart';
import 'package:emotion_chat/repositories/user/user_repository.dart';
import 'package:emotion_chat/repositories/user/user_repository_impl.dart';
import 'package:emotion_chat/services/auth/auth_service.dart';
import 'package:emotion_chat/services/auth/auth_service_impl.dart';
import 'package:emotion_chat/services/database/conversations/conversation_database_service_impl.dart';
import 'package:emotion_chat/services/database/database_service.dart';
import 'package:emotion_chat/services/database/database_service_impl.dart';
import 'package:emotion_chat/services/database/friends/invitation_database_service_impl.dart';
import 'package:emotion_chat/services/database/user/user_source.dart';
import 'package:emotion_chat/services/image_picker/image_picker_service.dart';
import 'package:emotion_chat/services/image_picker/image_picker_service_impl.dart';
import 'package:emotion_chat/services/image_upload/image_upload_service.dart';
import 'package:emotion_chat/services/image_upload/image_upload_service_impl.dart';
import 'package:emotion_chat/services/local_db/local_database_service.dart';
import 'package:emotion_chat/services/local_db/local_database_service_impl.dart';
import 'package:emotion_chat/services/network/network_service.dart';
import 'package:emotion_chat/services/network/network_service_impl.dart';
import 'package:emotion_chat/services/permission/permission_service.dart';
import 'package:emotion_chat/services/permission/permission_service_impl.dart';
import 'package:emotion_chat/services/routing/routing_service.dart';
import 'package:emotion_chat/services/utils/logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

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
          friends: FriendsDatabaseImpl(logger),
          conversations: ConversationDatabaseImpl(logger),
          users: UserDatabaseImpl(logger),
        ),
      )
      ..registerSingleton<AuthService>(
        AuthServiceImpl(
          getItInstance.get<DatabaseService>(),
          StreamController<UserDTO>(),
        ),
      )
      ..registerSingleton<ImagePickerService>(ImagePickerServiceImpl())
      ..registerSingleton<ImageUploadService>(ImageUploadServiceImpl())
      ..registerSingleton<LocalDatabaseService>(LocalDatabaseServiceImpl())
      ..registerSingleton<NetworkService>(NetworkServiceImpl(
        InternetConnectionChecker(),
      ))
      ..registerSingleton<PermissionService>(PermissionServiceImpl())
      ..registerSingleton<InvitationRepository>(InvitationRepositoryImpl(
          db: getItInstance.get<DatabaseService>(),
          local: getItInstance.get<LocalDatabaseService>(),
          network: getItInstance.get<NetworkService>()))
      ..registerSingleton<UserRepository>(
        UserRepositoryImpl(
          imageService: getItInstance.get<ImageUploadService>(),
          authService: getItInstance.get<AuthService>(),
          localDatabaseService: getItInstance.get<LocalDatabaseService>(),
          networkService: getItInstance.get<NetworkService>(),
          db: getItInstance.get<DatabaseService>(),
        ),
      )
      ..registerSingleton<IImagePickerRepository>(
        ImagePickerRepository(
            imagePickerService: getItInstance.get<ImagePickerService>(),
            permissionHandler: getItInstance.get<PermissionService>()),
      )
      ..registerSingleton<FriendsRepository>(
        FriendsRepositoryImpl(
          getItInstance.get<DatabaseService>(),
          getItInstance.get<LocalDatabaseService>(),
          getItInstance.get<NetworkService>(),
        ),
      )
      ..registerSingleton<ChatRepository>(
        ChatRepositoryImpl(
          getItInstance.get<LocalDatabaseService>(),
          getItInstance.get<NetworkService>(),
          getItInstance.get<DatabaseService>(),
        ),
      );
  }

  Future<void> _registerBlocs() async {
    getItInstance
      ..registerSingleton<AuthCubit>(
        AuthCubit(authRepository: getItInstance.get<UserRepository>()),
      )
      ..registerSingleton<AuthFormBloc>(
        AuthFormBloc(
            userRepository: getItInstance.get<UserRepository>(),
            authCubit: getItInstance.get<AuthCubit>(),
            networkService: getItInstance.get<NetworkService>()),
      )
      ..registerSingleton<AdditionalInfoBloc>(
        AdditionalInfoBloc(
            imagePickerRepository: getItInstance.get<IImagePickerRepository>(),
            userRepository: getItInstance.get<UserRepository>()),
      );
  }

  Future<void> configureLocalStorage() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(UserDTOAdapter());
  }
}
