import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:using_graphql/app/modules/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<HomeBloc>();
    _init();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  _init() async {
    await bloc.getPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persons"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: bloc.output,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(
                      data[index].name,
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
