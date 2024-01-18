import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class AddNewPlayer extends StatefulWidget {
  const AddNewPlayer({super.key});

  @override
  State<AddNewPlayer> createState() => _AddNewPlayerState();
}

class _AddNewPlayerState extends State<AddNewPlayer> {
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
          child: Text('ADD Player', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }



}
