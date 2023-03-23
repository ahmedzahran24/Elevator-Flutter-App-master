import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  String errorMessage = '';

  void getUsers() async {
    final CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
    final QuerySnapshot querySnapshot = await usersRef.get();

    for (final QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      final data = documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey('email') && data.containsKey('password') && data['email'] == emailCont.text && data['password'] == passCont.text) {
        setState(() {
          errorMessage = '';
        });
        debugPrint("valid user");
        return;
      }
    }

    setState(() {
      errorMessage = 'Invalid email or password';
    });
    debugPrint("error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Log in as a normal user"),
            SizedBox(height: 40.0),
            TextFormField(
              controller: emailCont,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passCont,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 40,
              color: Colors.blue,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  getUsers();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
