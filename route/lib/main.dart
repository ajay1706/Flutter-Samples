import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(  
// initialRoute: '/',

// routes: <String, WidgetBuilder>{
//   '/':(context)=> HomePage(),
//   '/second' : (context) => SecondScreen()
// },
home:HomePage(),
onGenerateRoute: (RouteSettings settings){
  switch(settings.name){
    case '/':
    return MaterialPageRoute(builder: (context )=> HomePage());
    break;
    case '/second':
    User user = settings.arguments;
    return MaterialPageRoute(builder: (context )=> SecondScreen(user: user,));
    break;

  }

},



));


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),

      ),
      body: Center(
       child: RaisedButton( 
         child: Text("Press me"),
         onPressed: () {
           User user = new User(21, "Ajay");

          //  Route route = MaterialPageRoute(  
          //    builder: (BuildContext context)=> SecondScreen(user: user)
             
          //  );
           Navigator.pushNamed(context, '/second',arguments: user);
         },

        )
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
 final User user ;

SecondScreen({this.user});
  @override
  Widget build(BuildContext context) {



    //method 2 for using routes
// RouteSettings settings = ModalRoute.of(context).settings;

// user = settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("${user.name} ${user.age}"),
      ),
      body: Center(
       child: RaisedButton(
         child: Text("Take me back"),
         onPressed: () {
           Navigator.pop(context);
         },
       )
      ),
      
    );
  }
}


class User {



  String name;
  int age;
  User(this.age,this.name);
}