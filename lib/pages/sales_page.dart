// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:flutter_apss/pages/home_page.dart';
import 'package:flutter_apss/variables.dart';
import 'package:google_fonts/google_fonts.dart';

class SaleList extends StatelessWidget {
  const SaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SalesPage(),
    );
  }
}

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  List<Tab> _tabs = [
    const Tab(
      text: ("Küçük Satışlar"),
    ),
    const Tab(
      text: ("Orta Satışlar"),
    ),
    const Tab(
      text: ("Büyük Satışlar"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              labelColor: Colors.white,
              tabs: _tabs,
            ),
            title: Text(
              "SATIŞ LİSTESİ",
              style: GoogleFonts.bebasNeue(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            elevation: 2,
            leading: GestureDetector(
              child: IconButton(
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
            ), //const BackButton(color: Colors.black),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: views["sm"]?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Sil"),
                                      content: const Text(
                                        "Yapılan satışı silmek istediğinize emin misiniz?",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      actions: [
                                        InkWell(
                                          child: const Text(
                                            "Hayır",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            return Navigator.pop(context);
                                          },
                                        ),
                                        const SizedBox(height: 10.0),
                                        InkWell(
                                          child: const Text(
                                            "Evet",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              views["sm"]!.removeAt(index);
                                              return Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                          );
                        },
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        "Ürün fiyatı: "
                        "${views["sm"]![index].fiyat} TL\n"
                        "Personel bilgisi: "
                        "${views["sm"]![index].personel}\n"
                        "Ürün markası: "
                        "${views["sm"]![index].marka}\n"
                        "İade ürün markası: "
                        "${views["sm"]![index].iadeMarka}\n"
                        "İade ürün fiyatı: "
                        "${views["sm"]![index].iadeFiyat} TL\n",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }),
              ListView.builder(
                  itemCount: views["md"]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Sil"),
                                      content: const Text(
                                        "Yapılan satışı silmek istediğinize emin misiniz?",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      actions: [
                                        InkWell(
                                          child: const Text(
                                            "Hayır",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            return Navigator.pop(context);
                                          },
                                        ),
                                        const SizedBox(height: 10.0),
                                        InkWell(
                                          child: const Text(
                                            "Evet",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              views["md"]!.removeAt(index);
                                              return Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                          );
                        },
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        "Ürün fiyatı: "
                        "${views["md"]![index].fiyat} TL\n"
                        "Personel bilgisi: "
                        "${views["md"]![index].personel}\n"
                        "Ürün markası: "
                        "${views["md"]![index].marka}\n"
                        "İade ürün markası: "
                        "${views["md"]![index].iadeMarka}\n"
                        "İade ürün fiyatı: "
                        "${views["md"]![index].iadeFiyat} TL\n",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }),
              ListView.builder(
                  itemCount: views["lr"]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Sil"),
                                      content: const Text(
                                        "Yapılan satışı silmek istediğinize emin misiniz?",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      actions: [
                                        InkWell(
                                          child: const Text(
                                            "Hayır",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            return Navigator.pop(context);
                                          },
                                        ),
                                        const SizedBox(height: 10.0),
                                        InkWell(
                                          child: const Text(
                                            "Evet",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              views["lr"]!.removeAt(index);
                                              return Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                          );
                        },
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        "Ürün fiyatı: "
                        "${views["lr"]![index].fiyat} TL\n"
                        "Personel bilgisi: "
                        "${views["lr"]![index].personel}\n"
                        "Ürün markası: "
                        "${views["lr"]![index].marka}\n"
                        "İade ürün markası: "
                        "${views["lr"]![index].iadeMarka}\n"
                        "İade ürün fiyatı: "
                        "${views["lr"]![index].iadeFiyat} TL\n",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
