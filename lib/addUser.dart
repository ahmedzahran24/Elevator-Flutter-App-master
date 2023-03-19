import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';



class addUser extends StatefulWidget {
  @override
  _addUser createState() => _addUser();

}

class _addUser extends State<addUser> {
  var emailCont,passCont;
   late FirebaseFirestore firestore;
   var setdata;
   int counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    firestore = FirebaseFirestore.instance;
    emailCont = TextEditingController();
    passCont = TextEditingController();
    firestore = FirebaseFirestore.instance;
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      prefs.setInt('counter', counter);
    });
  }


  @override
  Widget build(BuildContext context) {
    CollectionReference users = firestore.collection('users');



    void writeData(){
      final userRef = users.doc('user$counter');
      userRef.set({
        'email': emailCont.text,
        'password': passCont.text,
      });
    }

    return Scaffold(
       appBar: AppBar(),
       body: Padding  (padding: EdgeInsets.all(20.0),
       child: Column(
        children: [
          Text("Add Users"),
          SizedBox(
            height: 40.0,
          ),
          TextFormField(
            controller: emailCont,
            decoration: InputDecoration(
                labelText: 'User Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: passCont,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              height: 40,
              color: Colors.blue,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  writeData();
                  _incrementCounter();
                  debugPrint(emailCont.text);
                  debugPrint(passCont.text);
                },
                child: Text('add the user',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )),

          
        ],

       ),


        )
    );

//Widgets and other code here
}
}