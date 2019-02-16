import 'dart:async';
import 'Validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //add data to stream
  Function(String) get changeEmail => _email.sink.add;

  //retrieve data from stream
  Stream<String> get email => _email.stream.transform(emailValidator);

  //add data to stream
  Function(String) get changePassword => _password.sink.add;

  //retrieve data from stream
  Stream<String> get password => _password.stream.transform(passwordValidator);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  performLogin() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('valid email $validEmail');
    print('valid password $validPassword');

  }

  dispose() {
    _email.close();
    _password.close();
  }

}
