import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  RewardsPage({Key key}) : super(key: key);

  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rewards'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.star),
              title: Text('100 Points added'),
            )
          ],
        ));
  }
}
