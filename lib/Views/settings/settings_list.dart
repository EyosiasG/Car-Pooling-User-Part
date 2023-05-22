import 'package:car_pool_app/Constants/styles/colors.dart';
import 'package:car_pool_app/Constants/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            children: const [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/background.jpg"),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Abiy Zebene Mikru",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 18,
                ),
              ),
              Text(
                "az@gmail.com",
                style: TextStyle(
                    color: ColorsConst.greenAccent400),
              ),
            ],
          ),
        ),
        const Divider(
          endIndent: 18,
          indent: 18,
        ),
        settingsTile(),
      ],
    );
  }

  Widget settingsTile() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
        child: ListTile(
          onTap: () {},
          leading: Icon(Icons.person),
          title: Text('Account Settings'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
        child:  ListTile(
          onTap: () {},
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
        ),
      ),
      const Divider(
        endIndent: 18,
        indent: 18,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
        child:  ListTile(
          onTap: () {},
          leading: Icon(Icons.feedback),
          title: Text('Feedback'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
        child:  ListTile(
          onTap: () {},
          leading: Icon(Icons.receipt),
          title: Text('Terms & Conditions'),
        ),
      ),
      const Divider(
        endIndent: 18,
        indent: 18,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
        child:  ListTile(
          onTap: () {},
          leading: Icon(Icons.logout),
          title: Text('Logout'),
        ),
      ),
    ]);
  }
}
