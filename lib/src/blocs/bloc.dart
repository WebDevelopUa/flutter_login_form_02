import 'dart:async';

import 'package:simple_flutter_login_form_02/src/blocs/validators.dart';

class Bloc extends Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Add data to stream (shortcut getter with access to the stream)
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  // Change data (shortcut getter with access to the sink)
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}

// New instance of Bloc class - Single Global Instance (Applying BLoC)
final bloc = Bloc();

