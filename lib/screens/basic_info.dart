import 'package:flutter/material.dart';

import '../widgets/button/custombutton.dart';
import '../widgets/widgets/colors.dart';
import 'getstarted.dart';



class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController carModelController = TextEditingController();
    final TextEditingController carColorController = TextEditingController();
    final TextEditingController licensePlateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSelect.greenColor,
        title: const Text('Basic Information',style: TextStyle(color: Colors.white),),
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
                  'Name',
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
                  labelText: 'Last Name',
                  hintText: 'Enter your last Name',
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
                  labelText: 'Age',
                  hintText: 'Enter your age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.color_lens),
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
                  'Next',
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