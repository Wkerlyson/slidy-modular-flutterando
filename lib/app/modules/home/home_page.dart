import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Home'),
      ),
      body: Observer(
        builder: (_) {
          if (homeController.pokemons.error != null) {
            return Center(
              child: RaisedButton(
                child: Text('Press to refresh'),
                onPressed: homeController.fetchPokemons,
              ),
            );
          }

          if (homeController.pokemons.value == null) {
            return Center(child: CircularProgressIndicator());
          }

          var list = homeController.pokemons.value;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(list[index].name),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://robohash.org/andrea${list[index].name}'),
                  backgroundColor: Colors.grey[300],
                ),
                subtitle: Text(list[index].url),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: homeController.fetchPokemons,
        //Navigator.pushNamed(context, '/other/${homeController.text}');
        //Modular.to.pushNamed('/other');
        child: Icon(Icons.refresh),
      ),
    );
  }
}
