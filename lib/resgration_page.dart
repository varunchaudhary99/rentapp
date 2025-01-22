import 'package:flutter/material.dart';
import 'package:rentapp/widgets/button/custombutton.dart';
import 'package:rentapp/widgets/widgets/colors.dart';



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

class DetailScreen extends StatelessWidget {
  final String title;

   DetailScreen({required this.title});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (title == 'Basic Info') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Basic Info Screen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              labelText: 'Date of Birth(optional)',
              border: OutlineInputBorder(),
            ),
          ),

          DefaultColorButton(
            onPressed: (){},
            color: ColorSelect.greenColor,
            child: Text('Done',style: TextStyle(color: ColorSelect.whiteColor,),
          )
          )],
      );
    } else if (title == 'Driving License') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Driving License Screen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'License Number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Expiry Date',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );
    } else if (title == 'Aadhaar Card') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aadhaar Card Screen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Aadhaar Number',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: Text(
          'This is the $title screen.',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
  }
}