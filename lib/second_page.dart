import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  var printname = "";
  var printaddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
                child: Text(printname.toString(), style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold))),
          Padding(
            padding: const EdgeInsets.all(30.0),
                child: Text(printaddress.toString(), style: TextStyle(
    fontSize: 25, fontWeight: FontWeight.bold)),

    )])
    );
  }

  void getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var getname = prefs.getString("Name");
    var getaddress = prefs.getString("Address");
    setState(() {
      printname = getname!;
      printaddress = getaddress!;
    });
  }
}
