import 'package:flutter/material.dart';
import 'package:rentapp/widgets/widgets/colors.dart';
import '../widgets/button/custombutton.dart';
import '../widgets/widgets/CustomTextStyle.dart';
import 'bike/home_page_bike.dart';
import 'home_bottom_nav.dart';
import 'home_page.dart';


class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  State<Getstarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(
          width: double.infinity, // Ensures the container takes the full width
          height: double.infinity, child: Stack(
      children: [
      // Background Image
      Positioned.fill(
        child: Image.asset(
        "assets/images/carimage.jpeg",
        fit: BoxFit.cover,
      ),
    ),
    // Centered Text
    Positioned(
    top: 150,
    left: 20, // Add padding if needed
    right: 20,
    child: Text(
    "Find and rent any car of your choice",
    style: CustomTextStyle.whiteColorBoldNum24,
    textAlign: TextAlign.center,
    ),
    ),
    // Button at the Bottom
    Positioned(
    bottom: 100,
    left: 20, // Center button with padding
    right: 20,
    child: DefaultColorButton(
    child: Text(
    'Bike',
    style: CustomTextStyle.whiteColorBold16,
    ),
    color: ColorSelect.greenColor,
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageBike()));
    // Add your button press functionality here
    },
    ),
    ),
        Positioned(
          bottom: 30,
          left: 20, // Center button with padding
          right: 20,
          child: DefaultColorButton(
            child: Text(
              'Get Started',
              style: CustomTextStyle.whiteColorBold16,
            ),
            color: ColorSelect.greenColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeBottomNav()));
              // Add your button press functionality here
            },
          ),
        ),
    ],
    ),
          ));
  }
}