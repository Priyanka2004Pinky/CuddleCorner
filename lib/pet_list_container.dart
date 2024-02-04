import 'package:flutter/material.dart';

import 'Data/pet_list_data.dart';
import 'Helpers/color_helper.dart';
import 'Tabs/primary_font.dart';
import 'Tabs/shadow_container.dart';
import 'base_app_structure.dart';
import 'details_screen.dart';

class PetListContainer extends StatelessWidget {
  final String? petName;
  final String? petAge;
  final String? petDes;
  final String? petImg;
  final int? petId;
  final bool isAdopted;
  void Function()? onTap;

  PetListContainer({
    super.key,
    required this.petName,
    required this.petAge,
    required this.petDes,
    required this.petImg,
    this.petId,
    required this.isAdopted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print('Pet List Container');
    print(petName);
    print(petAge);
    print(petDes);
    print(isAdopted);
    print(petId);

    return Padding(
        padding: EdgeInsets.all(15.0),
        child: SizedBox(
          child: InkWell(
            onTap: onTap,
            child: ShadowContainer(
              isCircle: false,
              height: 150,
              width: width * 0.9,
              // radius: 20,
              color: isAdopted ? ColorHelper.secColor : ColorHelper.whiteColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      petImg!,
                      width: width * 0.3,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: PrimaryFont(
                            text: petName,
                            color: ColorHelper.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          child: PrimaryFont(
                            text: petAge,
                            color: ColorHelper.primaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                            petDes!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontFamily: 'kalamLight'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
