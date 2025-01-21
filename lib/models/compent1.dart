import "package:flutter/cupertino.dart";

import 'package:flutter/material.dart';

class UnreadMeassage extends StatefulWidget {
  final List<ChatMessage> messages;
  const UnreadMeassage({super.key, required this.messages});

  @override
  State<UnreadMeassage> createState() => _UnreadMeassageState();
}

class _UnreadMeassageState extends State<UnreadMeassage> {
  int badgeCount = 319;
  String dropdownValue = 'Unread Messages'; // Initial value

  // Dropdown options
  final List<String> options = [
    'Unread Messages',
    'All Messages',
    'Archived Messages',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomSheet:   ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        itemCount: widget.messages.length,
        itemBuilder: (context, index) {
          final message = widget.messages[index];
          return Container(
            color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sender initials
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Text(
                    message.senderInitials,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                // Message bubble
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message.message,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Reactions and timestamp
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: message.reactions
                                .map(
                                  (reaction) => Container(
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green.shade50,
                                ),
                                child: Icon(
                                  reaction.icon,
                                  color: reaction.color,
                                  size: 20,
                                ),
                              ),
                            )
                                .toList(),
                          ),
                          Text(
                            message.timestamp,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: 50,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.green,
          ),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            color: Colors.green.shade700,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          underline: Container(
            height: 0,
            color: Colors.transparent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Center(
        child: Container(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Center(child: Text("29 December 2024")),
        ),
      ),

      Center(
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(
                  Icons.warning,
                  color: Colors.orange,
                  size: 24,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Pinned Message",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "⚠️ RULES FOR THIS GROUP Groups like @Py...",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.push_pin,
                  color: Colors.grey[600],
                  size: 24,
                ),
              ]))),
      SizedBox(height: 40,),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          color: Colors.white,
          child: Row(
            children: [
              // User Avatar
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
                child: Text(
                  'A',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 8),
              // Text Field
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              // Attachment Icon
              Icon(
                Icons.attach_file,
                color: Colors.grey,
              ),
              SizedBox(width: 8),
              // Camera Icon
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      Center(
          child: Stack(alignment: Alignment.center, children: [
        // Circular Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            backgroundColor: Colors.white,
            elevation: 5,
          ),
          onPressed: () {
            // Decrease badge count dynamically
            setState(() {
              if (badgeCount > 0) badgeCount--;
            });
          },
          child: Icon(
            Icons.arrow_downward,
            size: 30,
            color: Colors.grey,
          ),
        ),
        // Badge
        Positioned(
            top: -2,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(badgeCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ))))
      ])),
      Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Section
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Image.asset(
                  'assets/images/rent.jpg', // Add your logo in assets folder
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 16.0),
              // Title Section
              Text(
                'CLASSIC INDIA',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 8.0),
              // Subtitle Section
              Text(
                'CATALOGUE 2025',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                '44 pages • 9.9 MB • PDF',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image and Title Section
                  Row(
                    children: [
                      // Thumbnail Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/rent.jpg', // Add your image in assets folder
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      // Title and Views
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '1K views | Trading Hub',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Start Your Investment Journey ...',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'www.facebook.com',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Hyperlink Section
                  GestureDetector(
                    onTap: () {
                      // Add your hyperlink logic here
                      print('Link tapped');
                    },
                    child: const Text(
                      'https://www.facebook.com/share/r/5dLCWiDVxUPVPoEE/?mibextid=hBBs4f',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Row(
                      children: [
                        // Profile Picture
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/rent.jpg'), // Replace with your profile image
                          radius: 20,
                        ),
                        const SizedBox(width: 8.0),
                        // Name and Forwarded Tag
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Moni Sajoda',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Forwarded',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    // Video Thumbnail Section
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/rent.jpg', // Replace with your video thumbnail image
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Play Button Overlay
                        Positioned.fill(
                          child: Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 60.0,
                            ),
                          ),
                        ),
                        // Video Duration
                        Positioned(
                          bottom: 8.0,
                          right: 8.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Text(
                              '0:37',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    // Caption Section
                    const Text(
                      'Today practice..26.12.24',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Reaction Section
                    Row(
                      children: const [
                        Icon(Icons.thumb_up, color: Colors.orange, size: 20.0),
                        SizedBox(width: 4.0),
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.grey,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Slider(
                              value: 0.3,
                              onChanged: (value) {},
                              activeColor: Colors.orange,
                              inactiveColor: Colors.grey.shade300,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.headset,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      // File Name and Time
                      Row(
                        children: const [
                          Text(
                            'AUD-20241214-WA0...',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            '11:36 pm',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            Container(
                padding: const EdgeInsets.all(12.0), // Padding inside the bubble
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8, // Limit bubble width
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Align(
                  alignment: Alignment.topLeft, // Align the content to top-left
                  child: Text(
                    "hello",
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),

            )])));
  }
}

// Models for chat message and reactions
class ChatMessage {
  final String senderInitials;
  final String message;
  final String timestamp;
  final List<Reaction> reactions;

  ChatMessage({
    required this.senderInitials,
    required this.message,
    required this.timestamp,
    this.reactions = const [],
  });
}

class Reaction {
  final IconData icon;
  final Color color;

  Reaction({required this.icon, required this.color});
}
