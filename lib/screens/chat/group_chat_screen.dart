import 'package:flutter/material.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Sample chat messages
  final List<ChatMessage> messages = [
    ChatMessage(
      sender: 'LUCY EDWARDS',
      status: 'ONLINE',
      message: '',
      timestamp: '',
      isStatusMessage: true,
    ),
    ChatMessage(
      sender: 'BFF GAP',
      message: 'i can feel my legs 😢',
      timestamp: '12:38 PM',
      status: '12 MINUTES AGO',
    ),
    ChatMessage(
      sender: 'WILSON CHEL',
      message: 'thnkss',
      timestamp: '12:36 PM',
      status: '15 MINUTES AGO',
    ),
    ChatMessage(
      sender: 'WILSON CHEL',
      message: 'omgygod dude 🤦‍♀️',
      timestamp: '12:35 PM',
      status: '16 MINUTES AGO',
    ),
    ChatMessage(
      sender: 'TREVOR BALD',
      message: 'lolol',
      timestamp: '12:34 PM',
      status: '17 MINUTES AGO',
    ),
    ChatMessage(
      sender: 'ALICE GAP',
      message: 'hi hell we just got through moving with 2 lost bank questions',
      timestamp: '12:33 PM',
      status: '18 MINUTES AGO',
    ),
    ChatMessage(
      sender: 'ALICE GAP',
      message: 'helllo!! tiks are back',
      timestamp: '12:32 PM',
      status: '19 MINUTES AGO',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Chats',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            
            // Chat messages container
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF7FB3D3),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    // Messages list
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return _buildMessageItem(messages[index]);
                        },
                      ),
                    ),
                    
                    // Message input
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                hintText: 'Send a message...',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              if (_messageController.text.trim().isNotEmpty) {
                                // Handle send message
                                print('Sending: ${_messageController.text}');
                                _messageController.clear();
                              }
                            },
                            child: const Text(
                              'SEND',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
          ],
        ),
      ),
      
      // Bottom navigation bar
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.home_outlined, false),
              _buildNavItem(Icons.chat_bubble_outline, true),
              _buildNavItem(Icons.calendar_today_outlined, false),
              _buildNavItem(Icons.settings_outlined, false),
              _buildNavItem(Icons.close, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    if (message.isStatusMessage) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.sender,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    message.status,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.settings,
                color: Colors.grey,
                size: 20,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFB8D4E3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      message.sender,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      message.status,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message.message,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Icon(
        icon,
        size: 28,
        color: isSelected ? const Color(0xFF7FB3D3) : Colors.grey,
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

// Chat message model
class ChatMessage {
  final String sender;
  final String message;
  final String timestamp;
  final String status;
  final bool isStatusMessage;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.timestamp,
    required this.status,
    this.isStatusMessage = false,
  });
}

// Main app to demonstrate the screen
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Chat Interface',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GroupChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const MyApp());
}