// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$placesSearchResultsAtom =
      Atom(name: '_HomeStore.placesSearchResults');

  @override
  List<LocationResult> get placesSearchResults {
    _$placesSearchResultsAtom.context
        .enforceReadPolicy(_$placesSearchResultsAtom);
    _$placesSearchResultsAtom.reportObserved();
    return super.placesSearchResults;
  }

  @override
  set placesSearchResults(List<LocationResult> value) {
    _$placesSearchResultsAtom.context.conditionallyRunInAction(() {
      super.placesSearchResults = value;
      _$placesSearchResultsAtom.reportChanged();
    }, _$placesSearchResultsAtom,
        name: '${_$placesSearchResultsAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_HomeStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$startingAtom = Atom(name: '_HomeStore.starting');

  @override
  LocationResult get starting {
    _$startingAtom.context.enforceReadPolicy(_$startingAtom);
    _$startingAtom.reportObserved();
    return super.starting;
  }

  @override
  set starting(LocationResult value) {
    _$startingAtom.context.conditionallyRunInAction(() {
      super.starting = value;
      _$startingAtom.reportChanged();
    }, _$startingAtom, name: '${_$startingAtom.name}_set');
  }

  final _$endingAtom = Atom(name: '_HomeStore.ending');

  @override
  LocationResult get ending {
    _$endingAtom.context.enforceReadPolicy(_$endingAtom);
    _$endingAtom.reportObserved();
    return super.ending;
  }

  @override
  set ending(LocationResult value) {
    _$endingAtom.context.conditionallyRunInAction(() {
      super.ending = value;
      _$endingAtom.reportChanged();
    }, _$endingAtom, name: '${_$endingAtom.name}_set');
  }

  final _$currentSearchTypeAtom = Atom(name: '_HomeStore.currentSearchType');

  @override
  String get currentSearchType {
    _$currentSearchTypeAtom.context.enforceReadPolicy(_$currentSearchTypeAtom);
    _$currentSearchTypeAtom.reportObserved();
    return super.currentSearchType;
  }

  @override
  set currentSearchType(String value) {
    _$currentSearchTypeAtom.context.conditionallyRunInAction(() {
      super.currentSearchType = value;
      _$currentSearchTypeAtom.reportChanged();
    }, _$currentSearchTypeAtom, name: '${_$currentSearchTypeAtom.name}_set');
  }

  final _$busRoutesAtom = Atom(name: '_HomeStore.busRoutes');

  @override
  List<dynamic> get busRoutes {
    _$busRoutesAtom.context.enforceReadPolicy(_$busRoutesAtom);
    _$busRoutesAtom.reportObserved();
    return super.busRoutes;
  }

  @override
  set busRoutes(List<dynamic> value) {
    _$busRoutesAtom.context.conditionallyRunInAction(() {
      super.busRoutes = value;
      _$busRoutesAtom.reportChanged();
    }, _$busRoutesAtom, name: '${_$busRoutesAtom.name}_set');
  }

  final _$searchQueryCompletedAtom =
      Atom(name: '_HomeStore.searchQueryCompleted');

  @override
  bool get searchQueryCompleted {
    _$searchQueryCompletedAtom.context
        .enforceReadPolicy(_$searchQueryCompletedAtom);
    _$searchQueryCompletedAtom.reportObserved();
    return super.searchQueryCompleted;
  }

  @override
  set searchQueryCompleted(bool value) {
    _$searchQueryCompletedAtom.context.conditionallyRunInAction(() {
      super.searchQueryCompleted = value;
      _$searchQueryCompletedAtom.reportChanged();
    }, _$searchQueryCompletedAtom,
        name: '${_$searchQueryCompletedAtom.name}_set');
  }

  final _$sendRouteRquestStatusAtom =
      Atom(name: '_HomeStore.sendRouteRquestStatus');

  @override
  bool get sendRouteRquestStatus {
    _$sendRouteRquestStatusAtom.context
        .enforceReadPolicy(_$sendRouteRquestStatusAtom);
    _$sendRouteRquestStatusAtom.reportObserved();
    return super.sendRouteRquestStatus;
  }

  @override
  set sendRouteRquestStatus(bool value) {
    _$sendRouteRquestStatusAtom.context.conditionallyRunInAction(() {
      super.sendRouteRquestStatus = value;
      _$sendRouteRquestStatusAtom.reportChanged();
    }, _$sendRouteRquestStatusAtom,
        name: '${_$sendRouteRquestStatusAtom.name}_set');
  }

  final _$userRequestsAtom = Atom(name: '_HomeStore.userRequests');

  @override
  List<dynamic> get userRequests {
    _$userRequestsAtom.context.enforceReadPolicy(_$userRequestsAtom);
    _$userRequestsAtom.reportObserved();
    return super.userRequests;
  }

  @override
  set userRequests(List<dynamic> value) {
    _$userRequestsAtom.context.conditionallyRunInAction(() {
      super.userRequests = value;
      _$userRequestsAtom.reportChanged();
    }, _$userRequestsAtom, name: '${_$userRequestsAtom.name}_set');
  }

  final _$searchRoutesAsyncAction = AsyncAction('searchRoutes');

  @override
  Future searchRoutes() {
    return _$searchRoutesAsyncAction.run(() => super.searchRoutes());
  }

  final _$getRouteRequestAsyncAction = AsyncAction('getRouteRequest');

  @override
  Future getRouteRequest() {
    return _$getRouteRequestAsyncAction.run(() => super.getRouteRequest());
  }

  final _$sendRouteRequestAsyncAction = AsyncAction('sendRouteRequest');

  @override
  Future sendRouteRequest() {
    return _$sendRouteRequestAsyncAction.run(() => super.sendRouteRequest());
  }

  final _$getSearchResultsAsyncAction = AsyncAction('getSearchResults');

  @override
  Future<dynamic> getSearchResults(String value, String type) {
    return _$getSearchResultsAsyncAction
        .run(() => super.getSearchResults(value, type));
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  dynamic selectLocation(LocationResult _location) {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.selectLocation(_location);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'placesSearchResults: ${placesSearchResults.toString()},errorMessage: ${errorMessage.toString()},starting: ${starting.toString()},ending: ${ending.toString()},currentSearchType: ${currentSearchType.toString()},busRoutes: ${busRoutes.toString()},searchQueryCompleted: ${searchQueryCompleted.toString()},sendRouteRquestStatus: ${sendRouteRquestStatus.toString()},userRequests: ${userRequests.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
