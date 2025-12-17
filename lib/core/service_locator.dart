import 'package:booknoke/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:booknoke/features/auth/data/datasource/auth_remote_data_source_impl.dart';
import 'package:booknoke/features/auth/data/repository/auth_repository_impl.dart';
import 'package:booknoke/features/auth/domain/repository/auth_repository.dart';
import 'package:booknoke/features/auth/domain/usecase/login_usecase.dart';
import 'package:booknoke/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:booknoke/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

// Create an instance of GetIt
final sl = GetIt.instance;

void setupServiceLocator() {
  // BLoCs
  // We register AuthBloc as a factory. This means a new instance
  // will be created every time it's requested from the service locator.
  // This is useful for Blocs that manage screen-level state.
  sl.registerFactory(() => AuthBloc(
        loginUseCase: sl(),
        signUpUseCase: sl(),
      ));

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  // Repositories
  // We register the implementation but specify the abstract type.
  // This allows us to easily swap implementations later.
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
}