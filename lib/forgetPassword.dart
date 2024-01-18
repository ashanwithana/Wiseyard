import 'package:dss/resetSuccess.dart';
import 'package:flutter/material.dart';
import 'package:dss/login.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor; // Moved here
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Container(
      width: mediaSize.width,
      height: mediaSize.height,
      color: Colors.black12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 210.0, // Replace with your desired width
            height: 112.0, // Replace with your desired height
            child: Image.asset('assets/images/WISEYARD.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        color: Colors.white10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 222.0, // Replace with your desired width
            height: 40.0, // Replace with your desired height
            alignment: Alignment.center,
            child: const Text(
              "RESET PASSWORD",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _buildInputField(passwordController, "New Password", isPassword: true),
        const SizedBox(height: 24),
        _buildInputField(passwordController, "Retype Password", isPassword: true),
        const SizedBox(height: 24),
        _buildResetButton(),
        const SizedBox(height: 24),
        _buildLoginText(context),
      ],
    );
  }

  Widget _buildInputField(TextEditingController controller, String hintText,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: hintText,
        fillColor: Colors.white,
        suffixIcon: isPassword
            ? IconButton(
          icon: const Icon(Icons.visibility),
          onPressed: () {
            // Toggle password visibility
            setState(() {
              isPassword = !isPassword;
            });
          },
        )
            : null, // No suffix icon for non-password fields
      ),
      obscureText: isPassword,
    );
  }
  Widget _buildResetButton() {
    return ElevatedButton(
        onPressed: () {
          debugPrint("NEWPassword : ${passwordController.text}");
          debugPrint("RETYPEPassword : ${passwordController.text}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              const ResetSuccessPage(), // Replace with your signup page widget
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 30,
          shadowColor: myColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size.fromHeight(60),
        ),
        child: const Text(
          "Reset Password",
          style: TextStyle(
            color: Color.fromRGBO(83, 83, 83, 1), // Red color (RGB: 255, 0, 0)
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
  Widget _buildLoginText(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TextButton(
            onPressed: () {
              // Navigate to the signup page when the "Sign up" text is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const LoginPage(), // Replace with your signup page widget
                ),
              );
            },
            child: const Text(
              "Already have an account? Log In",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}