import 'package:flutter/material.dart';
import 'package:hackstudio_flutter/shared/widgets/login_input_field.dart';
import 'package:hackstudio_flutter/shared/widgets/submit_btn.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _nameInputCtrl = TextEditingController();
  TextEditingController _emailInputCtrl = TextEditingController();
  TextEditingController _pwdInputCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              'SIGNUP',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          LoginInputField(
            controller: _nameInputCtrl,
            labelText: 'Name',
          ),
          SizedBox(
            height: 20,
          ),
          LoginInputField(
            controller: _emailInputCtrl,
            labelText: 'E-Mail',
          ),
          SizedBox(
            height: 20,
          ),
          LoginInputField(
            controller: _pwdInputCtrl,
            isPassword: true,
            labelText: 'Password',
          ),
          SizedBox(
            height: 25,
          ),
          SubmitButton(
            label: 'Submit',
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (_) => false);
            },
          )
        ],
      ),
    ));
  }
}
