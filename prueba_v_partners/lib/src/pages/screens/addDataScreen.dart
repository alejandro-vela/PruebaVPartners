import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/mainBloc/bloc.dart';
import '../../pages/addDataPage.dart';

class AddDataScreen extends StatefulWidget {
  AddDataScreen({Key key}) : super(key: key);

  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MainBloc>(
          create: (context) => MainBloc()..add(InitialEvent()),
          child: AddDataPage()),
    );
  }
}
