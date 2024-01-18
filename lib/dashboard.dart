import 'package:dss/viewBestChoice.dart';
import 'package:dss/addNewPlayer.dart';
import 'package:dss/viewRisingStar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Color myColor;
  late Size mediaSize;

  // List of image URLs
  final List<List<String>> dataSet = [
    ['assets/images/addplayer.png', 'ADD NEW PLAYER', 'Add new player and get predictions'],
    ['assets/images/risingstar.png', 'RISING STAR', 'View future stars with average bids'],
    ['assets/images/bestchoice.png', 'BEST CHOICES', 'View best players for up coming season'],
  ];

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor; // Moved here
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildTop(),
            _buildSlider(),
            _buildFooter(onHome: (){}, onProfile: (){})
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Container(
      width: mediaSize.width,
      height: mediaSize.height*0.1,
      color: Colors.black12,
      child: const Text(
        "Dashboard",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSlider(){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(40),
         child: Swiper(
          indicatorLayout: PageIndicatorLayout.SCALE,
          scrollDirection: Axis.horizontal,
          scale: 0.9,
          viewportFraction: 1,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                print('>>>>>>');
                if(index==0){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const AddNewPlayer(), // Replace with your signup page widget
                    ),
                  );
                }
                if(index==1){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const ViewRisingStar(), // Replace with your signup page widget
                    ),
                  );
                }
                if(index==2){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const ViewBestChoice(), // Replace with your signup page widget
                    ),
                  );
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      height: 500,
                      // margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage((dataSet[index][0])),
                          ),
                      ),
                      margin: const EdgeInsets.only(top: 0,bottom: 0,left: 20,right: 20),
                    ),
                     Text(dataSet[index][1], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(255, 255, 255, 1))),
                    const SizedBox(height: 19),
                    Text(dataSet[index][2], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(255, 255, 255, 1))),
                  ],
                ),
              ),
            );
          },
          itemCount: dataSet.length,
          pagination: null,
          control: null,
        ),
      ),
    );
  }

  Widget _buildFooter({Function()? onHome, Function()? onProfile}) {
    return  Card(
      color: Colors.white10,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         GestureDetector(
           onTap: onHome,
           child: Column(
             children: [
               const SizedBox(height: 15),
               SizedBox(
                 child: Image.asset('assets/images/footer/dashboard.png'),
               ),
               const SizedBox(height: 15),
               const Text('Dashboard', style: TextStyle(color: Colors.white,
                 fontSize: 10,
                 fontFamily: 'Poppins',
                 fontWeight: FontWeight.w400,
                 height: 0.10,
                 letterSpacing: 0.30,)),
               const SizedBox(height: 15),
             ],
           ),
         ),
          GestureDetector(
            onTap: onHome,
            child: Column(
              children: [
                const SizedBox(height: 15),
                SizedBox(
                  child: Image.asset('assets/images/footer/position.png'),
                ),
                const SizedBox(height: 15),
                const Text('Positions', style: TextStyle(color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                  letterSpacing: 0.30,)),
                const SizedBox(height: 15),
              ],
            ),
          ),
          GestureDetector(
            onTap: onHome,
            child: Column(
              children: [
                const SizedBox(height: 15),
                SizedBox(
                  child: Image.asset('assets/images/footer/addnew.png'),
                ),
                const SizedBox(height: 15),
                const Text('Add New', style: TextStyle(color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                  letterSpacing: 0.30,)),
                const SizedBox(height: 15),
              ],
            ),
          ),
          GestureDetector(
            onTap: onHome,
            child: Column(
              children: [
                const SizedBox(height: 15),
                SizedBox(
                  child: Image.asset('assets/images/footer/compare.png'),
                ),
                const SizedBox(height: 15),
                const Text('Compare', style: TextStyle(color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                  letterSpacing: 0.30,)),
                const SizedBox(height: 15),
              ],
            ),
          ),
          GestureDetector(
           onTap: onProfile,
           child: Column(
             children: [
               // Icon(Icons.person, color: Color.fromRGBO(255, 255, 255, 1)),
               const SizedBox(height: 15),
               SizedBox(
                 child: Image.asset('assets/images/footer/profile.png'),
               ),
               const SizedBox(height: 15),
               const Text('Profile', style: TextStyle(color: Colors.white,
                 fontSize: 10,
                 fontFamily: 'Poppins',
                 fontWeight: FontWeight.w400,
                 height: 0.10,
                 letterSpacing: 0.30,)),
               const SizedBox(height: 15),
             ],
           ),
         )
        ],
      ),
    );
  }



}
