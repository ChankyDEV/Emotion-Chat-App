import 'dart:async';

import 'package:emotion_chat/blocs/additional_info/additional_info_bloc.dart';
import 'package:emotion_chat/blocs/auth/auth_cubit.dart';
import 'package:emotion_chat/blocs/auth_form/auth_form_bloc.dart';
import 'package:emotion_chat/constants/data.dart';
import 'package:emotion_chat/data/data_transfer_objects/auth/user_dto.dart';
import 'package:emotion_chat/helpers/validator.dart';
import 'package:emotion_chat/repositories/image_picker/i_image_picker_repository.dart';
import 'package:emotion_chat/repositories/image_picker/image_picker_repository.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository.dart';
import 'package:emotion_chat/repositories/invitation/invitation_repository_impl.dart';
import 'package:emotion_chat/repositories/user/user_repository.dart';
import 'package:emotion_chat/repositories/user/user_repository_impl.dart';
import 'package:emotion_chat/services/auth/auth_service_impl.dart';
import 'package:emotion_chat/services/auth/auth_service.dart';
import 'package:emotion_chat/services/database/database_service.dart';
import 'package:emotion_chat/services/database/database_service_impl.dart';
import 'package:emotion_chat/services/image_picker/image_picker_service.dart';
import 'package:emotion_chat/services/image_picker/image_picker_service_impl.dart';
import 'package:emotion_chat/services/image_upload/image_upload_service_impl.dart';
import 'package:emotion_chat/services/image_upload/image_upload_service.dart';
import 'package:emotion_chat/services/local_db/local_database_service_impl.dart';
import 'package:emotion_chat/services/local_db/local_database_service.dart';
import 'package:emotion_chat/services/network/network_service.dart';
import 'package:emotion_chat/services/network/network_service_impl.dart';
import 'package:emotion_chat/services/permission/permission_service.dart';
import 'package:emotion_chat/services/permission/permission_service_impl.dart';
import 'package:emotion_chat/services/routing/routing_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class Config {
  final getItInstance = GetIt.instance;

  Future<void> setup() async {
    await configureLocalStorage();
    await configureDependencies();
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
    getItInstance
      ..registerSingleton<Validator>(Validator())
      ..registerSingleton<DatabaseService>(DatabaseServiceImpl())
      ..registerSingleton<AuthService>(
        AuthServiceImpl(
          getItInstance.get<DatabaseService>(),
          StreamController<MyUser>(),
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
      ))
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
