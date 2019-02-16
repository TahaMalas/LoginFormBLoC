import 'package:flutter/material.dart';
import 'Bloc.dart';

class Provider extends InheritedWidget {

  final bloc = Bloc();

  @override
  bool updateShouldNotify(_) => true;

  Provider({Key key, Widget child})
      : super(key: key, child: child);


  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }

}