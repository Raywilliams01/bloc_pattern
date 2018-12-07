import 'dart:async';

import 'validators.dart';

class Bloc extends Object with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

//  Add Data to Stream
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

//  Change Data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

//  Clean Up (Close the Sink Instances)
  dispose() {
    _email.close();
    _password.close();
  }
}


final bloc = Bloc();