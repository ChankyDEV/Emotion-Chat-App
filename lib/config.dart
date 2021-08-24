import 'package:emotion_chat/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/data/data_transfer_objects/auth/user_dto.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/repositories/image_picker/image_picker_repository.dart';
import 'package:emotion_chat/repositories/user/i_user_repository.dart';
import 'package:emotion_chat/repositories/user/user_repository.dart';
import 'package:emotion_chat/services/auth/firebase_auth_service.dart';
import 'package:emotion_chat/services/auth/i_auth_service.dart';
import 'package:emotion_chat/services/database/database_service.dart';
import 'package:emotion_chat/services/database/database_service_impl.dart';
import 'package:emotion_chat/services/image_picker/i_image_picker_service.dart';
import 'package:emotion_chat/services/image_picker/image_picker_service.dart';
import 'package:emotion_chat/services/image_upload/firebase_storage_service.dart';
import 'package:emotion_chat/services/image_upload/i_image_service.dart';
import 'package:emotion_chat/services/local_db/hive_local_db_service.dart';
import 'package:emotion_chat/services/local_db/i_local_db_service.dart';
import 'package:emotion_chat/services/network/i_network_service.dart';
import 'package:emotion_chat/services/network/network_service.dart';
import 'package:emotion_chat/services/permission/i_permission_service.dart';
import 'package:emotion_chat/services/permission/permission_service.dart';
import 'package:emotion_chat/services/routing/routing_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class Config {
  final getItInstance = GetIt.instance;

  Future<void> setup() async {
    await configureDependencies();
    await configureLocalStorage();
  }

  Future<void> configureDependencies() async {
    await _registerServices();
    await _registerBlocs();
  }

  Future<void> _registerServices() async {
    getItInstance
      ..registerSingleton<RoutingService>(RoutingService())
      ..registerSingleton<DatabaseService>(DatabaseServiceImpl())
      ..registerSingleton<IAuthService>(
        FirebaseAuthService(getItInstance.get<DatabaseService>()),
      )
      ..registerSingleton<IImagePickerService>(ImagePickerService())
      ..registerSingleton<IImageUploadService>(FirebaseImageUploadService())
      ..registerSingleton<ILocalDatabaseService>(HiveLocalDatabaseService())
      ..registerSingleton<INetworkService>(NetworkService(
        InternetConnectionChecker(),
      ))
      ..registerSingleton<IPermissionService>(PermissionService())
      ..registerSingleton<IUserRepository>(
        UserRepository(
          imageService: getItInstance.get<IImageUploadService>(),
          authService: getItInstance.get<IAuthService>(),
          localDatabaseService: getItInstance.get<ILocalDatabaseService>(),
          networkService: getItInstance.get<INetworkService>(),
          db: getItInstance.get<DatabaseService>(),
        ),
      )
      ..registerSingleton<IImagePickerRepository>(
        ImagePickerRepository(
            imagePickerService: getItInstance.get<IImagePickerService>(),
            permissionHandler: getItInstance.get<IPermissionService>()),
      );
  }

  Future<void> _registerBlocs() async {
    getItInstance
      ..registerSingleton<AuthCubit>(
        AuthCubit(authRepository: getItInstance.get<IUserRepository>()),
      )
      ..registerSingleton<AuthFormBloc>(
        AuthFormBloc(
            userRepository: getItInstance.get<IUserRepository>(),
            authCubit: getItInstance.get<AuthCubit>(),
            networkService: getItInstance.get<INetworkService>()),
      )
      ..registerSingleton<AdditionalInfoBloc>(
        AdditionalInfoBloc(
            imagePickerRepository: getItInstance.get<IImagePickerRepository>(),
            userRepository: getItInstance.get<IUserRepository>()),
      );
  }

  Future<void> configureLocalStorage() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(UserDTOAdapter());
  }
}
