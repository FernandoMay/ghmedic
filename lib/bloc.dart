import 'package:ghmedic/empleado.dart';
import 'package:ghmedic/repositories.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<Empleado> _subject = BehaviorSubject<Empleado>();

  getUser() async {
    Empleado response = await _repository.getUser();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<Empleado> get subject => _subject;
}

final bloc = UserBloc();
