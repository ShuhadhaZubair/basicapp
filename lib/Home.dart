import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'authController.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textMessage = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {"text": "Hi! I'm your chatbot 🤖", "fromUser": false}
  ];

  void sendMessage() {
    final text = textMessage.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({"text": text, "fromUser": true});
      messages.add({"text": "Echo: $text", "fromUser": false}); // dummy reply
    });
    textMessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chatbot"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Get.find<AuthController>().logout(),
          )
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/images4.jpg"), // same background as login/signup
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
             SizedBox(height: 40.h),
             Text(
              "Chatbot",
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
             SizedBox(height: 20.h),

            // Chat card
            Expanded(
              child: Center(
                child: Container(
                  width: 350.w,
                  padding:  EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      // Messages list
                      Expanded(
                        child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final msg = messages[index];
                            final fromUser = msg["fromUser"] as bool;
                            return Align(
                              alignment: fromUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                margin:
                                const EdgeInsets.symmetric(vertical: 6),
                                padding:  EdgeInsets.all(12.sp),
                                decoration: BoxDecoration(
                                  color: fromUser
                                      ? Colors.blueAccent.withOpacity(0.7)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  msg["text"],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Input field
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textMessage,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Type a message...",
                                hintStyle:
                                const TextStyle(color: Colors.white54),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSubmitted: (_) => sendMessage(),
                            ),
                          ),
                           SizedBox(width: 8.w),
                          ElevatedButton(
                            onPressed: sendMessage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: const Text("Send"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
