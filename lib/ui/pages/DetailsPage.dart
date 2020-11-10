import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsPage extends StatelessWidget {
  static const String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String text = "Titre";
    if(arguments != null) text = arguments['titre'];

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: ListView.separated(
          itemBuilder: (context, position) {
            if (position == 0) {
              return Text("Header");
            } else {
              return Text("$position");
            }
          },
          separatorBuilder: (context, position){
            return Container(
              margin: EdgeInsets.only(left: 20),
              color: Colors.cyan,
              height: 4,
            );
          },
          itemCount: 42
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active),
            title: Text("airplane")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.airline_seat_recline_normal),
              title: Text("airline")
          )
        ],
        backgroundColor: Colors.lightGreenAccent,
      ),
    );
  }
}