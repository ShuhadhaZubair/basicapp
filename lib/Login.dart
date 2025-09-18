import 'package:basicui/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Signup.dart';
import 'authController.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/images4.jpg"), // put your starry bg image in assets
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
          child: Container(
            width: 350.w,
            padding:  EdgeInsets.all(24.sp),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                 SizedBox(height: 24.h),

                // Username field
                TextField(
                  controller: username,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.person, color: Colors.white70),
                    hintText: "Username",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                 SizedBox(height: 16.h),

                // Password field
                TextField(
                  controller: password,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                 SizedBox(height: 12.h),

                // Remember me + Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (v) {
                            setState(() {
                              rememberMe = v ?? false;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {

                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 16.h),

                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (username.text.isEmpty || !username.text.contains("@")) {
                        Get.snackbar("Error", "Enter valid email");
                        return;
                      }
                      if (password.text.length < 6) {
                        Get.snackbar("Error", "Password must be at least 6 chars");
                        return;
                      }
                      Get.find<AuthController>().login(username.text, password.text);
                    },
                    child: const Text("Login"),
                  )

                ),
                 SizedBox(height: 16.h),

                // Signup link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account? ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
