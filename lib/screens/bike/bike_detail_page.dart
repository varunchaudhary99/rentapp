import 'package:flutter/material.dart';
import 'package:rentapp/screens/booking_date_page.dart';

import '../../widgets/button/custombutton.dart';
import '../../widgets/widgets/colors.dart';


class BikeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F4),
      body: SafeArea(
        child: Column(
          children: [
            // Top Section with Back Icon and Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/images/bike.jpg', // Replace with your image URL
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Car Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Car Name and Favorite Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bajaj Pulser",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite, color: ColorSelect.greenColor),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Rating Row
                  Row(
                    children: const [
                      Text(
                        "4.5",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_border, color: Colors.amber, size: 20),
                    ],
                  ),
                  const Divider(height: 20, thickness: 1),
                  // Renter Info
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://example.com/user-image.jpg', // Replace with your image URL
                        ),
                        radius: 25,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "John Samosa",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Renter",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.call, color:ColorSelect.blackColor ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.chat, color: ColorSelect.blackColor),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Divider(height: 20, thickness: 1),
                  // Car Specifications
                  const Text(
                    "Bike Specifications",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSpecCard("Max Power", "220 CC"),
                      _buildSpecCard("Top Speed", "80km/hr"),
                      _buildSpecCard("Fuel Type", "Patrol"),
                    ],
                  ),
                  const Divider(height: 20, thickness: 1),
                  // Book Now Button
                  const Text(
                    "Bike Information",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: DefaultColorButton(
                      height: 60,
                      width: 300,
                      color: ColorSelect.greenColor,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingPage()));
                      },
                      child: const Text(
                        "Book Now - GHS 100/day",
                        style: TextStyle(fontSize: 16,color: Colors.white),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorSelect.greenColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
