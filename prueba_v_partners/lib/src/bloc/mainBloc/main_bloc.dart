import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> with ChangeNotifier {
  MainBloc() : super(InitialState());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is InitialEvent) {}
    if (event is AddDataEvent) {}
    if (event is ShowDataEvent) {}
  }
}
