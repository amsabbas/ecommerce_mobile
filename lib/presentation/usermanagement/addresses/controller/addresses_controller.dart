import 'package:ecommerce_mobile/data/areas/interactor/area_interactor.dart';
import 'package:ecommerce_mobile/data/areas/model/area_model.dart';
import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/refresh_status.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddressesController extends GetxController {
  final addressesState = ResultState<List<AddressModel>>();
  final addAddressState = ResultState();
  final deleteAddressState = ResultState();
  final setDefaultAddressState = ResultState();
  final areasState = ResultState<List<AreaModel>>();
  final getLocationState = ResultState();
  AreaModel? selectedRegion;
  double? selectedLat;
  double? selectedLon;
  String? buildingNo;
  String? apartmentNo;
  String? floorNo;
  String? streetName;
  final Rx<RefreshStatus> getAddressesRefreshStatus =
      Rx<RefreshStatus>(RefreshStatus.none);

  late final UserInteractor userInteractor;
  late final AreaInteractor areaInteractor;

  AddressesController(
      {required this.userInteractor, required this.areaInteractor});

  void getAddresses() async {
    try {
      addressesState.setLoading();
      addressesState.setSuccess(await userInteractor.getUserAddresses());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      addressesState.setError(error);
    }
  }

  void addAddress() async {
    try {
      addAddressState.setLoading();
      if (selectedRegion != null &&
          streetName != null &&
          floorNo != null &&
          apartmentNo != null &&
          buildingNo != null &&
          selectedLat != null &&
          selectedLon != null) {
        addAddressState.setSuccess(await userInteractor.addAddress(
            selectedRegion!.id,
            streetName!,
            buildingNo!,
            floorNo!,
            apartmentNo!,
            selectedLat!,
            selectedLon!));
      }
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      addAddressState.setError(error);
    }
  }

  void deleteAddress(int id) async {
    try {
      deleteAddressState.setLoading();
      deleteAddressState.setSuccess(await userInteractor.deleteAddress(id));
    } catch (error) {
      deleteAddressState.setError(error);
    }
  }

  void setDefaultAddress(int id) async {
    try {
      setDefaultAddressState.setLoading();
      setDefaultAddressState
          .setSuccess(await userInteractor.changeDefaultAddress(id));
    } catch (error) {
      setDefaultAddressState.setError(error);
    }
  }

  void getAreas() async {
    try {
      areasState.setLoading();
      areasState.setSuccess(await areaInteractor.getAllAreas());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      areasState.setError(error);
    }
  }

  void refreshAddresses() {
    if (getAddressesRefreshStatus.value == RefreshStatus.refresh) {
      getAddressesRefreshStatus.refresh();
      return;
    }
    getAddressesRefreshStatus.value = RefreshStatus.refresh;
  }

  void getLocation() async {
    getLocationState.setLoading();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      getLocationState
          .setError(AppErrorModel(MessageKeys.locationDisabledTitle.tr));
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        getLocationState.resetState();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      getLocationState.resetState();
      return;
    }

    getLocationState.setSuccess(await Geolocator.getCurrentPosition());
  }

  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return MessageKeys.emptyTextFieldValidationMessage.tr;
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    addressesState.close();
    areasState.close();
  }
}
