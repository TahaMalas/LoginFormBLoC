import 'dart:async';

class Validators {

  final emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@') && email.contains('.'))
      sink.add(email);
    else
      sink.addError('Use a valid email format');
  });

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8)
      sink.add(password);
    else
      sink.addError('Password must be more than 8 alphanumeric numbers');
  });

}
