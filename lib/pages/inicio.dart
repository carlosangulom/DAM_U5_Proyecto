import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:mrx_charts/mrx_charts.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          Container(
            height: 150,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff6b9080),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 204, 203, 203),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Row(
              children: [
                const Column(
                  children: [
                    Text(
                      "¡Hola, Carlos!",
                      style: TextStyle(
                          fontFamily: "Aubrey",
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "31/05/2023",
                      style: TextStyle(
                          fontFamily: "Aubrey",
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                SimpleCircularProgressBar(
                  mergeMode: true,
                  progressColors: const [Color.fromARGB(255, 217, 242, 222), Color(0xff98c9a3)],
                  onGetText: (double value) {
                    return Text(
                      '${value.toInt()}%\n kcal',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Aubrey"),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Comidas del dia",
                      style: TextStyle(
                          fontFamily: "Aubrey",
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ],
                ),
              ],
            ),
          ),
          FlutterCarousel(
            options: CarouselOptions(
                height: 150, showIndicator: false, enableInfiniteScroll: true),
            items: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 5),
                  margin:
                      const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffcfe1b9),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.goya.com/media/3805/huevos-rancheros.jpg?quality=80"),
                          fit: BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 204, 203, 203),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff6b9080),
                            ),
                            child: const Text(
                              'Desayuno',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontFamily: "DreamOrphans"),
                            ),
                          ),
                          const Spacer(flex: 1,),
                          IconButton(
                            icon: const Icon(Icons.change_circle_rounded),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xff6b9080),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: const Text(
                          'Huevos Rancheros Fit',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontFamily: "Aubrey"),
                        ),
                      )
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffcfe1b9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 204, 203, 203),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: const Text(
                    'Colación',
                    style: TextStyle(fontSize: 16.0),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffcfe1b9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 204, 203, 203),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: const Text(
                    'Comida',
                    style: TextStyle(fontSize: 16.0),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffcfe1b9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 204, 203, 203),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: const Text(
                    'Colación',
                    style: TextStyle(fontSize: 16.0),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffcfe1b9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 204, 203, 203),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: const Text(
                    'Cena',
                    style: TextStyle(fontSize: 16.0),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Estadisticas",
                      style: TextStyle(
                          fontFamily: "Aubrey",
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 200,
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 200.0,
                    maxWidth: 600.0,
                  ),
                  child: Chart(
                    layers: layers(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12.0).copyWith(
                      bottom: 12.0,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<ChartLayer> layers() {
    return [
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.0,
            max: 20.0,
            min: 1.0,
            textStyle: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 250.0,
            max: 2500.0,
            min: 1000,
            textStyle: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => value.toInt().toString(),
        labelY: (value) => '${value.toInt().toString()}kcal',
      ),
      ChartBarLayer(
        items: List.generate(
          13 - 7 + 1,
          (index) => ChartBarDataItem(
            color: const Color(0xff98c9a3),
            value: Random().nextInt(1480) + 1020,
            x: index.toDouble() + 1,
          ),
        ),
        settings: const ChartBarSettings(
          thickness: 10.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ];
  }
}
