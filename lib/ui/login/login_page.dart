import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Container(
          //     width: MediaQuery.of(context).size.width,
          //     child: Text(
          //       'Login',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          //     )),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Username',
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[700])),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Password',
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[700])),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ButtonTheme(
                    minWidth: 200,
                    splashColor: Colors.transparent,
                    child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        print('as');
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ))),
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/signup');
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Dont have an accout? Signup'),
              ))
        ],
      ),
    ));
  }
}
