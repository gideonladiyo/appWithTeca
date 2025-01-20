import 'package:chatapp/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import '../../../service/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout()  {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  leading: Icon(Icons.home, size: 40,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("Settings", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  leading: Icon(Icons.settings, size: 40,),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
                  },
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: Text("Logout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              leading: Icon(Icons.logout, size: 40,),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
