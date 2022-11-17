// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field, avoid_print, prefer_typing_uninitialized_variables, sort_child_properties_last, unnecessary_const, unnecessary_new, prefer_final_fields
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_apss/iade.dart';

class SellingPage extends StatefulWidget {
  const SellingPage({super.key});

  @override
  State<SellingPage> createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  var selectedType;
  bool _iadeVarMi = false;
  final _formKey = GlobalKey<FormState>();
  List<String> _marka = <String>["Atiker", "Varta", "Mutlu ", "İnci", "Bosch"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: Text(
            "Satış/İade",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
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
                    color: Colors.black,
                  ),
                  hintText: 'Fiyat Giriniz',
                  labelText: 'Fiyat',
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.person_search,
                    size: 25.0,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10.0),
                  DropdownButton(
                    items: _marka
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (selectedMarkaType) {
                      print('$selectedMarkaType');
                      setState(() {
                        selectedType = selectedMarkaType;
                      });
                    },
                    value: selectedType,
                    isExpanded: false,
                    hint: Text(
                      'Satış Personeli',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.add_business,
                    size: 25.0,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10.0),
                  DropdownButton(
                    items: _marka
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (selectedMarkaType) {
                      print('$selectedMarkaType');
                      setState(() {
                        selectedType = selectedMarkaType;
                      });
                    },
                    value: selectedType,
                    isExpanded: false,
                    hint: Text(
                      'Marka Seçiniz',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              InkWell(
                child: Text(
                  "İade var mı?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  setState(() {});
                },
              ),
              /*CheckboxListTile(
                activeColor: Colors.black,
                value: _iadeVarMi,
                onChanged: (value) {
                  setState(() {
                    _iadeVarMi = !_iadeVarMi;
                  });
                },
                title: Text(
                  "İade var mı?",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),*/
              /*StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("personel")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      const Text("Loading.....");
                    else {
                      List<DropdownMenuItem> personelItems = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        personelItems.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.documentID,
                              style: TextStyle(color: Color(0xff11b719)),
                            ),
                            value: "${snap.documentID}",
                          ),
                        );
                      }
                      var selectedPersonel;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.alarm,
                              size: 25.0, color: Color(0xff11b719)),
                          SizedBox(width: 50.0),
                          DropdownButton(
                            items: personelItems,
                            onChanged: (personelValue) {},
                            value: selectedPersonel,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Currency Type",
                              style: TextStyle(color: Color(0xff11b719)),
                            ),
                          ),
                        ],
                      );
                    }
                  }),*/
              SizedBox(
                height: 30.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      bool validate = _formKey.currentState!.validate();
                      if (validate) {
                        _formKey.currentState!.save();
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.amber,
                          content: Text(
                            "Yapılan Satış: $selectedType",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                      _formKey.currentState!.reset();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.amber,
                    ),
                    child: Text(
                      "Satışı Onayla",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
