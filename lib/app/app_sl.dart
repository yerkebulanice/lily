import 'package:get_it/get_it.dart';
import 'package:lily/app/core/service-locator/service_locator.dart';
// import 'package:lily/app/data/global_bloc/global_bloc.dart';
import 'package:lily/app/data/type_bloc/type_bloc.dart';

class AppSl extends ServiceLocator {
  AppSl();

  @override
  Future<void> call(GetIt sl) async {
    // sl.registerLazySingleton(() => GlobalBloc());
    sl.registerLazySingleton(() => TypeBloc());
  }
}
