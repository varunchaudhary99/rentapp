import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChatWrite extends StatefulWidget {
  final List<ChatMessage> messages;

  const ChatWrite({Key? key, required this.messages}) : super(key: key);

  @override
  State<ChatWrite> createState() => _ChatWriteState();
}

class _ChatWriteState extends State<ChatWrite> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: widget.messages.length,
      itemBuilder: (context, index) {
        final message = widget.messages[index];
        return Container(
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
      },
    );
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