import 'package:car_pool_app/Constants/styles/colors.dart';
import 'package:car_pool_app/trip_history_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TripsHistory extends StatelessWidget {
  const TripsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 15,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              height: 120,
              width: double.maxFinite,
              child: Card(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Arat Kilo Round About',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                            SizedBox(height: 2,),
                            Text(
                                '15th May 2023',
                              style: TextStyle(
                                color: Colors.grey
                              )
                            ),
                            SizedBox(height: 1,),
                            Text(
                                'FINISHED',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(Icons.navigate_next),
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TripDetails()),
                                );
                              },

                            )
                        )
                    )
                  ],
                ),
              ),
            );
          }
              ),
            );
  }
}
