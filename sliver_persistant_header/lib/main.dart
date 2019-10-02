import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: NetworkingPageHeader(
              minExtent: 150,
              maxExtent: 250
             ),
          )
        ],),
      
    );
  }
}

class NetworkingPageHeader implements SliverPersistentHeaderDelegate{

  final double minExtent;
  final double maxExtent;
  NetworkingPageHeader({this.minExtent,
  @required this.maxExtent});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Stack(  
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset("/Users/droidaj/Flutter-Samples/sliver_persistant_header/assets/images/sydney.jpeg",
        fit: BoxFit.cover,),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent,Colors.black54],
              stops: [0.5,1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated
            )
          ),
        ),
        Positioned(
          left:16 ,
          right: 16,
          bottom: 16,
          child: Text("Beautiful City",
          style:TextStyle(  fontSize :24, color:Colors.white.withOpacity(titleOpacity(shrinkOffset)))),
        )
      ],
    );
  }

  double titleOpacity(double shrinkOffset){
    //simple formula : fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0 , shrinkOffset) /maxExtent;  }
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
  
}