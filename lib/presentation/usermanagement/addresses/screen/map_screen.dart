import 'dart:async';

import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/controller/addresses_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/screen/address_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final AddressesController _addressesController;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late final CameraPosition _kGooglePosition;
  late final Map<MarkerId, Marker> markers;

  @override
  void initState() {
    super.initState();
    _addressesController = Get.find<AddressesController>();
    _kGooglePosition = CameraPosition(
      target: LatLng(Get.arguments[0], Get.arguments[1]),
      zoom: 17,
    );
    markers = <MarkerId, Marker>{};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWidget(
        title: MessageKeys.deliveryLocationTitle.tr,
        showBackIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: _kGooglePosition,
              markers: markers.values.toSet(),
              onLongPress: (position) {
                _addMarker(position);
              },
              onTap: (position) {
                _addMarker(position);
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _addLocationButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget _addLocationButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 60),
      child: ElevatedButton(
        onPressed: markers.isEmpty
            ? null
            : () {
                Get.to(() => const AddressInfoScreen());
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                MessageKeys.addAddressButtonTitle.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addMarker(position) {
    var marker = Marker(
      markerId: const MarkerId('MAP'),
      position: position,
    );
    setState(() {
      markers.clear();
      markers[const MarkerId('MAP')] = marker;
    });
    _addressesController.selectedLat = position.latitude;
    _addressesController.selectedLon = position.longitude;
  }
}
