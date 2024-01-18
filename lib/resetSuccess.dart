import 'package:flutter/material.dart';
import 'package:dss/login.dart';

class ResetSuccessPage extends StatefulWidget {
  const ResetSuccessPage({super.key});

  @override
  State<ResetSuccessPage> createState() => _ResetSuccessPageState();
}

class _ResetSuccessPageState extends State<ResetSuccessPage> {
  late Color myColor;
  late Size mediaSize;

  @override
  void initState() {
    super.initState();

    // Add a delay of 2 seconds before navigating to the login page
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(), // Replace with your login page
        ),
      );
    });
  }

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
        const SizedBox(height: 24),
        _buildSuccessIcon(),
        const SizedBox(height: 24),
        _buildSuccessText(context),
        const SizedBox(height: 24),
        _buildSuccessDescText(context),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildSuccessIcon() {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/check-circle.png'),
        ],
      ),
    );
  }

  Widget _buildSuccessText(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            "Password changed",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessDescText(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            "Your password has been changed successfully",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
