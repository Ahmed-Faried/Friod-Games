import 'package:flutter/material.dart';
import 'package:lordicon/lordicon.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {



    var controller = IconController.assets('assets/Icons/Icon1.json');

    controller.addStatusListener((status) {



      if ( status == ControllerStatus.completed ) {
        controller.playFromBeginning();
      }
      if ( status == ControllerStatus.ready ) {
        controller.play();

      }
    });


    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text("Sorry The game is intended for the phone only , \n please wait for the deskTop to be updated . \n Thank you" ,textAlign: TextAlign.center,)),
          const SizedBox(height: 30,),
          Center(
            child: IconViewer(
              controller: controller,
              width: 75,
              height: 75,
            ),
          ),
        ],
      ),
    );
  }
}
