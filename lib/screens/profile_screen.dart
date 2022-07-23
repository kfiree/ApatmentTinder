import 'package:appartment_tinder/Style/colors.dart';
import 'package:appartment_tinder/screens/Login.dart';
import 'package:appartment_tinder/widgets/bottons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = "profile";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      getProfileImage(),
      SizedBox(height: 20),
      Text('כפיר', style: Theme.of(context).textTheme.headline4),
      SizedBox(height: 40),
      // getBio(userSnapshot.data, userProvider),
      Expanded(child: Container()),
      RoundedButton(
          text: 'LOGOUT',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.id, (route) => false);
          })
    ]));
  }

  Widget getBio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Bio', style: Theme.of(context).textTheme.headline4),
            CircleButton(
              onPressed: () {
                // showDialog(
                // context: context,
                // builder: (_) => InputDialog(
                // onSavePressed: (value) => userProvider.updateUserBio(value),
                // labelText: 'Bio',
                // startInputText: user.bio,
                // ),
                // );
              },
              icon: Icons.edit,
              iconSize: 18,
              paddingReduce: 4,
              color: kAccentColor,
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          "No bio.",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget getProfileImage() {
    return Stack(
      children: [
        Container(
          child: CircleAvatar(
            backgroundImage: NetworkImage(kfirPic),
            radius: 75,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kAccentColor, width: 1.0),
          ),
        ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: CircleButton(
            onPressed: () async {},
            icon: Icons.edit,
            iconSize: 18,
            color: kAccentColor,
          ),
        ),
      ],
    );
  }
}

String kfirPic =
    "https://scontent.ftlv1-1.fna.fbcdn.net/v/t1.6435-9/76643685_10220526577497706_6080979779039789056_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=e3f864&_nc_ohc=e06MQUcXxOkAX828GAq&_nc_ht=scontent.ftlv1-1.fna&oh=00_AT-JEjPg6_MiP2T09EVQRVQaOOJIV_d6Q9Pub-LIXn5W-A&oe=62FDFB8F";
