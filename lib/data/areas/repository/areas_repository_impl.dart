import 'package:ecommerce_mobile/data/areas/datasource/areas_remote_data_source.dart';
import 'package:ecommerce_mobile/data/areas/model/area_model.dart';

class AreasRepository {
  final AreasRemoteDataSource remoteDataSource;

  AreasRepository({required this.remoteDataSource});

  Future<List<AreaModel>> getAllAreas() async {
    return await remoteDataSource.getAllAreas();
  }
}
