import 'package:flutter/material.dart';
import 'package:dss/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController nameController = TextEditingController();
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
              "Please Create your account to continue",
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
        _buildInputField(nameController, "Your Name"),
        const SizedBox(height: 24),
        _buildInputField(passwordController, "Your Email"),
        const SizedBox(height: 24),
        _buildInputField(passwordController, "Password"),
        const SizedBox(height: 24),
        _buildLoginButton(),
        const SizedBox(height: 24),
        _buildOrBorder(),
        const SizedBox(height: 24),
        _buildGoogleButton(),
        const SizedBox(height: 24),
        _buildFacebookButton(),
        const SizedBox(height: 1),
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

  Widget _buildLoginButton() {
    return ElevatedButton(
        onPressed: () {
          debugPrint("Name : ${nameController.text}");
          debugPrint("Email : ${emailController.text}");
          debugPrint("Password : ${passwordController.text}");
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
          "Sign in",
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
          elevation: 30,
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
          elevation: 30,
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
