import 'package:ecommerce_mobile/data/areas/model/area_model.dart';
import 'package:ecommerce_mobile/data/areas/repository/areas_repository_impl.dart';

class AreaInteractor {
  final AreasRepository repository;

  AreaInteractor({required this.repository});

  Future<List<AreaModel>> getAllAreas() async =>
      await repository.getAllAreas();

}
