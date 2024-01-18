import 'package:dss/dashboard.dart';
import 'package:dss/signup.dart';
import 'package:flutter/material.dart';
import 'package:dss/forgetPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildTop(),
              _buildBottom(),
            ],
          ),
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
            child: Image.asset('assets/images/WISEYARD.png', scale: 30,),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Card(
      color: Colors.white10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Container(
            width: 222.0, // Replace with your desired width
            height: 40.0, // Replace with your desired height
            alignment: Alignment.center,
            child: const Text(
              "Please Log into your existing account",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _buildInputField(emailController, "Your Email"),
        const SizedBox(height: 24),
        _buildInputField(passwordController, "Password", isPassword: true),
        const SizedBox(height: 24),
        _buildRememberForgot(),
        const SizedBox(height: 24),
        _buildLoginButton(),
        const SizedBox(height: 24),
        _buildOrBorder(),
        const SizedBox(height: 24),
        _buildGoogleButton(),
        const SizedBox(height: 24),
        _buildFacebookButton(),
        const SizedBox(height: 24),
        _buildSignupText(context),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
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

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                activeColor: Colors.white,
                checkColor: Colors.black,
                focusColor: Colors.white,
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {
              // Navigate to the signup page when the "Sign up" text is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ForgetPasswordPage(), // Replace with your signup page widget
                ),
              );
            },
            child: _buildGreyText("Forgot Password?"))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
        onPressed: () {
          debugPrint("Email : ${emailController.text}");
          debugPrint("Password : ${passwordController.text}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              const Dashboard(), // Replace with your signup page widget
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: myColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size.fromHeight(60),
        ),
        child: const Text(
          "Log in",
          style: TextStyle(
            color: Color.fromRGBO(83, 83, 83, 1), // Red color (RGB: 255, 0, 0)
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ));
  }

  Widget _buildOrBorder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 1, // Height of the line
            color: Colors.white, // Color of the line
            margin: const EdgeInsets.only(
                right: 8.0), // Adjust the margin as needed
          ),
        ),
        const Text(
          "OR",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            height: 1, // Height of the line
            color: Colors.white, // Color of the line
            margin:
                const EdgeInsets.only(left: 8.0), // Adjust the margin as needed
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: myColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size.fromHeight(60),
        ),
        child: const Text(
          "Continue with Google",
          style: TextStyle(
            color: Color.fromRGBO(83, 83, 83, 1), // Red color (RGB: 255, 0, 0)
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ));
  }

  Widget _buildFacebookButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: myColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size.fromHeight(60),
        ),
        child: const Text(
          "Continue with Facebook",
          style: TextStyle(
            color: Color.fromRGBO(83, 83, 83, 1), // Red color (RGB: 255, 0, 0)
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ));
  }

  Widget _buildSignupText(BuildContext context) {
    return  TextButton(
      onPressed: () {
        // Navigate to the signup page when the "Sign up" text is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const SignupPage(), // Replace with your signup page widget
          ),
        );
      },
      child: const Text(
        "Don’t have an account? Sign up",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
