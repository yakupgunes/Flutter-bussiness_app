// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apss/pages/sales_page.dart';
import 'package:flutter_apss/pages/selling_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Center(
          child: Text(
            "Giriş yapılan hesap: " + user.email!,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(36.0),
            child: Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    ListTile(
                      title: Text("Yeni satış eklemek için tıklayınız."),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SellingPage(),
                                ),
                              );
                            });
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(36.0),
            child: Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    ListTile(
                      title: Text("Yapılan satışları görmek için tıklayınız."),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SalesPage(),
                                ),
                              );
                            });
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      /*GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SellingPage();
              },
            ),
          );
        },
        child: Card(
          margin: EdgeInsets.all(10),
          color: Colors.grey[200],
          shadowColor: Colors.blueGrey,
          elevation: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              ListTile(
                title: Text(
                  "Satış eklemek için tıklayınız.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),*/
      /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Satış eklemek için tıklayınız."),
            MaterialButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SellingPage(),
                    ),
                  );
                });
              },
              color: Colors.deepPurple,
              child: Text("Satış ekranı"),
            ),
          ],
        ),
      ),*/
    );
  }
}
