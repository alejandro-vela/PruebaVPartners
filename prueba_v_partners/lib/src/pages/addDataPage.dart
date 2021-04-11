import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/mainBloc/bloc.dart';
import '../models/user.dart';

class AddDataPage extends StatefulWidget {
  @override
  _AddDataPageState createState() => _AddDataPageState();
}

ModelUser user = ModelUser();
List<String> address = [];
final controllerAddress = TextEditingController();

class _AddDataPageState extends State<AddDataPage> {
  @override
  void initState() {
    super.initState();
    address.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      if (state is InitialState) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Agregar Usuario"),
            backgroundColor: Color.fromRGBO(143, 20, 240, 1),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  BlocProvider.of<MainBloc>(context)..add(ShowDataEvent());
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/logo1.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: TextField(
                    onChanged: (v) {
                      setState(() {
                        user.name = v;
                      });
                    },
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      hintText: "Nombre",
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(143, 20, 240, 0.4),
                            width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextField(
                    onChanged: (v) {
                      setState(() {
                        user.lastName = v;
                      });
                    },
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      hintText: "Apellido",
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(143, 20, 240, 0.4),
                            width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextField(
                    controller: controllerAddress,
                    onSubmitted: (v) {
                      setState(() {
                        address.add(v);
                        controllerAddress.clear();
                      });
                    },
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      hintText: "Direccion Fisica",
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(143, 20, 240, 0.4),
                            width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                address != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Container(
                          height: 120,
                          width: 100,
                          child: ListView.builder(
                              itemCount: address.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return Text(
                                  address[index],
                                  style: TextStyle(fontSize: 20),
                                );
                              }),
                        )),
                      )
                    : SizedBox(),
                Spacer(),
                ButtonTheme(
                  minWidth: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      user.address = address;
                      BlocProvider.of<MainBloc>(context)
                        ..add(AddDataEvent(user: user));
                    },
                    child: Text(
                      'Registrar',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    color: Color.fromRGBO(143, 20, 240, 1),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      if (state is ShowDataState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(143, 20, 240, 1),
            title: Text("Registros"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(InitialEvent());
                }),
          ),
          body: ListView.builder(
              itemCount: state.user.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return _buildItem(state.user[index]);
              }),
        );
      }
      if (state is ShowDetailState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(143, 20, 240, 1),
            title: Text("Detalle de Usuario"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(ShowDataEvent());
                }),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
              ),
              Text(
                "Nombre",
                style: TextStyle(fontSize: 20),
              ),
              Text(state.user.name, style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 30,
              ),
              Text("Apellido", style: TextStyle(fontSize: 20)),
              Text(state.user.lastName, style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 30,
              ),
              Text("Direcciones", style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 100,
                height: 100,
                child: Center(
                  child: ListView.builder(
                      itemCount: state.user.address.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Center(
                          child: Text(state.user.address[index],
                              style: TextStyle(fontSize: 20)),
                        );
                      }),
                ),
              ),
            ],
          )),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _buildItem(ModelUser users) {
    return ListTile(
      title: Text(users.name),
      subtitle: Text(users.lastName),
      leading: Icon(Icons.perm_contact_calendar),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        BlocProvider.of<MainBloc>(context)..add(ShowDetailEvent(user: users));
      },
    );
  }
}
