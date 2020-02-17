import 'package:fitness_client/core/models/avisoModel.dart';
import 'package:fitness_client/core/providers/avisoProvider.dart';


class AvisoViewModel{
  AvisoProvider _avisoProvider = AvisoProvider();
  Stream<List<AvisoModel>> getAvisos() {
    return _avisoProvider.getAvisos();
  }

  void deleteAviso(AvisoModel aviso) {
    return _avisoProvider.delete(aviso);
  }

  void createAviso(AvisoModel aviso) {
    return _avisoProvider.create(aviso);
  }

  void updateAviso(AvisoModel aviso) {
    return _avisoProvider.update(aviso);
  }
}
