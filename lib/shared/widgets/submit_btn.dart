import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {Key key,
      @required this.label,
      @required this.onTap,
      this.isLoading = false})
      : super(key: key);
  final String label;
  final Function onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ButtonTheme(
              minWidth: 200,
              splashColor: Colors.transparent,
              child: FlatButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  onTap();
                },
                child: Text(
                  label ?? '--',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ))),
    );
  }
}
