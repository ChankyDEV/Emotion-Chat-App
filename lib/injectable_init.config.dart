// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/auth/auth_cubit.dart' as _i22;
import 'blocs/auth_form/auth_form_bloc.dart' as _i23;
import 'blocs/more_info_form/more_info_bloc.dart' as _i28;
import 'constants/services.dart' as _i14;
import 'repositories/conversation/conversation_repository.dart' as _i25;
import 'repositories/conversation/i_conversation_repository.dart' as _i24;
import 'repositories/image_picker/i_image_picker_repository.dart' as _i26;
import 'repositories/image_picker/image_picker_repository.dart' as _i27;
import 'repositories/user/i_user_repository.dart' as _i19;
import 'repositories/user/user_repository.dart' as _i20;
import 'services/auth/i_auth_service.dart' as _i3;
import 'services/auth/mongo_auth_service.dart' as _i4;
import 'services/db/i_db_service.dart' as _i6;
import 'services/db/mongo_database_service.dart' as _i7;
import 'services/image_picker/i_image_picker_service.dart' as _i8;
import 'services/image_picker/image_picker_service.dart' as _i9;
import 'services/image_upload/amazon_image_service.dart' as _i11;
import 'services/image_upload/i_image_service.dart' as _i10;
import 'services/local_db/hive_local_db_service.dart' as _i13;
import 'services/local_db/i_local_db_service.dart' as _i12;
import 'services/network/i_network_service.dart' as _i21;
import 'services/network/network_service.dart' as _i15;
import 'services/permission/i_permission_service.dart' as _i17;
import 'services/permission/permission_service.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthService>(
      () => _i4.MongoAuthService(client: get<_i5.Client>()));
  gh.lazySingleton<_i6.IDatabaseService>(() => _i7.MongoDatabaseService());
  gh.lazySingleton<_i8.IImagePickerService>(() => _i9.ImagePickerService());
  gh.lazySingleton<_i10.IImageUploadService>(
      () => _i11.AmazonImageUploadService());
  gh.lazySingleton<_i12.ILocalDatabaseService>(
      () => _i13.HiveLocalDatabaseService());
  gh.lazySingleton<_i14.INetworkService>(
      () => _i15.NetworkService(get<_i16.DataConnectionChecker>()));
  gh.lazySingleton<_i17.IPermissionService>(() => _i18.PermissionService());
  gh.lazySingleton<_i19.IUserRepository>(() => _i20.UserRepository(
      imageService: get<_i10.IImageUploadService>(),
      authService: get<_i3.IAuthService>(),
      localDatabaseService: get<_i12.ILocalDatabaseService>(),
      networkService: get<_i21.INetworkService>()));
  gh.lazySingleton<_i22.AuthCubit>(
      () => _i22.AuthCubit(authRepository: get<_i19.IUserRepository>()));
  gh.lazySingleton<_i23.AuthFormBloc>(() => _i23.AuthFormBloc(
      userRepository: get<_i19.IUserRepository>(),
      authCubit: get<_i22.AuthCubit>(),
      networkService: get<_i21.INetworkService>()));
  gh.lazySingleton<_i24.IConversationRepository>(() =>
      _i25.ConversationRepository(
          databaseService: get<_i6.IDatabaseService>()));
  gh.lazySingleton<_i26.IImagePickerRepository>(() =>
      _i27.ImagePickerRepository(
          imagePickerService: get<_i8.IImagePickerService>(),
          permissionHandler: get<_i17.IPermissionService>()));
  gh.lazySingleton<_i28.MoreInfoFormBloc>(() => _i28.MoreInfoFormBloc(
      userRepository: get<_i19.IUserRepository>(),
      profileImagePicker: get<_i26.IImagePickerRepository>()));
  return get;
}
