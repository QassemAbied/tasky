import 'package:get_it/get_it.dart';
import 'package:tasky/feature/domain/repositories/add_task_repos.dart';
import 'package:tasky/feature/domain/usecases/add_quote_usecase.dart';
import 'package:tasky/feature/domain/usecases/add_user_name_use_case.dart';
import 'package:tasky/feature/domain/usecases/delete_task_usecase.dart';
import 'package:tasky/feature/domain/usecases/edit_task_usecase.dart';
import 'package:tasky/feature/domain/usecases/get_image_usecase.dart';
import 'package:tasky/feature/domain/usecases/get_quote_usecase.dart';
import 'package:tasky/feature/domain/usecases/get_task_usecase.dart';
import 'package:tasky/feature/domain/usecases/get_user_name_usecase.dart';
import 'package:tasky/feature/domain/usecases/logout_usecase.dart';
import 'package:tasky/feature/domain/usecases/upload_image_usecase.dart';
import 'package:tasky/feature/presentation/controller/add_task_controller/add_task_provider.dart';
import 'package:tasky/feature/presentation/controller/user_details/user_details_cubit.dart';
import '../../feature/data/data_sources/task_local_data_source.dart';
import '../../feature/data/data_sources/task_local_data_source_impl.dart';
import '../../feature/data/repositories_impl/add_task_repos_impl.dart';
import '../../feature/domain/usecases/add_task_usecase.dart';
import '../../feature/presentation/controller/home_controller/home_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => AddTaskUseCase(sl()));

  sl.registerLazySingleton<TaskRepos>(() => AddTaskReposImpl(sl()));

  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(),
  );
  sl.registerLazySingleton(() => DeleteTaskUseCase(sl()));
  sl.registerLazySingleton(() => GetUserNameUseCase(sl()));
  sl.registerLazySingleton(() => EditTaskUseCase(sl()));
  sl.registerLazySingleton(() => AddUserNameUseCase(sl()));
  sl.registerLazySingleton(() => GetQuoteUseCase(sl()));
  sl.registerLazySingleton(() => AddQuoteUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => GetImageUseCase(sl()));
  sl.registerLazySingleton(() => UploadImageUseCase(sl()));
  sl.registerFactory(() => AddTaskProvider(sl()));

  sl.registerLazySingleton(() => GetTaskUseCase(sl()));
  sl.registerLazySingleton(() => HomeProvider(sl(),sl(),sl(), ),);
  sl.registerLazySingleton(() => UserDetailsCubit(sl(), sl(),sl(), sl(),sl(),sl(),sl(),));
}
