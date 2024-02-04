import 'package:cuddle_corner/Tabs/shadow_container.dart';
import 'package:cuddle_corner/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuddle_corner/Helpers/color_helper.dart';
import 'Data/pet_list_data.dart';
import 'history_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BaseAppStructure extends StatefulWidget {

  const BaseAppStructure({
    super.key,
    // required this.child
  });

  @override
  State<BaseAppStructure> createState() => _BaseAppStructureState();
}

class _BaseAppStructureState extends State<BaseAppStructure> {
  int currentIdx = 0;

  // void updateEnteredValue(String value) {
  //   setState(() {
  //     enteredValue = value;
  //   });
  // }

  void runFilter(String enteredValue) {
    print('BaseApp - enteredValue $enteredValue');
    List<Map<String, dynamic>> result = [];
    if (enteredValue.isEmpty) {
      result = petListData;
    } else {
      result = petListData
          .where((i) =>
          i['petName'].contains(enteredValue) ||
          i['petGender'].contains(enteredValue))
          .toList();
    }

    setState(() {
      petSearchListData = result;
      print('BaseApp - SearchedValue $petSearchListData');
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeScreen(),
      HistoryScreen(),
    ];

    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ShadowContainer(
                      width: 50,
                      height: 50,
                      isCircle: true,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('img/avatar.jpg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cuddle Corner',
                      style: TextStyle(
                          color: ColorHelper.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'kalamBold',
                          fontSize: 18),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShadowContainer(
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  radius: 20,
                  // height: 50,
                  // isCircle: true,
                  child: TextField(
                    onChanged: (value) {
                      runFilter(value);
                    },
                    decoration: InputDecoration(
                        hintText: 'Search..',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),
                  ),
                  // child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ),
              ),
            ],
          ),
          Expanded(
            child: _pages[currentIdx],
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 7),
        decoration: BoxDecoration(
            color: ColorHelper.primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: GNav(
            backgroundColor: ColorHelper.primaryColor,
            color: ColorHelper.whiteColor,
            activeColor: ColorHelper.primaryColor,
            tabBackgroundColor: ColorHelper.whiteColor,
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            selectedIndex: currentIdx,
            onTabChange: (index) {
              setState(() {
                currentIdx = index;
              });
              print(currentIdx);
            },
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.history, text: 'History'),
            ]),
      ),
    );
  }
}
