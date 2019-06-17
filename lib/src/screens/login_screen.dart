import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with
    ValidatorMixin {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  Widget build(context) {
    return new Container(
      margin: new EdgeInsets.all(20.0),
      child: new Form(
        key: formKey,
        //this form knows that it has textFormField is below the tree
        child: new Column(
          children: <Widget>[
            emailField(),
            SizedBox(
              height: 15.0,
            ),
            passwordField(),
            SizedBox(
              height: 25.0,
            ),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      onSaved: (String value) {
        print(value);
        email = value;
      },
      validator: emailValidator,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password', hintText: 'password'),
      onSaved: (String value) {
        print(value);
        password = value;
      },
      validator: passwordValidator,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      highlightColor: Colors.blue,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
      },
      child: Text("Submit"),
    );
  }
}