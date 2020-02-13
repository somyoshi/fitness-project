import 'package:fitness_client/core/viewmodels/usuarioViewModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UsuarioViewModel()) ;
}