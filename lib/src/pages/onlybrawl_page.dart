import 'package:flutter/material.dart';
import 'package:brawlteca/bloc/onlybrawl_bloc.dart';
import 'package:brawlteca/widgets/text_border.dart';

class OnlyBrawl extends StatefulWidget {
  const OnlyBrawl({Key? key}) : super(key: key);

  @override
  _OnlyBrawlState createState() => _OnlyBrawlState();
}

class _OnlyBrawlState extends State<OnlyBrawl> {
  final bloc = OnlyBrawlerBloc();
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => bloc.getone(16000000),
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          color: Color.fromRGBO(26, 56, 102, 1),
          child: Column(
            children: <Widget>[
              Text(
                'Informacion Individual',
                style: TextStyle(
                  color: Color.fromRGBO(250, 188, 59, .8),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "nougat",
                ),
              ),
              SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: <Widget>[
                    StreamBuilder(
                      stream: bloc.brawlersStream,
                      builder:
                          (BuildContext context, AsyncSnapshot<Map> snapshot) {
                        if (!snapshot.hasData) bloc.getone(16000000);
                        if (snapshot.hasData) {
                          final data = snapshot.data!['name'];

                          return Container(
                            height: screen.height * 0.698,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (_, int idx) {
                                // int _brawlId = data[idx]['id'];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(14, 95, 176, 1),
                                    border: Border.all(
                                      color: Color.fromRGBO(2, 28, 108, 1),
                                      style: BorderStyle.solid,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'star power: ' + data[idx]['name'],
                                          style: TextStyle(
                                              fontFamily: "nougat",
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        //  Text(
                                        //   'gadget: '+dataGadget[idx]['name'],
                                        //   style: TextStyle(
                                        //     fontFamily: "nougat",
                                        //     fontSize: 20,
                                        //     color: Colors.white
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
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
