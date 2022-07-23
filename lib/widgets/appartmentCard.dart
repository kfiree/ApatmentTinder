import 'package:flutter/material.dart';

import 'package:appartment_tinder/Style/colors.dart';
import 'package:appartment_tinder/model/apartment.dart';
import 'package:appartment_tinder/widgets/bottons.dart';

// import 'package:tinder_app_flutter/data/db/entity/app_user.dart';
// import 'package:tinder_app_flutter/util/constants.dart';

class SwipeCard extends StatefulWidget {
  final Apartment apartment;

  const SwipeCard({required this.apartment});

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.725,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.asset(
              widget.apartment.photoPath,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            child: Column(
              children: [
                Padding(
                    padding: showInfo
                        ? EdgeInsets.symmetric(horizontal: 8, vertical: 4)
                        : EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: getUserContent(context)),
                showInfo ? getBottomInfo() : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getUserContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: widget.apartment.address,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '  ${widget.apartment.bedroomNum} חדרים',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            )),
          ],
        ),
        CircleButton(
          onPressed: () {
            setState(() {
              showInfo = !showInfo;
            });
          },
          icon: showInfo ? Icons.arrow_downward : Icons.person,
          iconSize: 16,
          color: kColorPrimaryVariant,
        ),
      ],
    );
  }

  Widget getBottomInfo() {
    return Column(
      children: [
        const Divider(
          color: kAccentColor,
          thickness: 1.5,
          height: 0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Colors.black.withOpacity(.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    widget.apartment.bio.length > 0
                        ? widget.apartment.bio
                        : "No bio.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
