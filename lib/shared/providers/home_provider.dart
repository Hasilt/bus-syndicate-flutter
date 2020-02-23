import 'package:dio/dio.dart';
import 'package:hackstudio_flutter/locator.dart';

class HomeProvider {
  getAutoCompleteResults(String query) async {
    String _searchPath =
        'https://nominatim.openstreetmap.org/search/$query?format=json&limit=10';

    Response response = await locator.get<Dio>().get(_searchPath);
    // print(response.data);
    return response.data;
  }

  getAllRoutes() async {
    String _path = 'http://192.168.43.209:3002/buses/getall-busestrip';
    Response response = await locator.get<Dio>().get(_path);
    return response.data;
  }

  sendRouteRequest(data) async {
    String _path = 'http://192.168.43.209:3002/user-request';
    Response response = await locator.get<Dio>().post(_path, data: data);
    return response.data;
  }

  getAllRequest(data) async {
    String _path = 'http://192.168.43.209:3002/user-request';
    Response response = await locator.get<Dio>().get(_path);
    return response.data;
  }
}
