import 'package:ghmedic/empleado.dart';
import 'package:ghmedic/home.dart';

class UserRepository {
  UserApiProvider _apiProvider = UserApiProvider();

  Future<Empleado> getUser() {
    return _apiProvider.getData();
  }
}
