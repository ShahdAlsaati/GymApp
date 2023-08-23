import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(

          center: LatLng(34.7242027877102, 36.700640281446496),
          zoom: 18.2,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),

        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(34.724050243548696, 36.70062969393126),
                width: 80,
                height: 80,
                rotate:true,
                builder: (context) => Column(
                  children: [
                    Icon(
                        Icons.location_on,
                      color: Colors.red,

                    ),
                    Text(
                      'New Gym'
                    ),
                  ],
                ),
              ),
            ],
          ),        ],
      ),
    );
  }
}
