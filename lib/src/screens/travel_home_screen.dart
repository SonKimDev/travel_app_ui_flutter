import 'package:flutter/material.dart';
import 'package:travel_app_ui_flutter/src/constants/colors.dart';
import 'package:travel_app_ui_flutter/src/models/travel_model.dart';
import 'package:travel_app_ui_flutter/src/screens/place_detail.dart';
import 'package:travel_app_ui_flutter/src/widgets/popular_place.dart';
import 'package:travel_app_ui_flutter/src/widgets/recomendate.dart';

class TravelHomeScreen extends StatefulWidget {
  const TravelHomeScreen({super.key});

  @override
  State<TravelHomeScreen> createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.confirmation_number_outlined,
    Icons.bookmark_outline,
    Icons.person_outline,
  ];

  List<TravelDestination> popular =
      myDestination.where((element) => element.category == 'popular').toList();

  List<TravelDestination> recomendate =
      myDestination.where((element) => element.category == 'recomend').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: headerParts(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular place',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(fontSize: 14, color: blueTextColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              children: [
                ...List.generate(
                  popular.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PlaceDetailScreen(destination: popular[index]),
                          ),
                        );
                      },
                      child: PopularPlace(
                        destination: popular[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recomendation for you',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(fontSize: 14, color: blueTextColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  ...List.generate(
                    recomendate.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PlaceDetailScreen(destination: recomendate[index]),
                            ),
                          );
                        },
                        child: Recomendate(
                          destination: recomendate[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 22,
                        ),
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                              icons.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPage = index;
                                  });
                                },
                                child: Icon(
                                  icons[index],
                                  size: 32,
                                  color: selectedPage == index
                                      ? Colors.white
                                      : Colors.white.withOpacity(
                                          0.4,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 180,
      leading: const Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.location_on,
            color: Colors.black,
          ),
          SizedBox(width: 5),
          Text(
            'Jawa Timur',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 30,
            color: Colors.black26,
          ),
        ],
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          padding: const EdgeInsets.all(7),
          child: const Stack(
            children: [
              Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
