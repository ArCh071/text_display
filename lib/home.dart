import 'package:display_text/second_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: key,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "name is empty";
                  }
                },
                keyboardType: TextInputType.text,
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "address is empty";
                  }
                },
                controller: address,
                decoration: InputDecoration(
                  labelText: 'Address',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            InkWell(
              onTap: () async{
               // var Name = name.text.toString();
               var prefs = await SharedPreferences.getInstance();
               prefs.setString("Name", name.text.toString());
               prefs.setString("Address", address.text.toString());
               if(key.currentState!.validate()){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Second(),));
               }
              },
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text("Submit")),
              ),
            )
          ],
        ),
      ),
    );
  }

}
