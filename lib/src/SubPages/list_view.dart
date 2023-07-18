import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashBoard_model.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_controller.dart';

import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/commonText.dart';
import 'package:gleekey_user/widgets/property_widget.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'SearchPlaces/searchBar.dart';

final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();

// const CameraPosition _kGooglePlex = CameraPosition(
//   target: LatLng(37.42796133580664, -122.085749655962),
//   zoom: 14.4746,
// );

class PropertyList extends StatelessWidget {
  List<Properties> properties;
  String lat;
  String long;
  PropertyList(
      {super.key,
      required this.properties,
      required this.lat,
      required this.long});

  @override
  Widget build(BuildContext context) {
    BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
    return Scaffold(
      backgroundColor: kWhite,
      body: Stack(
        children: [
          topMenu(properties: properties),
          bottomMenu(context, properties),
        ],
      ),
    );
  }
}

class topMenu extends StatefulWidget {
  List<Properties> properties;
  topMenu({
    super.key,
    required this.properties,
  });

  @override
  State<topMenu> createState() => _topMenuState();
}

class _topMenuState extends State<topMenu> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(12, 12)),
            "assets/images/location.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> hotelMarkers = {};
    widget.properties.asMap().forEach((index, element) {
      hotelMarkers.add(
        Marker(
            markerId: MarkerId(index.toString()),
            position: LatLng(double.parse(element.propertyAddress?.latitude),
                double.parse(element.propertyAddress?.longitude)),
            draggable: true,
            infoWindow: InfoWindow(title: "${element.propertyName}"),
            icon: markerIcon),
      );
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 12),
          child: SearchBarWidget(),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height - 90) * 0.5,
          child: GoogleMap(
            mapType: MapType.normal,
            markers: hotelMarkers,

            //  {
            //   Marker(
            //     markerId: const MarkerId("marker2"),
            //     position: LatLng(double.parse(lat), double.parse(long)),
            //   ),
            // },
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  double.parse(widget.properties[0].propertyAddress?.latitude),
                  double.parse(
                      widget.properties[0].propertyAddress?.longitude)),
              zoom: 13.4746,
            ),
            //
          ),
        ),
      ],
    );
  }
}

Widget bottomMenu(BuildContext context, List<Properties>? properties) {
  return DraggableScrollableSheet(
      initialChildSize: 0.52,
      minChildSize: 0.52,
      builder: ((context, scrollController) {
        return SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: kWhite,
                  boxShadow: [
                    BoxShadow(
                        color: kDarkGrey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0.0, 5.0))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 28, right: 28, top: 12, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      height: 4,
                      width: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    (properties != null && properties.isNotEmpty)
                        ? GetBuilder<SearchPlacesController>(
                            initState: (_) {},
                            builder: (_) {
                              return Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: ListView.builder(
                                          controller: scrollController,
                                          itemCount: properties != null
                                              ? properties.length
                                              : 0,
                                          itemBuilder: ((context, index) {
                                            return properties != null
                                                ? Property(
                                                    properties:
                                                        properties[index])
                                                : null;
                                          })),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              commonText(
                                text: "Comming Soon!!",
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              Image.asset(
                                "assets/images/coming-soon-bg.png",
                                height: 220,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              commonText(
                                text:
                                    "We're coming soon! We're working hard to give you the best experience.",
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          )),
                  ],
                ),
              ),
            ),
          ),
        );
      }));
}
