import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m2_app/data/models/cat.dart';
import 'package:m2_app/data/repository/catsRepository.dart';

class CatsPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _catPageState();
}

class _catPageState extends State<CatsPages> {

  final _catsRepository = CatsRepository.instance;

  Animation<double> _opacityAnimation;

  AnimationController _animationController;

  @override
  void initState(){
    _animationController = AnimationController(
      duration: Duration(seconds:4)
    )
    ..addListener((status) {
      if(status == AnimationStatus.completed){
        return null;
      }
    })

    _opacityAnimation = Tween<double>(begin: 0.0, end:1.0).animate(
      CurvedAnimation(
        parent: _animationController
      )
    );

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LES CHATS")
      ),
      body: FutureBuilder(
        future: _catsRepository.getCats(),
        builder: (BuildContext context, AsyncSnapshot<List<Cat>> cat) {
          if(cat.hasData){
            return ListView.builder(
              itemCount: cat.data.length,
              itemBuilder: (context, position){
                return Image.network(cat.data[position].url);
              }
            );
          } else {
            return InkWell(
              onTap: (){
                print("toto")
              },
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  CircularProgressIndicator(),
                  CircularProgressIndicator(),
                  CircularProgressIndicator(),
                  CircularProgressIndicator()
                ]
              )
            )
          }
        }
      )
    );
  }
}