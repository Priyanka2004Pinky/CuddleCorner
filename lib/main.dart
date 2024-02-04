import 'package:cuddle_corner/base_app_structure.dart';
import 'package:cuddle_corner/details_screen.dart';
import 'package:cuddle_corner/home_screen.dart';
import 'package:flutter/material.dart';

import 'Helpers/color_helper.dart';

void main(){
  runApp(const CuddleCorner());
}

class CuddleCorner extends StatefulWidget {
  const CuddleCorner({super.key});

  @override
  State<CuddleCorner> createState() => _CuddleCornerState();
}

class _CuddleCornerState extends State<CuddleCorner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cuddle Corner',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: BaseAppStructure(),
      // DetailsScreen(),
    );
  }
}

