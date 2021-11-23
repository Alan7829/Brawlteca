// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, avoid_unnecessary_containers

import 'package:brawlteca/bloc/gamemodes_bloc.dart';
import 'package:flutter/material.dart';

class GameModesPages extends StatefulWidget {
  const GameModesPages({Key? key}) : super(key: key);

  @override
  _GameModesPagesState createState() => _GameModesPagesState();
}

class _GameModesPagesState extends State<GameModesPages> {
  final bloc = GameModesBloc();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => bloc.getAll(),
        child: Container(
          color: Color.fromRGBO(26, 56, 102, 1),
          child: Column(
            children: <Widget>[
              SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: <Widget>[
                    StreamBuilder(
                      stream: bloc.gameModesStream,
                      builder:
                          (BuildContext context, AsyncSnapshot<Map> snapshot) {
                        if (!snapshot.hasData) bloc.getAll();
                        if (snapshot.hasData) {
                          final data = snapshot.data!['list'];
                          return Container(
                            height: screen.height * 0.77,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (_, int idx) {
                                if (data[idx]['name'] != 'Training')
                                  return GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 8,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                            width: 2.5,
                                          ),
                                        ),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.bottomCenter,
                                          children: <Widget>[
                                            Container(
                                              child: Image.network(
                                                data[idx]['imageUrl2'],
                                                scale: 1,
                                                width: 336.8,
                                                height: 100,
                                                fit: BoxFit.fill,
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                            Stack(
                                              alignment: AlignmentDirectional
                                                  .bottomCenter,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.all(8),
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Color(
                                                      int.parse(
                                                              data[idx]['color']
                                                                  .substring(
                                                                      1, 7),
                                                              radix: 16) +
                                                          0xFF000000,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    data[idx]['name'],
                                                    style: TextStyle(
                                                      fontFamily: 'nougat',
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                else
                                  return SizedBox();
                              },
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
