import 'package:flutter/material.dart';

void main() => runApp(MaterialApp( 
  home:HomePage()
));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: <Widget>[
        SliverAppBar(  
          leading: Icon(Icons.chevron_left),
          title: Text("Admin"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.share),onPressed: (){},)
          ],
          // pinned: true, // will pin the SlioverApp bar to true
          floating: true, // app bar becomes invisible as soons as user scrolls up
          expandedHeight: 110,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver App"),
          ),
        )
      ],


      
    );
  }
}