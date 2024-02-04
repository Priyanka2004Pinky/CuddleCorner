import 'package:cuddle_corner/Tabs/shadow_container.dart';
import 'package:cuddle_corner/pet_list_container.dart';
import 'package:flutter/material.dart';
import 'Helpers/color_helper.dart';
import 'package:cuddle_corner/Tabs/primary_font.dart';
import 'package:cuddle_corner/details_screen.dart';
import 'package:cuddle_corner/Data/pet_list_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      petSearchListData = petListData;
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var length = petSearchListData.length;
    print('home Screen');
    print(length);

    return Scaffold(
      body: ListView.builder(
          itemCount: length,
          itemBuilder: (ctx, idx) {
            print('index = $idx');
            print(petSearchListData[idx]['isAdopted']);
            return PetListContainer(
                petId: petSearchListData[idx]['petId'],
                petName: petSearchListData[idx]['petName'],
                petAge: petSearchListData[idx]['petAge'],
                petDes: petSearchListData[idx]['petDescription'],
                petImg: petSearchListData[idx]['petImage'],
                // petGender: petSearchListData[idx]['petGender'],
                isAdopted: petSearchListData[idx]['isAdopted'] ? true : false,
                onTap: () {
                  if (!petSearchListData[idx]['isAdopted']) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            petId: petSearchListData[idx]['petId'],
                            petName: petSearchListData[idx]['petName'],
                            petAge: petSearchListData[idx]['petAge'],
                            petDes: petSearchListData[idx]['petDescription'],
                            petImg: petSearchListData[idx]['petImage'],
                            petPrice: petSearchListData[idx]['petPrice'],
                            petGender: petSearchListData[idx]['petGender'],
                            isAdopted: petSearchListData[idx]['isAdopted'],
                          ),
                        ));
                  }
                });
          }),
    );
  }
}
