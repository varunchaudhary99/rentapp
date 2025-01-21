import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatRoomPage extends StatefulWidget {
  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _messageController = TextEditingController();
  //final List<String> _messages = [];

 // final ImagePicker _imagePicker = ImagePicker();
  final List<Map<String, dynamic>> _messages = [];


  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        _messages.add({"type": "file", "content": file});
      });
    }
  }

  void _pickImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      File file = File(image.path);
      setState(() {
        _messages.add({"type": "image", "content": file});
      });
    }
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    switch (message["type"]) {
      case "text":
        return Text(
          message["content"],
          style: TextStyle(fontSize: 16),
        );
      case "file":
        return Row(
          children: [
            Icon(Icons.insert_drive_file, color: Colors.blue),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                message["content"].path.split('/').last,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      case "image":
        return Image.file(
          message["content"],
          height: 150,
          width: 150,
          fit: BoxFit.fill,
        );
      default:
        return SizedBox.shrink();
    }
  } final ImagePicker _imagePicker = ImagePicker();
 // final List<Map<String, dynamic>> _messages = [];

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({"type": "text", "content": message});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'), // Replace with your image
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WA', style: TextStyle(fontSize: 18)),
                Text('last seen today at 8:59 pm', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.videocam),
          SizedBox(width: 15),
          Icon(Icons.call),
          SizedBox(width: 15),
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                // Chat Bubble 1: Image with link
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/rent.jpg', // Replace with your image
                            height: 150, width: 250, fit: BoxFit.cover),
                        SizedBox(height: 5),
                        Text(
                          "Makar Sankranti 2025 Wishes Messages Wallpaper Greetings...",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "https://images.app.goo.gl/92XVsNu4wtQ1xwz16",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Chat Bubble 2: Date Separator
                Center(
                  child: Text(
                    'Wednesday',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10),

                // Chat Bubble 3: APK file

                SizedBox(height: 10),

                // Chat Bubble 4: Image Preview
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset('assets/images/rent.jpg', // Replace with your image
                        height: 200, width: 250, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),

                // Chat Bubble 5: Voice Call
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.call, color: Colors.green),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Voice call", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("No answer · 7:42 pm"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Chat Bubble 6: Voice Message
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/avatar.jpg'), // Replace with your image
                          radius: 15,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.play_arrow, color: Colors.black),
                        SizedBox(width: 5),
                        Expanded(
                          child: LinearProgressIndicator(value: 0.2),
                        ),
                        SizedBox(width: 5),
                        Text("0:02"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Message Input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.emoji_emotions, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.attach_file, color: Colors.grey),
                SizedBox(width: 10),
                Icon(Icons.mic, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}