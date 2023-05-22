import 'package:car_pool_app/Constants/widgets/text_field.dart';
import 'package:car_pool_app/available_drivers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Constants/styles/colors.dart';
import '../../Constants/styles/styles.dart';

// ignore: must_be_immutable
class SearchTrip extends StatelessWidget {
  TextEditingController searchTextEditingController = TextEditingController();

  SearchTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:<Widget> [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                child: Container(
                  height: 270,
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 10.0,
                      child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children:
                                <Widget>[
                                  Image.asset(
                                    "images/PickUpDestination.png",
                                    width: 20,
                                    height: 160,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
                                            child: TextFieldForm(
                                              text: 'Leaving From...',
                                              controller: searchTextEditingController,
                                              capitalization: TextCapitalization.none,
                                              textInputType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 8.0),
                                            child: TextFieldForm(
                                              text: 'Going To...',
                                              controller: searchTextEditingController,
                                              capitalization: TextCapitalization.none,
                                              textInputType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                            ),
                                          ),
                                          SizedBox(height: 10,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: const EdgeInsets.all(0),
                                    height: 70,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          elevation: MaterialStateProperty.all(4.0),
                                          backgroundColor:
                                          MaterialStateProperty.all(Colors.greenAccent),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => AvailableDrivers()));
                                        },
                                        child: const Text(
                                          "Search",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 18),
                                        ))),
                              ),
                            )
                          ]),
                    ),

                  ),

                ),
    ),



          ],
        ));
  }

  Widget searchBar() {
    return Container(
      alignment: const Alignment(1, 1),
      height: 280,
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:
                    <Widget>[
                      Image.asset(
                        "images/PickUpDestination.png",
                        width: 20,
                        height: 160,
                      ),
                    Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
                            child: TextFieldForm(
                              text: 'Leaving From...',
                              controller: searchTextEditingController,
                              capitalization: TextCapitalization.none,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 8.0),
                            child: TextFieldForm(
                              text: 'Going To...',
                              controller: searchTextEditingController,
                              capitalization: TextCapitalization.none,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),
                    ),
                  ],
                ),
              ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: const EdgeInsets.all(0),
                  height: 70,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4.0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent),
                      ),
                      onPressed: () {
                      },
                      child: const Text(
                        "Search",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))),
            ),
          )
        ]),
      ),
    );
  }
}
