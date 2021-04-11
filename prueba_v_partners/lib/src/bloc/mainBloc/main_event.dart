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
  final ModelUser user;
  AddDataEvent({@required this.user});
}

class ShowDataEvent extends MainEvent {
  final ModelUser user;
  ShowDataEvent({@required this.user});
}
