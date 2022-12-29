// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field, avoid_print, prefer_typing_uninitialized_variables, sort_child_properties_last, unnecessary_const, unnecessary_new, prefer_final_fields, use_build_context_synchronously, unused_local_variable, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
import 'package:flutter/material.dart';
import 'package:flutter_apss/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../class.dart';
import 'sales_page.dart';
import '../variables.dart';

class SellingPage extends StatefulWidget {
  final int? id;
  const SellingPage({Key? key, this.id}) : super(key: key);

  @override
  State<SellingPage> createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  final _formKey = GlobalKey<FormState>();
  var id;
  late String personel, marka, iadeMarka;
  late int fiyat, iadeFiyat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            });
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Satış/İade",
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          children: <Widget>[
            SizedBox(height: 25.0),
            Text(
              "Satış",
              textAlign: TextAlign.left,
              style: (GoogleFonts.bebasNeue(
                fontSize: 30,
                color: Colors.black,
              )),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
                icon: const Icon(
                  Icons.currency_lira,
                  color: Colors.deepPurple,
                ),
                hintText: 'Ürün fiyatını giriniz.',
                labelText: 'Fiyat',
              ),
              onSaved: (deger) {
                fiyat = int.parse(deger ?? "");
              },
            ),
            SizedBox(height: 5.0),
            TextFormField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
                icon: const Icon(
                  Icons.person_search,
                  color: Colors.deepPurple,
                ),
                hintText: 'Satış temsilcisini giriniz',
                labelText: 'Temsilci',
              ),
              onSaved: (deger) {
                personel = deger!;
              },
            ),
            SizedBox(height: 5.0),
            TextFormField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
                icon: const Icon(
                  Icons.add_business,
                  color: Colors.deepPurple,
                ),
                hintText: 'Ürün markasını giriniz.',
                labelText: 'Marka',
              ),
              onSaved: (deger) {
                marka = deger!;
              },
            ),
            SizedBox(height: 25.0),
            Text(
              "İade",
              textAlign: TextAlign.left,
              style: (GoogleFonts.bebasNeue(
                fontSize: 30,
                color: Colors.black,
              )),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
                icon: const Icon(
                  Icons.cached,
                  color: Colors.deepPurple,
                ),
                hintText: 'İade ürün markasını giriniz.',
                labelText: 'İade marka',
              ),
              onSaved: (deger) {
                iadeMarka = deger!;
              },
            ),
            SizedBox(height: 5.0),
            TextFormField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
                icon: const Icon(
                  Icons.currency_lira,
                  color: Colors.deepPurple,
                ),
                hintText: 'İade ürün fiyatını giriniz.',
                labelText: 'İade fiyat',
              ),
              onSaved: (deger) {
                iadeFiyat = int.parse(deger ?? "");
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  backgroundColor: Colors.deepPurple,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: Size(400, 60),
                ),
                onPressed: () {
                  setState(() {
                    const uuid = Uuid();
                    id = uuid.v1();
                  });
                  bool validate = _formKey.currentState!.validate();
                  if (validate) {
                    _formKey.currentState!.save();
                  }
                  String result =
                      "ID:$id\nFiyat:$fiyat\nPersonel:$personel\nMarka:$marka\nİade Marka:$iadeMarka\nİade Fiyat:$iadeFiyat";
                  if (fiyat <= 500) {
                    views["sm"]!.add(
                      SatisListesi(
                        fiyat: fiyat,
                        personel: "${personel}",
                        marka: "${marka}",
                        iadeMarka: "${iadeMarka}",
                        iadeFiyat: iadeFiyat,
                      ),
                    );
                  } else if (fiyat > 500 && fiyat < 3000) {
                    views["md"]!.add(
                      SatisListesi(
                        fiyat: fiyat,
                        personel: "${personel}",
                        marka: "${marka}",
                        iadeMarka: "${iadeMarka}",
                        iadeFiyat: iadeFiyat,
                      ),
                    );
                  } else {
                    views["lr"]!.add(
                      SatisListesi(
                        fiyat: fiyat,
                        personel: "${personel}",
                        marka: "${marka}",
                        iadeMarka: "${iadeMarka}",
                        iadeFiyat: iadeFiyat,
                      ),
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(bottom: 3),
                      backgroundColor: Colors.deepPurple,
                      content: Text(
                        "Satış eklendi!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  );
                  _formKey.currentState!.reset();
                },
                child: Text(
                  "Satışı Onayla",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Satışları görmek için tıklayınız.",
                style: TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.deepPurple,
              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
