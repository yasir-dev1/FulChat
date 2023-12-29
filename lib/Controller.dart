import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:enum_to_string/enum_to_string.dart';


enum State { Online, idle, DoNotDistrub}


class Firend {
  String? username;
  State? state;

  Firend({required this.username,this.state});
}



class MainController extends GetxController{
  Firend firnd =Firend(state:State.Online, username: 'Ahmet');
  Firend firnd2 =Firend(state:State.idle, username: 'Mahmut');
  Firend firnd3 =Firend(state:State.DoNotDistrub, username: 'Nothing');
  var FirendsList = <Firend> [];
  
  var selectedindex = 0.obs;
  void add(){
    FirendsList.add(firnd); 
    FirendsList.add(firnd2); 
    FirendsList.add(firnd3); 
  }
  Widget  buildPages(index){
    switch (index) {
      case 0:
        return Profile();
      case 1:
        return Firends();
      case 2:
        return Masseges();
      case 3:
        return Settings();
      
      default:
        return Profile(); 
    }
    
  }

}

// Pages :

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:Text("Profile"));
  }
}
class Firends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:Text("Firends"));
  }
}
class Masseges extends StatelessWidget {
  MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var selectedFirend = 0.obs;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child:
        ListView.builder(
          itemCount:controller.FirendsList.length,
          itemBuilder: ((context, index) {
            
            var firend = controller.FirendsList[index];
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.amber),
              title: Text(firend.username.toString()),
              subtitle: Text("last Massege"),
              trailing: Text(EnumToString.convertToString(firend.state)),
              onTap: () {
                selectedFirend.value = index  ;
              },
            );
          }
          )
          )
          ),
        
          Expanded(
            flex: 4,
            child: Column(children: [
            Expanded(
              flex: 1,
              child: 
           Obx (() => ListTile(
              hoverColor: Colors.white10,
              leading: CircleAvatar(backgroundColor: Colors.amber),
              title: Text(controller.FirendsList[selectedFirend.value].username.toString()),
              trailing: Wrap(
                spacing: 12,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.call)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.video_call))
                ],
              ),
              
            )
            )
            ),
            Expanded(
              flex: 11,
              child: 
            Container(
              color: const Color.fromARGB(255, 196, 196, 196),
            )),
             Expanded(
              flex: 1,
              child: 
            Container(
              child: Row(children: [
                Expanded(child: IconButton(onPressed:(){}, icon: Icon(Icons.image))),
                Expanded(flex:4,child: TextField(),),
                Expanded(child: IconButton(onPressed:(){}, icon: Icon(Icons.send)))
              ]),
            )),


          ],))
      ],
    );
  }
}
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:Text("Settings"));
  }
}