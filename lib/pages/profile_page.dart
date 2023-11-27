import 'package:flutter/material.dart';
import 'package:nansu/pages/home_page.dart';
import 'package:nansu/pages/login_page.dart';
import 'package:nansu/services/auth_service.dart';
import 'package:nansu/shared/constants.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;
  ProfilePage({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50),
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.grey[700],
              ),
              SizedBox(height: 15),
              Text(
                widget.userName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 2,
              ),
              ListTile(
                onTap: () {
                  nextScreenReplace(context, const HomePage());
                },
                leading: Icon(Icons.group),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                title: Text(
                  "Groups",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {},
                selectedColor: Theme.of(context).primaryColor,
                selected: true,
                leading: Icon(Icons.account_circle),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                title: Text("Profile", style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                onTap: () async {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Log Out"),
                          content: Text("Are you sure, You want to log out ?"),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () async {
                                  await authService.signOut();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LogInPage()),
                                      (route) => false);
                                },
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ))
                          ],
                        );
                      });
                },
                leading: Icon(Icons.exit_to_app),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                title: Text("Logout", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.account_circle,
                size: 200,
                color: Colors.grey[700],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Full Name:",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    widget.userName,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
              Divider(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Email Id:",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    widget.email,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
