// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sportify/views/create_account.dart';
import 'package:sportify/views/sign_in.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFD4D4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/stroke.png",
                fit: BoxFit.cover,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 28,
                        width: 28,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "SPORTIFY",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Transform.rotate(
                        angle: -0.05,
                        child: Image.asset(
                          "assets/images/player.png",
                          height: size.height * 0.45,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: const [
                      Text(
                        "KEEP AN EYE ON\nTHE STADIUM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Watch sports live or highlights, read every\nnews from your smartphone",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14, 
                          height: 1.4,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20), 

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: HexagonClipper(),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          color: const Color(0xFFFF6B6B),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                              },
                              child: const Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccountScreen()));
                            },
                            child: const Center(
                              child: Text(
                                "CREATE ACCOUNT",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30), 
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final cut = size.height * 0.4;

    return Path()
      ..moveTo(cut, 0)
      ..lineTo(size.width - cut, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width - cut, size.height)
      ..lineTo(cut, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}