import 'package:flutter/material.dart';

class TripDetails extends StatefulWidget {
  const TripDetails({Key? key}) : super(key: key);

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:[
              SizedBox(height: 25,),
              Row(
                children: [
                  Image.asset(
                    "images/PickUpDestination.png",
                    width: 40,
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nifas Silk Lafto',
                          style: TextStyle(
                              fontSize: 18,
                          ),
                        ),
                        Divider(),
                        Text(
                          '4 Kilo Round About',
                          style: TextStyle(
                              fontSize: 18,
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/background.jpg"),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abebe Kebede",
                          style: TextStyle(
                            fontSize: 18,
                          )
                        ),
                        Text(
                          "15th May 2023 at 2:03 PM",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        )

                      ],
                    ),
                  )
                ],
              )
          ]
          )
        ),
      )
    );
  }
}
