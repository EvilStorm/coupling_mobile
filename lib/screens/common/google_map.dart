import 'dart:async';

import 'package:coupling/contollers/controller_map_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/model_map_address.dart';

class MapForGoogle extends StatefulWidget {
  final double? width;
  final double? height;
  const MapForGoogle({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<MapForGoogle> createState() => _MapForGoogleState();
}

class _MapForGoogleState extends State<MapForGoogle> {
  final Completer<GoogleMapController> _mapController = Completer();
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.5716390802915, 126.9631381802915),
    zoom: 12,
  );
  final TextEditingController _mapSearchController = TextEditingController();
  final MapSearchController _addressController = Get.find();
  List<Marker> _markers = [];

  MapAddressModel? _selecedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          '위치선택',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_selecedAddress == null) {
                Get.back();
                return;
              }
              _addressController.selectedAddress.value = _selecedAddress!;
              _addressController.searchWord = _mapSearchController.text;
              _mapSearchController.text = "";
              Get.back();
            },
            child: Text(
              '선택',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Container(
          width: widget.width ?? MediaQuery.of(context).size.width,
          height: widget.width ?? MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                myLocationButtonEnabled: false,
                markers: Set.from(_markers),
                zoomControlsEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: TextField(
                        controller: _mapSearchController,
                        autocorrect: false,
                        onChanged: (text) async {
                          _addressController.searchAddress(text);
                        },
                        decoration: InputDecoration(
                          hintText: "정확한 상호명을 입력해주세요.",
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _addressController.searchAddressList.isNotEmpty,
                      child: Expanded(
                        child: ListView.separated(
                          itemCount:
                              _addressController.searchAddressList.length,
                          separatorBuilder: (context, index) => Container(
                            color: Colors.white,
                            child: const Divider(),
                          ),
                          itemBuilder: (context, index) {
                            final MapAddressModel item =
                                _addressController.searchAddressList[index];
                            return GestureDetector(
                              onTap: () async {
                                final GoogleMapController controller =
                                    await _mapController.future;
                                CameraPosition newPos = CameraPosition(
                                    target: LatLng(
                                        item.geometry!.location!.lat!,
                                        item.geometry!.location!.lng!),
                                    zoom: 18);
                                _markers.clear();

                                _markers.add(Marker(
                                    markerId: const MarkerId("1"),
                                    draggable: true,
                                    position: LatLng(
                                        item.geometry!.location!.lat!,
                                        item.geometry!.location!.lng!)));

                                controller.animateCamera(
                                    CameraUpdate.newCameraPosition(newPos));

                                _selecedAddress = item;

                                _addressController.searchAddressList.clear();
                              },
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 8.0),
                                  child: Text(
                                    item.formattedAddress ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
