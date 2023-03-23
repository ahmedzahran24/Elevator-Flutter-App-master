import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

//hello 2

class addUser extends StatefulWidget {
  @override
  _addUser createState() => _addUser();
}

class _addUser extends State<addUser> {
  var emailCont, passCont;
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

    void writeData() {
      final userRef = users.doc('user$counter');
      userRef.set({
        'email': emailCont.text,
        'password': passCont.text,
      });
    }

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Add Users"),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 6, 122, 103),
                        Color.fromARGB(255, 2, 109, 133),
                      ],
                    ),
                  ),
                  child: TextFormField(
                    controller: emailCont,
                    decoration: InputDecoration(
                        labelText: 'User Name',
                        prefixIcon: Icon(Icons.person),
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 6, 122, 103),
                        Color.fromARGB(255, 2, 109, 133),
                      ],
                    ),
                  ),
                  child: TextFormField(
                    controller: passCont,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8.0, 8.0, 8.0),
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 3, 144, 176),
                        Color.fromARGB(255, 2, 155, 130)
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: StadiumBorder(),
                    onPressed: () {
                      writeData();
                      _incrementCounter();
                      debugPrint(emailCont.text);
                      debugPrint(passCont.text);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Create Account  ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.add_circle_outline_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));

//Widgets and other code here
  }
}
