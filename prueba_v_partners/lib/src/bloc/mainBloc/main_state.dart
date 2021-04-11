import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../models/user.dart';

abstract class MainState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends MainState {}

class AddDataState extends MainState {
  final ModelUser user;

  AddDataState({@required this.user});
}

class ShowDataState extends MainState {
  final ModelUser user;

  ShowDataState({@required this.user});
}
