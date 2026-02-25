// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sportify/widgets/bottom_navbar.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool agreedToTerms = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!agreedToTerms) return;

    final userData = {
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text,
    };

    // my backend will be here

    debugPrint(userData.toString());

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavigation(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD4D4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset("assets/images/stroke.png", fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildHeader(), _buildForm()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
      color: const Color(0xFFFF4D4D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 26,
                width: 26,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              const Text(
                "SPORTIFY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "CREATE YOUR SPORTIFY ID",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Get news, game updates highlights and more\ninfo on your favorite teams",
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        children: [
          _buildTextField(hint: "First Name", controller: firstNameController),
          const SizedBox(height: 20),
          _buildTextField(hint: "Last Name", controller: lastNameController),
          const SizedBox(height: 20),
          _buildTextField(
            hint: "Email",
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            hint: "Password",
            controller: passwordController,
            isPassword: true,
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password must be at least 8 character long and include 1 capital letter and 1 symbol",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 20),
          _buildTerms(),
          const SizedBox(height: 30),
          _buildCreateAccountButton(),
          const SizedBox(height: 20),
          const Text(
            "By agreeing to the above terms, you are consenting that your personal information will be collected, stored, and processed in the United States and the European Union on behalf of Sportify Properties, Inc.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.black54, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
    );
  }

  Widget _buildTerms() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: agreedToTerms,
          activeColor: Colors.black,
          onChanged: (value) {
            setState(() {
              agreedToTerms = value ?? false;
            });
          },
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "I agree to the Terms and Privacy Policy",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateAccountButton() {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        height: 60,
        width: double.infinity,
        color: agreedToTerms ? const Color(0xFF3B0000) : Colors.black26,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: agreedToTerms ? _submitForm : null,
            child: const Center(
              child: Text(
                "CREATE ACCOUNT",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
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