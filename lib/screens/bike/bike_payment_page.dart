import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentapp/widgets/button/custombutton.dart';
import 'package:rentapp/widgets/widgets/colors.dart';

class BikePaymentPage extends StatefulWidget {
  @override
  State<BikePaymentPage> createState() => _BikePaymentPageState();
}

class _BikePaymentPageState extends State<BikePaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: Colors.grey[200],
                        child: Stack(
                          children: [
                            // Mock map container
                            Center(
                              child: Icon(
                                Icons.map,
                                size: 250,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.my_location, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                        color:Colors.white70,
                        borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                     child:Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Text(
                       "Mercedes Benz\n2022 CLS Coupe",
                       style: GoogleFonts.poppins(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color: ColorSelect.greenColor,
                       ),
                     ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Max Power\n720 W",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ])

                     ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: ColorSelect.greenColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(height: 20),
                            Text(
                              "Summary",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildSummaryItem("Start", "17th May 2023"),
                                _buildSummaryItem("Finish", "20th May 2023"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.white),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "University of Ghana, Legon\n20km",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Payment Options",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/pay.png',
                                  height: 40,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "MTN Mobile Money",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Radio(
                                  value: true,
                                  groupValue: true,
                                  onChanged: (value) {},
                                  activeColor: Colors.white,
                                ),
                              ],
                            ),

                            DefaultColorButton(
                              onPressed: () {},
                              color: Colors.amber,
                              child: Text(
                                "Pay Now - GHS 1000/day",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        )));
  }

  Widget _buildSummaryItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.teal,
            ),
          ),
        ),
      ],
    );
  }
}
