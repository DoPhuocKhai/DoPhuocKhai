import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'o7planning.org',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  double _value = 0;
  bool _working = false;

  void startWorking()  async {
    this.setState(() {
      this._working = true;
      this._value = 0;
    });
    for(int i = 0; i< 10; i++) {
      if(!this._working)  {
         break;
      }
      await Future.delayed(Duration(seconds: 1));
      this.setState(() {
        this._value += 0.1;
      });
    }
    this.setState(() {
      this._working = false;
    });
  }

  void stopWorking() {
    this.setState(() {
      this._working = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CircularProgressIndicator Example'),
      ),
      body: Center(
          child:  Container (
                    alignment: Alignment.center,
                    foregroundDecoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage('https://s3.o7planning.com/images/smile-64.png'),
                        fit: BoxFit.none,
                      ),
                      border: Border.all( color: Colors.black, width: 8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.all(30),
                    child: ElevatedButton(
                      child: Text("I am a Long Button"),
                      onPressed: () {}
                    )
                  )
      ),
    );
  }
}