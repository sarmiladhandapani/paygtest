import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test123/activity/details_order.dart';
import 'package:test123/activity/pay_order.dart';
import 'package:test123/activity/update_order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  // _HomePageState createState() => _HomePageState();
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:
        Image.asset('assets/images/payg_logo.png')
    );
  }
}

class HomeScreen extends StatelessWidget {
  bool _isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: _isLoading
                ? CircularProgressIndicator()
                : Container(
                    child: Scaffold(
                        backgroundColor: Colors.white,
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 250),
                                child:
                                    Image.asset('assets/images/payg_logo.png')),
                            Container(
                                // margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: ElevatedButton(
                                      // textColor: Colors.white,
                                      // color: Colors.blueAccent,
                                      child: Text('PAY ORDER'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PayOrder()),
                                        );
                                      },
                                    ))),
                            Container(
                                // margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: ElevatedButton(
                                      // textColor: Colors.white,
                                      // color: Colors.blueAccent,
                                      child: Text('ORDER UPDATE'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderUpdate()),
                                        );
                                      },
                                    ))),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: ElevatedButton(
                                      // textColor: Colors.white,
                                      // color: Colors.blueAccent,
                                      child: Text('ORDER DETAILS'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderDetails()),
                                        );
                                      },
                                    ))),
                          ],
                        )))));
  }
}
