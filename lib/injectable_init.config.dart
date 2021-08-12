// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i14;

import 'blocs/auth/auth_cubit.dart' as _i21;
import 'blocs/auth_form/auth_form_bloc.dart' as _i22;
import 'blocs/more_info_form/more_info_bloc.dart' as _i27;
import 'constants/services.dart' as _i3;
import 'repositories/conversation/conversation_repository.dart' as _i24;
import 'repositories/conversation/i_conversation_repository.dart' as _i23;
import 'repositories/image_picker/i_image_picker_repository.dart' as _i25;
import 'repositories/image_picker/image_picker_repository.dart' as _i26;
import 'repositories/user/i_user_repository.dart' as _i17;
import 'repositories/user/user_repository.dart' as _i18;
import 'services/auth/firebase_auth_service.dart' as _i4;
import 'services/auth/i_auth_service.dart' as _i19;
import 'services/db/i_db_service.dart' as _i5;
import 'services/db/mongo_database_service.dart' as _i6;
import 'services/image_picker/i_image_picker_service.dart' as _i7;
import 'services/image_picker/image_picker_service.dart' as _i8;
import 'services/image_upload/amazon_image_service.dart' as _i10;
import 'services/image_upload/i_image_service.dart' as _i9;
import 'services/local_db/hive_local_db_service.dart' as _i12;
import 'services/local_db/i_local_db_service.dart' as _i11;
import 'services/network/i_network_service.dart' as _i20;
import 'services/network/network_service.dart' as _i13;
import 'services/permission/i_permission_service.dart' as _i15;
import 'services/permission/permission_service.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthService>(() => _i4.FirebaseAuthService());
  gh.lazySingleton<_i5.IDatabaseService>(() => _i6.MongoDatabaseService());
  gh.lazySingleton<_i7.IImagePickerService>(() => _i8.ImagePickerService());
  gh.lazySingleton<_i9.IImageUploadService>(
      () => _i10.AmazonImageUploadService());
  gh.lazySingleton<_i11.ILocalDatabaseService>(
      () => _i12.HiveLocalDatabaseService());
  gh.lazySingleton<_i3.INetworkService>(
      () => _i13.NetworkService(get<_i14.InternetConnectionChecker>()));
  gh.lazySingleton<_i15.IPermissionService>(() => _i16.PermissionService());
  gh.lazySingleton<_i17.IUserRepository>(() => _i18.UserRepository(
      imageService: get<_i9.IImageUploadService>(),
      authService: get<_i19.IAuthService>(),
      localDatabaseService: get<_i11.ILocalDatabaseService>(),
      networkService: get<_i20.INetworkService>()));
  gh.lazySingleton<_i21.AuthCubit>(
      () => _i21.AuthCubit(authRepository: get<_i17.IUserRepository>()));
  gh.lazySingleton<_i22.AuthFormBloc>(() => _i22.AuthFormBloc(
      userRepository: get<_i17.IUserRepository>(),
      authCubit: get<_i21.AuthCubit>(),
      networkService: get<_i20.INetworkService>()));
  gh.lazySingleton<_i23.IConversationRepository>(() =>
      _i24.ConversationRepository(
          databaseService: get<_i5.IDatabaseService>()));
  gh.lazySingleton<_i25.IImagePickerRepository>(() =>
      _i26.ImagePickerRepository(
          imagePickerService: get<_i7.IImagePickerService>(),
          permissionHandler: get<_i15.IPermissionService>()));
  gh.lazySingleton<_i27.MoreInfoFormBloc>(() => _i27.MoreInfoFormBloc(
      userRepository: get<_i17.IUserRepository>(),
      profileImagePicker: get<_i25.IImagePickerRepository>()));
  return get;
}
