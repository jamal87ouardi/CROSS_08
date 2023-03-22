import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _result = 1;

  var _nuits = TextEditingController();

  double calculerIMC() {

      if(_nuits.text=="") {
        Fluttertoast.showToast(
          msg:  "Entrer le nombre de nuits",
          toastLength: Toast.LENGTH_LONG,

        );
        return 0;

      }
      else {
        int n=int.parse(_nuits.text);

        if(_result==1) {

          return n*200;
        }
        else {

          if(_result==2) return n*300;

          else return n*400;

        }

      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Hotel'),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
          const Padding(
            padding:  EdgeInsets.fromLTRB(0, 0, 100, 10),
            child: Text(
              'Nombre de nuits:',
            ),
          ),
          Padding(
            padding:  const EdgeInsets.fromLTRB(50, 0, 50, 80),
            child:TextField(
              controller: _nuits,
              decoration: InputDecoration (
                filled: true,
                hintText: "Nuits",
                fillColor: Colors.orange[400],
              ),
            ),
          ),

          const Padding(
            padding:  EdgeInsets.fromLTRB(0, 0, 100, 10),
            child: Text(
              'Type de chambre:',
            ),
          ),

          Padding(
            padding:  EdgeInsets.fromLTRB(100, 0, 0, 0),
            child: RadioListTile(
              title: Text("Simple"),
              value: 1,
              groupValue: _result,
              onChanged: (value){
                setState(() {
                  _result = value!;
                });
              },
            ),
          ),

          Padding(
            padding:  EdgeInsets.fromLTRB(100, 0, 0, 0),
            child: RadioListTile(
              title: Text("Double"),
              value: 2,
              groupValue: _result,
              onChanged: (value){
                setState(() {
                  _result = value!;
                });
              },
            ),
          ),

          Padding(
            padding:  EdgeInsets.fromLTRB(100, 0, 0, 40),
            child: RadioListTile(
              title: Text("Multiple"),
              value: 3,
              groupValue: _result,
              onChanged: (value){
                setState(() {
                  _result = value!;
                });
              },
            ),
          ),


          ElevatedButton(
            onPressed: () {

              Fluttertoast.showToast(
                  msg:  "Le prix est: ${calculerIMC()} dh",
                  toastLength: Toast.LENGTH_SHORT,

              );


            },
            child: const Text('Calculer'),
          ),




        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
