import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Se crean los 3 eventos necesarios para la navegación, inserción y
// visualización de los datos

class InitialEvent extends MainEvent {}

class AddDataEvent extends MainEvent {
  ModelUser user;
  AddDataEvent({this.user});
}

// ignore: must_be_immutable
class ShowDataEvent extends MainEvent {}

class ShowDetailEvent extends MainEvent {
  ModelUser user;
  ShowDetailEvent({@required this.user});
}
