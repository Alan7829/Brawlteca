// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:brawlteca/bloc/onlybrawl_bloc.dart';
import 'package:brawlteca/widgets/text_border.dart';
import 'package:translator/translator.dart';

class OnlyBrawl extends StatefulWidget {
  const OnlyBrawl({Key? key}) : super(key: key);

  @override
  _OnlyBrawlState createState() => _OnlyBrawlState();
}

class _OnlyBrawlState extends State<OnlyBrawl> {
  GoogleTranslator translator = GoogleTranslator();
  final bloc = OnlyBrawlerBloc();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 56, 102, 1),
      body: RefreshIndicator(
        onRefresh: () => bloc.getone(args),
        child: Stack(
          children: <Widget>[
            StreamBuilder(
              stream: bloc.brawlersStream,
              builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                if (!snapshot.hasData) bloc.getone(args);
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  final dataGadget = snapshot.data!['gadgets'];
                  final list = data['starPowers'] as List;
                  final listGadgets = data['gadgets'] as List;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 40,
                        left: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Positioned(
                        top: 90,
                        left: 20,
                        child: Text(
                          data['name'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'nougat',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        left: 20,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                            child: Text(
                              'Class, ' + data['class']['name'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      Positioned(
                        top: screen.height * 0.12,
                        right: -55,
                        child: Image.asset(
                          'assets/brawl.png',
                          height: 200,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: screen.width,
                          height: screen.height * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 30),
                                //nombre
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: screen.width * 0.3,
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: screen.width * 0.3,
                                          child: Text(
                                            data['name'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                //rareza
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: screen.width * 0.3,
                                        child: Text(
                                          'Rarity',
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: screen.width * 0.3,
                                        child: Text(
                                          data['rarity']['name'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //starpower
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: screen.width * 0.275,
                                        child: Text(
                                          'Star-Powers',
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: screen.width * 1,
                                        child: Row(
                                          children: <Widget>[
                                            if (list.isEmpty)
                                              Text(
                                                'Without starpower now',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.red[300],
                                                ),
                                              )
                                            else
                                              for (var item in list)
                                                Card(
                                                  color: Colors.blueAccent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  margin: EdgeInsets.all(3),
                                                  elevation: 10,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 5.0,
                                                          right: 2.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        item['name'],
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Image.network(
                                                        item['imageUrl'],
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 5.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //Gadgets
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: screen.width * 0.187,
                                        child: Text(
                                          'Gadgets',
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: screen.width * 1,
                                        child: Row(
                                          children: <Widget>[
                                            if (listGadgets.isEmpty)
                                              Text(
                                                'Without gadgets now',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.red[300],
                                                ),
                                              )
                                            else
                                              for (var item in listGadgets)
                                                Card(
                                                  color: Colors.blueAccent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  margin: EdgeInsets.all(2),
                                                  elevation: 10,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 5.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        item['name'] + " ",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Image.network(
                                                        item['imageUrl'],
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 5.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //description
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: screen.width * 0.3,
                                        child: Text(
                                          'Description',
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: screen.width * 0.9,
                                        child: Text(
                                          data['description'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: (screen.height * 0.235),
                        left: (screen.width / 2) - 100,
                        child: ClipOval(
                          child: Image.network(
                            data['imageUrl'],
                            alignment: Alignment.center,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _circle1() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(72, 189, 150, 1),
      ),
    );
  }
}
