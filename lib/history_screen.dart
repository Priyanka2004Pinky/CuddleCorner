import 'package:cuddle_corner/Tabs/shadow_container.dart';
import 'package:cuddle_corner/pet_list_container.dart';
import 'package:flutter/material.dart';
import 'Helpers/color_helper.dart';
import 'package:cuddle_corner/Tabs/primary_font.dart';
import 'package:cuddle_corner/details_screen.dart';
import 'package:cuddle_corner/Data/pet_list_data.dart';

class HistoryScreen extends StatefulWidget {
  final String? petName;
  final String? petAge;
  final String? petDes;
  final String? petPrice;
  final String? petGender;
  final String? petImg;
  final int? petId;
  bool isAdopted;
  final String? enteredValue;

  HistoryScreen({
    super.key,
    this.petName,
    this.petAge,
    this.petDes,
    this.petPrice,
    this.petGender,
    this.petImg,
    this.petId,
    this.isAdopted = false,
    this.enteredValue
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    petSearchListData = petListData;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var length = petSearchListData.length;
    print('History Screen');
    print(length);

    return Scaffold(
      body: ListView.builder(
          itemCount: length,
          itemBuilder: (ctx, idx) {
            print('index = $idx');
            print(petSearchListData[idx]['isAdopted']);
            if(petSearchListData[idx]['isAdopted']){
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
            }
            idx++;
          }),
    );
  }
}
