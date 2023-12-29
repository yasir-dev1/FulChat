import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Controller.dart';

class HomePage extends StatelessWidget{
  MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.add();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),

      body: Row(
        children: [

          Obx(() => 
          NavigationRail(
            onDestinationSelected: (int index){
              controller.selectedindex.value = index; 

            },
            selectedIndex: controller.selectedindex.value,
            labelType: NavigationRailLabelType.all,
            backgroundColor: Colors.lightBlue,
            destinations: [
              NavigationRailDestination(icon: Icon(Icons.person), label: Text("Profile")),
              NavigationRailDestination(icon: Icon(Icons.people), label: Text("Firends")),
              NavigationRailDestination(icon: Icon(Icons.message), label: Text("Messeges")),
              NavigationRailDestination(icon: Icon(Icons.settings), label: Text("Settings")),
            ],
            selectedIconTheme: IconThemeData(color: Colors.blueGrey), 
            unselectedIconTheme: IconThemeData(color: Colors.white), 
            unselectedLabelTextStyle: TextStyle(color: Colors.white),
            selectedLabelTextStyle: TextStyle(color: Colors.blueGrey),
            
          )
          ),
          VerticalDivider(thickness: 1,width: 2,),
          Obx(() => Expanded(child:  controller.buildPages(controller.selectedindex.value)))
        ],
      ),
      
    );
  }
}


