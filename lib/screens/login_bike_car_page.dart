import 'package:flutter/material.dart';
import 'package:rentapp/widgets/button/custombutton.dart';
import 'package:rentapp/widgets/widgets/colors.dart';

import 'getstarted.dart';


class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController carModelController = TextEditingController();
    final TextEditingController carColorController = TextEditingController();
    final TextEditingController licensePlateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSelect.greenColor,
        title: const Text('Car/Bike Information',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height:150),
              Center(
                child: const Text(
                  'Enter Car/Bike Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: carModelController,
                decoration: InputDecoration(
                  labelText: 'Car Model / Bike Model',
                  hintText: 'Enter your car model',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  prefixIcon: const Icon(Icons.directions_car),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: carColorController,
                decoration: InputDecoration(
                  labelText: 'Car Color / Bike Color',
                  hintText: 'Enter your car color',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.color_lens),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: licensePlateController,
                decoration: InputDecoration(
                  labelText: 'License Plate',
                  hintText: 'Enter your license plate number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.confirmation_number),
                ),
              ),
              const SizedBox(height: 30),
              DefaultColorButton(
                color: ColorSelect.greenColor,
                onPressed: () {
                  // Add login functionality here
        
                   Navigator.push(context,MaterialPageRoute(builder: (context)=> Getstarted()));
        
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Car Model: ${carModelController.text}\n'
                            'Car Color: ${carColorController.text}\n'
                            'License Plate: ${licensePlateController.text}',
                      ),
                    ),
                  );
                },
        
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}