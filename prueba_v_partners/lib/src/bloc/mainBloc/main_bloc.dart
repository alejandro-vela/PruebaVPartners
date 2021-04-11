import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';
import '../../models/user.dart';

class MainBloc extends Bloc<MainEvent, MainState> with ChangeNotifier {
  MainBloc() : super(InitialState());
  List<ModelUser> users = List<ModelUser>();
  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is InitialEvent) {
      yield InitialState();
    }
    if (event is AddDataEvent) {
      print(event.user.address.toString);
      var userTemp = ModelUser();
      userTemp = ModelUser(
          name: event.user.name,
          address: event.user.address,
          lastName: event.user.lastName);
      users.add(userTemp);
      if (event.user.address.isNotEmpty) {
        yield ShowDataState(user: users);
      }
    }
    if (event is ShowDataEvent) {
      yield ShowDataState(user: users);
    }
    if (event is ShowDetailEvent) {
      yield ShowDetailState(user: event.user);
    }
  }
}
