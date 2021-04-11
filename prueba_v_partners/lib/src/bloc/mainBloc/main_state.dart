import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../models/user.dart';

abstract class MainState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends MainState {}

class AddDataState extends MainState {
  ModelUser user;

  AddDataState({@required this.user});
}

class ShowDataState extends MainState {
  List<ModelUser> user;

  ShowDataState({@required this.user});
}

class ShowDetailState extends MainState {
  ModelUser user;

  ShowDetailState({@required this.user});
}
