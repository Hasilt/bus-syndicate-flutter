import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackstudio_flutter/locator.dart';
import 'package:hackstudio_flutter/shared/utils/debounce.dart';
import 'package:hackstudio_flutter/stores/home_store.dart';
import 'package:hackstudio_flutter/ui/rewards/rewards_page.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _mapCtrl = Completer();
  TextEditingController _startingCtrl = TextEditingController();
  TextEditingController _destinationCtrl = TextEditingController();
  bool _isLoadingMaps = true;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  LatLng _userLocation;
  final _debouncer = Debouncer(milliseconds: 500);
  HomeStore _homeStore;
  List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeStore ??= locator.get<HomeStore>();
    _disposers ??= [
      reaction((_) => _homeStore.starting, (_) {
        if (mounted) {
          setState(() {
            _startingCtrl.value = TextEditingValue(text: _.displayName);
          });
        }
      }),
      reaction((_) => _homeStore.ending, (_) {
        if (mounted) {
          setState(() {
            _destinationCtrl.value = TextEditingValue(text: _.displayName);
          });
        }
      }),
      reaction((_) => _homeStore.searchQueryCompleted, (_) {
        Navigator.pushNamed(context, '/search-results');
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
      key: _scaffoldKey,
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => RewardsPage()));
              },
              title: Text('Rewards'),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          _buildMapsWidget(),
          _buildSearchWidget(),
        ],
      ),
    );
  }

  Widget _buildSearchWidget() {
    if (!_isLoadingMaps) {
      return Positioned(
        top: 0,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Opacity(
                    opacity: 0.7,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Colors.grey.shade100,
                      child: Form(
                          child: Column(
                        children: <Widget>[
                          Container(
                              child: TextFormField(
                            onChanged: (String val) {
                              if (val.length > 2) {
                                _debouncer.run(() {
                                  locator
                                      .get<HomeStore>()
                                      .getSearchResults(val, 'starting');
                                });
                              } else {
                                locator
                                    .get<HomeStore>()
                                    .getSearchResults(val, 'starting');
                              }
                            },
                            controller: _startingCtrl,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.black),
                                labelText: 'Starting Point'),
                          )),
                          Container(
                              child: TextFormField(
                            onChanged: (String val) {
                              if (val.length > 2) {
                                _debouncer.run(() {
                                  locator
                                      .get<HomeStore>()
                                      .getSearchResults(val, 'ending');
                                });
                              } else {
                                locator
                                    .get<HomeStore>()
                                    .getSearchResults(val, 'ending');
                              }
                            },
                            controller: _destinationCtrl,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.black),
                                labelText: 'Destination'),
                          )),
                          Row(
                            children: <Widget>[
                              Observer(
                                builder: (_) {
                                  return Expanded(
                                      child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: FlatButton(
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        if (_homeStore.ending != null &&
                                            _homeStore.starting != null) {
                                          _homeStore.searchRoutes();
                                        } else {
                                          SnackBar _snackBar = SnackBar(
                                            content: Text(
                                                'Please input starting point and destination'),
                                          );
                                          _scaffoldKey.currentState
                                              .showSnackBar(_snackBar);
                                        }
                                      },
                                      child: Text('Search Transports'),
                                    ),
                                  ));
                                },
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.timer)))
                            ],
                          ),
                        ],
                      )),
                    )),
                Observer(builder: (_) {
                  if (locator.get<HomeStore>().state ==
                      StoreState.emptyResults) {
                    return Container();
                  }
                  if (locator.get<HomeStore>().state ==
                      StoreState.resultsFound) {
                    return Container(
                        color: Colors.grey.shade200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 10, top: 15),
                              child: Text(
                                'Search Results',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: locator
                                    .get<HomeStore>()
                                    .placesSearchResults
                                    .length,
                                itemBuilder: (_, int index) {
                                  return Container(
                                      margin: EdgeInsets.all(10),
                                      // padding: EdgeInsets.only(left: 5),
                                      child: InkWell(
                                          onTap: () {
                                            locator
                                                .get<HomeStore>()
                                                .selectLocation(locator
                                                        .get<HomeStore>()
                                                        .placesSearchResults[
                                                    index]);
                                          },
                                          child: Container(
                                            child: Text(
                                              '${locator.get<HomeStore>().placesSearchResults[index].displayName}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )));
                                })
                          ],
                        ));
                  }
                  return Container();
                })
              ],
            )),
      );
    }
    return Container();
  }

  Widget _buildMapsWidget() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: _onMapCreated,
        ));
  }

  void _onMapCreated(GoogleMapController controller) async {
    try {
      if (_mapCtrl != null) {
        _mapCtrl.complete(controller);
      }
    } catch (e) {
      print(e);
    }

    LocationData _location = await _getCurrentLocation();
    if (_location != null) {
      _userLocation = LatLng(_location.latitude, _location.longitude);
      _moveCameraToLocation(CameraPosition(target: _userLocation, zoom: 14.54));
    }
    if (mounted) {
      setState(() {
        _isLoadingMaps = false;
      });
    }
  }

  Future<LocationData> _getCurrentLocation() async {
    bool _serviceStatus = await locator.get<Location>().requestService();
    if (_serviceStatus) {
      bool _permissionStatus =
          await locator.get<Location>().requestPermission();
      if (_permissionStatus) {
        LocationData _myLocation = await locator.get<Location>().getLocation();
        return _myLocation;
      }
    }
    return null;
  }

  void _moveCameraToLocation(CameraPosition cPosition) async {
    final GoogleMapController controller = await _mapCtrl.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
  }
}
