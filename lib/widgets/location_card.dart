import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String location;
  const LocationCard({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.location_on),
        title: Text("Location"),
        subtitle: Text(location),
      ),
    );
  }
}
