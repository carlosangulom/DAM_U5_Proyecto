import 'package:flutter/material.dart';
import 'package:collection_picker/collection_picker.dart';

import '../services/firebase_services.dart';
import 'package:dam_u5_proyecto/services/auth_service.dart';

class Comidas extends StatefulWidget {
  const Comidas({super.key});

  @override
  State<Comidas> createState() => _HomComidasState();
}

class _HomComidasState extends State<Comidas> {
  AuthService authService = AuthService();

  Color _getColor(String tipo) {
    switch (tipo) {
      case "Desayuno":
        {
          return const Color(0xffa09ebb);
        }
      case "Comida":
        {
          return const Color(0xfff7b267);
        }
      case "Cena":
        {
          return const Color(0xff5fa8d3);
        }
      case "Colaciones":
        {
          return const Color(0xff6d597a);
        }
      default:
        {
          return const Color(0xff6b9080);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllComidas(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  title: const Text(
                    "balance",
                    style: TextStyle(fontFamily: "DreamOrphans", fontSize: 42),
                  ),
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                  centerTitle: true,
                  leading: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/home");
                      }),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.chat_rounded),
                      onPressed: () {
                        Navigator.pushNamed(context, "/chat");
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ]),
              body: Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, left: 10, right: 10),
                child: ListView(
                  children: [
                    ListViewPicker(
                      type: PickerType.multiple,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separator: const SizedBox(
                        height: 10,
                      ),
                      data: snapshot.data!.toList(),
                      initialValue: snapshot.data![0],
                      itemBuilder: (item) {
                        switch (item.data["tipo"]) {
                          case "Separador":
                            {
                              return Container(
                                  height: 170,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(top: 5),
                                  margin: const EdgeInsets.only(
                                      right: 8.0, left: 8.0, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffcfe1b9),
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(item.data["imagen"]),
                                          fit: BoxFit.cover),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 204, 203, 203),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Container(
                                          height: 70,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          decoration: const BoxDecoration(
                                              color: Color(0xffa09ebb),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${item.data["nombre"]}",
                                                style: const TextStyle(
                                                    fontSize: 32.0,
                                                    color: Colors.white,
                                                    fontFamily: "Aubrey"),
                                              )
                                            ],
                                          ))
                                    ],
                                  ));
                            }
                          default:
                            {
                              return Container(
                                  height: 170,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(top: 5),
                                  margin: const EdgeInsets.only(
                                      right: 8.0, left: 8.0, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffcfe1b9),
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(item.data["imagen"]),
                                          fit: BoxFit.cover),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 204, 203, 203),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color:
                                                  _getColor(item.data["tipo"]),
                                            ),
                                            child: Text(
                                              '${item.data["tipo"]}',
                                              style: const TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white,
                                                  fontFamily: "DreamOrphans"),
                                            ),
                                          ),
                                          const Spacer(
                                            flex: 1,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color:
                                                  _getColor(item.data["tipo"]),
                                            ),
                                            child: Text(
                                              '${item.data["contenidocal"]}kcal',
                                              style: const TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white,
                                                  fontFamily: "DreamOrphans"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Container(
                                          height: 70,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          decoration: BoxDecoration(
                                              color:
                                                  _getColor(item.data["tipo"]),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${item.data["nombre"]}",
                                                style: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white,
                                                    fontFamily: "Aubrey"),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ));
                            }
                        }
                      },
                      onChanged:
                          (context, item, selectedItem, selectedListItem) {},
                    )
                  ],
                ),
              ));
        }
      },
    );
  }
}
