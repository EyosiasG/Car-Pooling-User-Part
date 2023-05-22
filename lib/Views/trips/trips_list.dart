import 'package:car_pool_app/Views/trips/trips_card.dart';
import 'package:car_pool_app/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TripList extends StatelessWidget {
  const TripList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TripCards(),
    );
  }
}
