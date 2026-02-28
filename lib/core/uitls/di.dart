import 'package:get_it/get_it.dart';
import 'package:tasky/feature/domain/repositories/add_task_repos.dart';
import 'package:tasky/feature/domain/usecases/get_task_usecase.dart';
import 'package:tasky/feature/domain/usecases/update_task_usecase.dart';
import 'package:tasky/feature/presentation/controller/add_task_cubit/add_new_task_cubit.dart';
import '../../feature/data/data_sources/task_local_data_source.dart';
import '../../feature/data/data_sources/task_local_data_source_impl.dart';
import '../../feature/data/repositories_impl/add_task_repos_impl.dart';
import '../../feature/domain/usecases/add_task_usecase.dart';
import '../../feature/presentation/controller/home_cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => AddTaskUseCase(sl()));

  sl.registerLazySingleton<TaskRepos>(() => AddTaskReposImpl(sl()));

  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(),
  );
  sl.registerLazySingleton(() => UpdateTaskUseCase(sl()));
  sl.registerFactory(() => AddNewTaskCubit(sl()));

  sl.registerLazySingleton(() => GetTaskUseCase(sl()));

  sl.registerFactory(() => HomeCubit(sl(), sl()));
}
