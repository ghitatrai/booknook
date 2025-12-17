import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/auth/presentation/pages/login_page.dart';
import 'package:booknoke/features/shared/presentation/pages/intro_screens/intro1.dart';
import 'package:booknoke/features/shared/presentation/pages/intro_screens/intro2.dart';
import 'package:booknoke/features/shared/presentation/pages/intro_screens/intro3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
 OnbordingScreen({super.key});
 @override
 _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [PageView(
          controller: _controller,
          onPageChanged: (index){
            setState(() {
              onLastPage = (index==2);
            });
          },
        children: [
         Intro1(),
         Intro2(),
          Intro3(),
        ],
      ),


      Container(
              //skip
        alignment: Alignment(0,0.75 ),
      //dots indicator
child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          GestureDetector(
            onTap: () { _controller.jumpToPage(2);},
            child: Text("Skip")),
             SmoothPageIndicator(
                       controller: _controller, count: 3, 
             ),
             onLastPage ?
             GestureDetector
             (
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                },
              child: Text("Done")):  GestureDetector
             (
                onTap: () { _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);},
              child: Text("Next"))
           ] ,
           // nex t or done

      ))]
      ,
       
      )
    );
    
  }
}