import 'package:flutter/material.dart';
class AvailableDrivers extends StatefulWidget {
  const AvailableDrivers({Key? key}) : super(key: key);

  @override
  State<AvailableDrivers> createState() => _AvailableDriversState();
}

class _AvailableDriversState extends State<AvailableDrivers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      body:ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return InkWell(
                child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'B6123',
                              style: TextStyle(
                                fontSize: 16,
                              ) ,),
                            Text(
                              'Blue Toyota Vitz',
                              style: TextStyle(
                                color: Colors.grey,
                              ) ,),
                          ],

                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/indoor-shot-glad-young-bearded-man-mustache-wears-denim-shirt-smiles-happily_273609-8698.jpg?w=1060&t=st=1684762104~exp=1684762704~hmac=f48dc7b69b41deac29bbf849e5020a36b4e19b7f2c32048e2950f9f6028927bf',
                              ),
                              radius: 25,

                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                      'Abebe Kebede',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                    )
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),
                                            child: Icon(Icons.star, color: Colors.yellow),
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(8.0,0,3.0,0),
                                            child: Text('325'),
                                          ),
                                          Text('ratings'),
                                        ],
                                      )
                                    ],
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Thursday 10th March'),
                        Text('3:00 PM'),
                        SizedBox(height: 40,),
                        ElevatedButton(
                            onPressed: (){},
                            child: Text(
                              'Book Seat',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                      primary: Colors.greenAccent,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),)
                                ),
                              ],
                            ),
                        Divider(),
                      ],
                    ),

            ),
            onTap: (){

            }
            );
          }
      )
    );
  }
}
