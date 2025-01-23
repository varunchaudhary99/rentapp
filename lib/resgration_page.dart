import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:rentapp/widgets/button/custombutton.dart';
import 'package:rentapp/widgets/widgets/CustomTextStyle.dart';
import 'package:rentapp/widgets/widgets/colors.dart';

import 'common/file_picker.dart';



class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorSelect.greenColor,
        title: Text('Registration',style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              // Handle Close Action
            },
            child: Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card list items
            SizedBox(height: 100,),

            Expanded(
              child: ListView(
                children: [
                  _buildListItem('Basic Info', Icons.person_outline, false,
                          () => _navigateTo(context, 'Basic Info')),
                  _buildListItem('Driving License', Icons.drive_eta_outlined,
                      false, () => _navigateTo(context, 'Driving License')),
                  _buildListItem('Aadhaar Card', Icons.credit_card, false,
                          () => _navigateTo(context, 'Aadhaar Card')),
                  _buildListItem(
                      'Police Verification Certificate',
                      Icons.verified_outlined,
                      true,
                          () => _navigateTo(
                          context, 'Police Verification Certificate')),
                  _buildListItem('Vehicle Info', Icons.directions_car, false,
                          () => _navigateTo(context, 'Vehicle Info')),
                  _buildListItem('Vehicle Insurance', Icons.shield_outlined,
                      true, () => _navigateTo(context, 'Vehicle Insurance')),
                ],
              ),
            ),
            // "Done" Button
            ElevatedButton(
              onPressed: () {
                // Handle Submit Action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
              child: Text(
                'Done',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            // Terms and Conditions
            Text.rich(
              TextSpan(
                text: 'By tapping ',
                style: TextStyle(color: Colors.black54),
                children: [
                  TextSpan(
                    text: 'Submit',
                    style: TextStyle(color: Colors.green),
                  ),
                  TextSpan(
                    text:
                    ' you agree with our Terms and Conditions and Privacy Policy',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
      String title, IconData icon, bool isCompleted, VoidCallback onTap) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        trailing: isCompleted
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap, // Handle click actions
      ),
    );
  }

  void _navigateTo(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(title: title)),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String title;

   DetailScreen({required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  File? frontView;

  File? selfieFile;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.title == 'Basic Info') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Center(
            child: Stack(
              children: [
                // Circular Avatar with Image
                CircleAvatar(
                  radius: 80, // Adjust radius as needed
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  backgroundColor: Colors.grey[200], // Fallback background color
                ),

                // Positioned Camera Icon
                Positioned(

                bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // Handle camera icon click
                      print('Camera Icon Clicked');
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.green, // Icon background color
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt, // Camera icon
                        color: Colors.white,
                        size: 18, // Icon size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:20),
          Text("Face clearly visible",style: CustomTextStyle.blackColorBold14,),
          SizedBox(height: 20,),
          Text("Remove sunglasses, mask and any cap.",style: CustomTextStyle.blackColorBold14,),
          SizedBox(height:20),
          Text("You should be wearing clothes, your hands should be completely free, do not use any filter, only you can see in the frame.",style: CustomTextStyle.blackColorBold14,),
          SizedBox(height:20),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: lastNameController,
            decoration: InputDecoration(
              labelText: 'Last Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              labelText: 'Date of Birth(optional)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20,),
          DefaultColorButton(
            onPressed: (){},
            color: ColorSelect.greenColor,
            child: Text('Done',style: TextStyle(color: ColorSelect.whiteColor,),
          )
          )],
      );
    } else if (widget.title == 'Driving License') {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                labelText: 'License Number',
                border: OutlineInputBorder(),
              ),
            ),
        SizedBox(),

            ...uploadSelfie(),
            SizedBox(),
            ...uploadSelfie(),
            SizedBox(height: 20,),
            DefaultColorButton(
                onPressed: (){},
                color: ColorSelect.greenColor,
                child: Text('Done',style: TextStyle(color: ColorSelect.whiteColor,),
                )
            )
            ],
        ),
      );
    } else if (widget.title == 'Aadhaar Card') {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Aadhaar Number',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Front View"),
            ...uploadSelfie(),
            SizedBox(height: 20,),
            Text("Back View"),
            ...uploadSelfie(),
            SizedBox(height: 20,),
            DefaultColorButton(
                onPressed: (){},
                color: ColorSelect.greenColor,
                child: Text('Done',style: TextStyle(color: ColorSelect.whiteColor,),
                )
            )
          ],
        ),
      );
    }else if (widget.title == 'Police Verification Certificate') {
      return  SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Police Verification Certificate',
              border: OutlineInputBorder(),
            ),
          ),
          Text("Front View"),
          ...uploadSelfie(),
          SizedBox(height: 20,),
         /* Text("Back View"),
          ...uploadSelfie(),
          SizedBox(height: 20,)*/
          DefaultColorButton(
              onPressed: (){},
              color: ColorSelect.greenColor,
              child: Text('Done',style: TextStyle(color: ColorSelect.whiteColor,),
              )
          )
        ],
      ));
    }
    else if (widget.title == 'Vehicle Info') {
      return SingleChildScrollView(child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Vehicle Info',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          Text("Front View"),
          ...uploadSelfie(),
          Text("Back View"),
          ...uploadSelfie(),
          SizedBox(height: 10,),
          DefaultColorButton(
              onPressed: (){},
              color: ColorSelect.greenColor,
              child: Text('Done',style: TextStyle(color: ColorSelect.whiteColor,),
              )
          )
        ],
      ));
    }
    else if (widget.title == 'Vehicle Insurance') {
      return SingleChildScrollView( child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Vehicle Insurance',
              border: OutlineInputBorder(),
            ),
          ),

          Text("Front View"),
          ...uploadSelfie(),
          SizedBox(height: 20,),
          Text("Back View"),
          ...uploadSelfie(),
          SizedBox(height: 20,),
          DefaultColorButton(
              onPressed: (){},
              color: ColorSelect.greenColor,
              child: Text('Done',style: TextStyle(color: ColorSelect.whiteColor,),
              )
          )
        ],
      ));
    }

    else {
      return Center(
        child: Text(
          'This is the ${widget.title} screen.',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
  }

  List<Widget> uploadSelfie() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ],
      ),
      SizedBox(
        height: 20,
      ),
      backSide(),
      SizedBox(
        height: 40,
      ),
    ];
  }

  Widget frontViewWidget() {
    return InkWell(
      onTap: () async {
        frontView = await openFilePicker(context);
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 4), // Offset in x and y direction
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 160,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: ColorSelect.whiteColor,
                ),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  padding: EdgeInsets.all(40),
                  color: ColorSelect.greyColor,
                  strokeWidth: 1,
                  child: frontView != null
                      ? Center(
                      child: Image.file(
                        frontView!,
                        fit: BoxFit.fitWidth,
                        height: 150,
                        width: 160,
                      ))
                      : Center(
                      child: Icon(
                        Icons.add_circle,
                        color: ColorSelect.greenColor,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget backSide() {
    return InkWell(
      onTap: () async {
        selfieFile = await openFilePicker(context,hideGalery: true);
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 4), // Offset in x and y direction
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 160,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: ColorSelect.whiteColor,
                ),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  padding: EdgeInsets.all(40),
                  color: ColorSelect.greyColor,
                  strokeWidth: 1,
                  child: selfieFile != null
                      ? Center(
                      child: Image.file(
                        selfieFile!,
                        fit: BoxFit.fitWidth,
                        height: 150,
                        width: 160,
                      ))
                      : Center(
                      child: Icon(
                        Icons.add_circle,
                        color: ColorSelect.pinkColor,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
