import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/bloc/simple_bloc.dart';
import 'src/bloc/mainBloc/bloc.dart';
import 'src/pages/homePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocDelegate();
  runApp(BlocProvider(
    create: (context) => MainBloc()..add(InitialEvent()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is InitialState) {
          return HomePage();
        }
        if (state is AddDataState) {}
        return Container();
      }),
    );
  }
}
