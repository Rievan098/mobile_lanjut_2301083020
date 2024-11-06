import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("List Kelompok"),
          ),
          body: ListView(

            children: [
              ListTile(
                title: Text("BUDIONO SIREGAR"),
                subtitle: Text("This is subtitle..."),
                leading: CircleAvatar(),
                trailing: Text("10:00 WIB"),
              ),
              ListTile(
                title: Text("ENGGAR SUBADRIAH"),
                subtitle: Text("This is subtitle..."),
                leading: CircleAvatar(),
                trailing: Text("11:00 WIB"),
              ),
              ListTile(
                title: Text("ALEX BEJIR"),
                subtitle: Text("This is subtitle..."),
                leading: CircleAvatar(),
                trailing: Text("12:00 WIB"),
              ),
              ListTile(
                title: Text("AMBALABU"),
                subtitle: Text("This is subtitle..."),
                leading: CircleAvatar(),
                trailing: Text("13:00 WIB"),
              )
            ],
          ),
        ),
    );
  }
}
