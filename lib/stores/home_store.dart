import 'package:hackstudio_flutter/locator.dart';
import 'package:hackstudio_flutter/shared/models/location_result.dart';
import 'package:hackstudio_flutter/shared/providers/home_provider.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;
enum StoreState {
  initial,
  loading,
  loaded,
  searchingLocation,
  resultsFound,
  emptyResults
}

abstract class _HomeStore with Store {
  @observable
  List<LocationResult> placesSearchResults = [];

  @observable
  String errorMessage;

  @observable
  LocationResult starting;

  @observable
  LocationResult ending;

  @observable
  String currentSearchType;

  @computed
  StoreState get state {
    if (placesSearchResults.isEmpty) {
      return StoreState.emptyResults;
    }
    if (placesSearchResults.isNotEmpty) {
      return StoreState.resultsFound;
    }
    return StoreState.initial;
  }

  @observable
  List<dynamic> busRoutes = [];

  @observable
  bool searchQueryCompleted = false;

  @observable
  bool sendRouteRquestStatus = false;

  @observable
  List<dynamic> userRequests = [];

  @action
  searchRoutes() async {
    searchQueryCompleted = false;
    dynamic resp = await locator.get<HomeProvider>().getAllRoutes();
    print(resp);
    busRoutes = resp;
    searchQueryCompleted = true;
  }

  @action
  getRouteRequest() async {
    userRequests = [];
    dynamic resp = await locator.get<HomeProvider>().getAllRequest(null);
    if (resp is List) {
      userRequests = resp;
    } else {
      userRequests = [];
    }
  }

  // @action updateScore(String id)

  @action
  sendRouteRequest() async {
    sendRouteRquestStatus = false;
    final data = {
      "time": DateTime.now().toIso8601String(),
      "start_location": {
        "type": "Point",
        "coordinates": [starting.lon, starting.lat]
      },
      "end_location": {
        "type": "Point",
        "coordinates": [ending.lon, ending.lat]
      }
    };
    await locator.get<HomeProvider>().sendRouteRequest(data);
    sendRouteRquestStatus = true;
  }

  @action
  selectLocation(
    LocationResult _location,
  ) {
    if (currentSearchType == 'starting') {
      starting = _location;
    } else {
      ending = _location;
    }
    placesSearchResults = [];
  }

  @action
  Future getSearchResults(String value, String type) async {
    try {
      currentSearchType = type;
      if (value.length > 2) {
        placesSearchResults = [];
        List<dynamic> _results =
            await locator.get<HomeProvider>().getAutoCompleteResults(value);
        placesSearchResults = _results is List
            ? new List<LocationResult>.from(
                _results.map((e) => LocationResult.fromJson(e)))
            : [];
      } else {
        placesSearchResults = [];
      }
    } catch (e) {
      placesSearchResults = [];
      errorMessage = 'Something went wrong';
    }
  }
}
