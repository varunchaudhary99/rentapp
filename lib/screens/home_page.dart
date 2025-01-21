import 'package:flutter/material.dart';
import 'package:rentapp/screens/car_detail_page.dart';

import '../widgets/widgets/colors.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Selected location
  String selectedRegion = 'Greater Accra Region';
  String selectedSubLocation = 'East Legon';

  // Sample dropdown data
  final Map<String, List<String>> locationData = {
    'Greater Accra Region': ['East Legon', 'Osu', 'Tema'],
    'Ashanti Region': ['Kumasi', 'Obuasi', 'Ejisu'],
  };

  static  List<Widget> _widgetOptions = <Widget>[
    /// matches received sent accepted
    HomePage(),

    CarDetailsPage(),

    //Chat()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      // Header Section

      Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
      color: Color(0xFF0A5346),
      borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
      ),
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      // Location Row
        SizedBox(height: 20,),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
      children: [
      const Icon(Icons.location_on, color: Colors.white),
      const SizedBox(width: 8),

        DropdownButton<String>(
          value: selectedRegion,
          dropdownColor: Colors.grey[900], // Dropdown background color
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          underline: Container(),
          onChanged: (newRegion) {
            setState(() {
              selectedRegion = newRegion!;
              selectedSubLocation = locationData[newRegion]!.first; // Reset sublocation
            });
          },
          items: locationData.keys
              .map((region) => DropdownMenuItem<String>(
            value: region,
            child: Text(region),
          ))
              .toList(),
        ),

        // Dropdown for sub-location
        DropdownButton<String>(
          value: selectedSubLocation,
          dropdownColor: Colors.grey[900], // Dropdown background color
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          style: const TextStyle(color: Colors.white70),
          underline: Container(),
          onChanged: (newSubLocation) {
            setState(() {
              selectedSubLocation = newSubLocation!;
            });
          },
          items: locationData[selectedRegion]!
              .map((subLocation) => DropdownMenuItem<String>(
            value: subLocation,
            child: Text(subLocation),
          ))
              .toList(),
        ),
      ],
      ),

      // Profile Icon
      const CircleAvatar(
      backgroundImage: AssetImage('assets/images/profile.jpg'),
      radius: 20,
      ),
      ],
      ),
      const SizedBox(height: 20),
      // Main Heading
      const Text(
      'Find Your favourite\nvehicle',
      style: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      ),
      ),
      const SizedBox(height: 20),
      // Search Bar
      Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
      children: const [
      Icon(Icons.search, color: Colors.grey),
      SizedBox(width: 10),
      Expanded(
      child: TextField(
      decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Search for coffee',
      hintStyle: TextStyle(color: Colors.grey),
      ),
      ),
      ),
      Icon(Icons.mic, color: Colors.green),
      ],
      ),
      ),
      ],
      ),
      ),
      const SizedBox(height: 20),
      // Top Brands Section
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
      Text(
      'Top Brands',
      style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      ),
      ),
      Text(
      'See All',
      style: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.bold,
      ),
      ),
      ],
      ),
      ),
      const SizedBox(height: 10),
      // Brands List
        SizedBox(
          height: 80,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index) =>Column(children: [
                _buildBrandCard('assets/images/logo.png'),
              ],),
              separatorBuilder: (context,index) => SizedBox(width: 10,),
              itemCount: 6
          ),
        ),
      // Available Near You Section
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
      Text(
      'Available Near You',
      style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      ),
      ),
      Text(
      'See All',
      style: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.bold,
      ),
      ),
      ],
      ),
      ),
      const SizedBox(height: 10),
      // Cars List
        Expanded(child:ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) =>GestureDetector(
              onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> CarDetailsPage()));}, child: Column(children: [
                _buildCarCard(
                'assets/images/carimg.jpeg',
                'Mercedes Benz - 2022 CLS Coupe',
                4.5,
                'GHS 1000/day',
              ),
              ],),
            ),
            separatorBuilder: (context,index) => SizedBox(width: 20,),
            itemCount: 3
        )),

      const SizedBox(width: 10),
             /* _buildCarCard(
      'assets/images/audi_car.png',
      'Audi Benz - 2022 A4',
      4.5,
      'GHS 900/day',
      ),*/
      ],
      ),

        // Bottom Navigation Bar Placeholder

        );
        }

        Widget _buildBrandCard(String logoPath) {
        return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
        BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 5,
        spreadRadius: 2,
        ),
        ],
        ),
        child: Center(
        child: Image.asset(logoPath, height: 40, width: 40),
        ),
        );
        }

        Widget _buildCarCard(String imagePath, String title, double rating, String price) {
        return Container(
        width: 250,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
        BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 5,
        spreadRadius: 2,
        ),
        ],
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ClipRRect(
        borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        ),
        child: Image.asset(
        imagePath,
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
        ),
        ),
          Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Car Name and Model
          Text(
          'Mercedes Benz - 2022 CLS Coupe',
          style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
              children: [
              // Rating
              Text(
              '4.5',
              style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(width: 4),
              Row(
              children: List.generate(5, (index) {
              return Icon(
              index < 4
              ? Icons.star
                  : Icons.star_border, // Change if partial stars are needed
              size: 16,
              color: Colors.amber,
              );
              }),
              ),
              ],
              ),
            SizedBox(height: 8),
            // Price
            Text(
              'GHS 1000/day',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            )],
          ),






          ]))]));
  }
}
