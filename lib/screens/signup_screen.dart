import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              validator: (text) {
                if (text.isEmpty || text.length < 3) {
                  return "Invalid name";
                } else {
                  return '';
                }
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(hintText: "Address"),
              validator: (text) {
                if (text.isEmpty || text.length < 3) {
                  return "Invalid address";
                } else {
                  return '';
                }
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(hintText: "E-mail"),
              validator: (text) {
                if (text.isEmpty || !text.contains("@")) {
                  return "Invalid e-mail";
                } else {
                  return '';
                }
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
              ),
              validator: (text) {
                if (text.isEmpty || text.length < 6) {
                  return "Invalid password";
                } else {
                  return '';
                }
              },
              obscureText: true,
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text(
                  "Signup",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
