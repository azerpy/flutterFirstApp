
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m2_app/data/models/Pokemon.dart';
import 'package:m2_app/data/repository/pokemonRepository.dart';
import 'package:m2_app/pages/DetailsPage.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = "/home";
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Future<Pokemon> _pokemon;

  @override
  void initState() {
    super.initState();
    _pokemon = PokemonRepository().getDitto();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        bottom: true,
        child: FutureBuilder(
            future: _pokemon,
            builder: (BuildContext context, AsyncSnapshot<Pokemon> data) {
              if(data.hasData){
                Pokemon pokemon = data.data;
                return Text(pokemon.name);
              } else {
                return CircularProgressIndicator();
              }
            }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}