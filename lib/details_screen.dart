import 'package:cuddle_corner/Helpers/color_helper.dart';
import 'package:cuddle_corner/Tabs/primary_font.dart';
import 'package:cuddle_corner/Tabs/shadow_container.dart';
import 'package:cuddle_corner/history_screen.dart';
import 'package:cuddle_corner/home_screen.dart';
import 'package:cuddle_corner/pet_list_container.dart';
import 'package:flutter/material.dart';
import 'package:cuddle_corner/Data/pet_list_data.dart';

class DetailsScreen extends StatefulWidget {
  final String? petName;
  final String? petAge;
  final String? petDes;
  final String? petPrice;
  final String? petGender;
  final String? petImg;
  final int petId;
  bool isAdopted;

  DetailsScreen({
    super.key,
    required this.petName,
    required this.petAge,
    required this.petDes,
    required this.petPrice,
    required this.petGender,
    required this.petImg,
    required this.petId,
    required this.isAdopted,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String adoptedText = 'Adopt Me';

  @override
  Widget build(BuildContext context) {
    print('details screen');
    print(widget.petName!);
    print(widget.petAge!);
    print(widget.petId);
    print(widget.isAdopted);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Image(
              image: AssetImage(widget.petImg!),
              height: height * 0.6,
              width: width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: height * 0.5,
              child: Container(
                height: height * 0.5,
                width: width,
                decoration: const BoxDecoration(
                    color: ColorHelper.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: ColorHelper.shadowSecColor,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(-3, -3)),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 18, bottom: 10, left: 10, right: 10),
                  child: Column(
                    children: [
                      PrimaryFont(
                        text: widget.petName,
                        color: ColorHelper.whiteColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                      PrimaryFont(
                          text: widget.petAge,
                          color: ColorHelper.whiteColor,
                          fontSize: 18),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.1, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ShadowContainer(
                                    width: 35,
                                    height: 35,
                                    isCircle: true,
                                    color: ColorHelper.primaryColor,
                                    child: Center(
                                      child: PrimaryFont(
                                          text: '₹',
                                          color: ColorHelper.whiteColor,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: PrimaryFont(
                                      text: widget.petPrice,
                                      color: ColorHelper.whiteColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ShadowContainer(
                                    width: 35,
                                    height: 35,
                                    isCircle: true,
                                    color: ColorHelper.primaryColor,
                                    child: Icon(
                                      widget.petGender == 'Male'
                                          ? Icons.male_outlined
                                          : Icons.female_outlined,
                                      color: ColorHelper.whiteColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: PrimaryFont(
                                      text: widget.petGender,
                                      color: ColorHelper.whiteColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      PrimaryFont(
                          text: widget.petDes,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          color: ColorHelper.whiteColor,
                          fontSize: 15),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: ShadowContainer(
                          radius: 20,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                adoptedText = 'Thank you for Adopting me';
                                widget.isAdopted = petListData[widget.petId]['isAdopted'] = true;
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreen(
                                              // petName: widget.petName,
                                              // petAge: widget.petAge,
                                              // petDes: widget.petDes,
                                              // petImg: widget.petImg,
                                              // isAdopted: widget.isAdopted,
                                              // petId: widget.petId,
                                            ),
                                    ));
                              });
                              print(widget.isAdopted);
                              print('pet id');
                              print(widget.petId);
                              print(petListData[widget.petId]['isAdopted']);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorHelper.whiteColor,
                                foregroundColor: ColorHelper.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            child: Center(
                              child: PrimaryFont(
                                text:  widget.isAdopted ? 'Thank You for Adopting Me' : 'Adopt Me',
                                fontSize: 20,
                                color: ColorHelper.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


