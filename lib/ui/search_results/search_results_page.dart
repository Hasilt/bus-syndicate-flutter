import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackstudio_flutter/stores/home_store.dart';
import 'package:mobx/mobx.dart';

import '../../locator.dart';

class SearchResultsPage extends StatefulWidget {
  SearchResultsPage({Key key}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  HomeStore _homeStore;
  List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeStore ??= locator.get<HomeStore>();
    _homeStore.getRouteRequest();
    _disposers ??= [
      reaction((_) => _homeStore.sendRouteRquestStatus, (_) {
        SnackBar _snackBar = SnackBar(
          content: Text('Request send successfully'),
        );
        _sKey.currentState.showSnackBar(_snackBar);
      })
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            color: Colors.grey.shade300,
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              'Transport Routes',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          _homeStore.busRoutes.isEmpty
              ? ListBody(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text('No routes found'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: OutlineButton(
                          onPressed: () {
                            _homeStore.sendRouteRequest();
                          },
                          child: Text('Add Route Request'),
                        ))
                  ],
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _homeStore.busRoutes.length,
                  itemBuilder: (_, int index) {
                    dynamic _route = _homeStore.busRoutes[index];
                    return Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                          '${_route['starting_location']['coordinates']} to ${_route['ending_location']['coordinates']}'),
                    );
                  }),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            color: Colors.grey.shade300,
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              'User Request',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _homeStore.userRequests.length,
                  itemBuilder: (_, int i) {
                    dynamic _route = _homeStore.userRequests[i];
                    return Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                                '${_route['start_location']['coordinates']} to ${_route['end_location']['coordinates']},  score:${_route['score']}'),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              
                            },
                          )
                        ],
                      ),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
