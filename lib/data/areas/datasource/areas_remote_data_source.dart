import 'package:ecommerce_mobile/data/areas/datasource/end_points/areas_endpoints.dart';
import 'package:ecommerce_mobile/data/areas/model/area_model.dart';
import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';

class AreasRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  AreasRemoteDataSource({required this.service, required this.authManager});

  Future<List<AreaModel>> getAllAreas() async {
    final userToken = authManager.getToken();
    return service.call(AreasEndPoints.getAllEndPoint(userToken:userToken)).then((response) =>
        response.map<AreaModel>((e) => AreaModel.fromJson(e)).toList());
  }

}
