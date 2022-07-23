import 'package:appartment_tinder/widgets/bottons.dart';
import 'package:flutter/material.dart';

import '../Style/colors.dart';
import '../Widgets/appartmentCard.dart';
import '../model/apartment.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  static const String id = "swipe";

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int cardIndex = 0;

  void personSwiped(Apartment user, bool isLiked) async {
    if (isLiked == true) {
      print("like");
    } else {
      print("don't like");
    }
    setState(() => {cardIndex = cardIndex + 1});
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: cardIndex < apartments.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SwipeCard(apartment: apartments[cardIndex]),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 45),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //like button
                            CircleButton(
                              onPressed: () {
                                personSwiped(apartments[cardIndex], false);
                              },
                              icon: Icons.clear,
                              color: kColorPrimaryVariant,
                              iconSize: 30,
                            ),

                            // unlike button
                            CircleButton(
                              onPressed: () {
                                personSwiped(apartments[cardIndex], true);
                              },
                              icon: Icons.favorite,
                              color: kColorblack,
                              iconSize: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: const [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'rounded',
                        fontSize: 60.0,
                        color: kAccentColor,
                        fontWeight: FontWeight.w800 //.bold,
                        ),
                    "No more available appartments.",
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'rounded',
                        fontSize: 40.0,
                        color: kAccentColor,
                        fontWeight: FontWeight.w300 //.bold,
                        ),
                    "Please try again later.",
                  ),
                ],
              ),
      ),
    );
  }
}

List<Apartment> apartments = [
  Apartment(
      ownerId: "1",
      address: "גבעתיים כצנלסון 6",
      bedroomNum: 3,
      photoPath: 'assets/apartments/1.jpg'),
  Apartment(
      ownerId: "2",
      address: "תל אביב, אליעזר קפלן 2",
      bedroomNum: 1,
      photoPath: "assets/apartments/2.jpg"),
  Apartment(
      ownerId: "3",
      address: "תל אביב, דיזינגוף 32 א",
      bedroomNum: 3,
      photoPath: "assets/apartments/3.jpg"),
  Apartment(
      ownerId: "4",
      address: "תל אביב, שאול המלך 190",
      bedroomNum: 5,
      photoPath: "assets/apartments/4.jpg"),
  Apartment(
      ownerId: "5",
      address: "תל אביב, רחוב מומצא כלשהו 99",
      bedroomNum: 10,
      photoPath: "assets/apartments/5.jpg"),
  Apartment(
      ownerId: "6",
      address: "תל אביב, אליקום ליד דליה",
      bedroomNum: 3,
      photoPath: "assets/apartments/6.jpg"),
  Apartment(
      ownerId: "7",
      address: "תל אביב, רוטשילד 1ג",
      bedroomNum: 1,
      photoPath: "assets/apartments/7.jpg"),
  Apartment(
      ownerId: "8",
      address: "תל אביב, מרמורק 78",
      bedroomNum: 3,
      photoPath: "assets/apartments/8.jpg"),
  Apartment(
      ownerId: "9",
      address: "תל אביב, פרישמן 2",
      bedroomNum: 2,
      photoPath: "assets/apartments/9.jpg"),
  Apartment(
      ownerId: "10",
      address: "תל אביב, לוריא 13",
      bedroomNum: 3,
      photoPath: "assets/apartments/10.jpg"),
  Apartment(
      ownerId: "11",
      address: "תל אביב, חובבי ציון (אבל ממש)",
      bedroomNum: 3,
      photoPath: "assets/apartments/11.jpg"),
  Apartment(
      ownerId: "12",
      address: "תל אביב, פילון 654",
      bedroomNum: 2,
      photoPath: "assets/apartments/12.jpg"),
  Apartment(
      ownerId: "13",
      address: "תל אביב, אלנבי 34",
      bedroomNum: 3,
      photoPath: "assets/apartments/13.jpg"),
  Apartment(
      ownerId: "14",
      address: "תל אביב, החשמונאים 734.5 ",
      bedroomNum: 4,
      photoPath: "assets/apartments/14.jpg")
];
