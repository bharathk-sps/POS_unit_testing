import 'package:flutter/material.dart';
import 'package:poc_unit_test/services/auth_services.dart';
import 'package:poc_unit_test/views/authentication/auth_wrapper.dart';
import 'package:poc_unit_test/views/widgets.dart/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.userName}) : super(key: key);
  final String? userName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
AuthService authService = AuthService.instance;




  List<String> images = [
    "https://images.pexels.com/photos/9554219/pexels-photo-9554219.jpeg?cs=srgb&dl=pexels-nikolai-lapshin-9554219.jpg&fm=jpg",
    "https://images.pexels.com/photos/9459781/pexels-photo-9459781.jpeg?cs=srgb&dl=pexels-leticia-azevedo-9459781.jpg&fm=jpg",
    "https://images.pexels.com/photos/2456348/pexels-photo-2456348.jpeg?cs=srgb&dl=pexels-dids-2456348.jpg&fm=jpg",
    "https://images.pexels.com/photos/1343337/pexels-photo-1343337.jpeg?cs=srgb&dl=pexels-gagan-cambow-1343337.jpg&fm=jpg",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${widget.userName ?? "User Name"}!"),
            const SizedBox(
              height: 8.0,
            ),
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  showloadingDialog(context);
                  await authService.setAuthState("").then((value) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AuthWrapper()));
                  });
                },
                child: const Text("Log out")),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 300.0,
            width: double.infinity,
            child: Card(
              child: Image(
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset("assets/images/placeholder.png"),
                image: NetworkImage(images[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
