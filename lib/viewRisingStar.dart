import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ViewRisingStar extends StatefulWidget {
  const ViewRisingStar({super.key});

  @override
  State<ViewRisingStar> createState() => _ViewRisingStarState();
}

class _ViewRisingStarState extends State<ViewRisingStar> {
  late Color myColor;
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor; // Moved here
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const SafeArea(
        child: Center(
          child: Text('Profile', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }



}
