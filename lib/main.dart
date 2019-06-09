import 'package:flutter/material.dart';
import 'bloc/AirBloc.dart';
import 'models/air_result.dart';

/**
 * 미세먼지 앱 메인화면
 */
void main() => runApp(MyApp());

final airBloc = AirBloc();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<AirResult>(
          stream: airBloc.airResult,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return buildBody(snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }

  Widget buildBody(AirResult result) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '현재 위치 미세먼지',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      //여백 주기
                      height: 16,
                    ),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              //글 간격을 공간을 두고 띄움
                              children: <Widget>[
                                Image.network(
                                    'http://file.instiz.net/data/file/20120828/2/2/5/225d696edd27b7044443ee8b7af6eba8',
                                    width: 40),
                                Text(
                                  '${result.data.current.pollution.aqius}',
                                  style: TextStyle(fontSize: 40),
                                ),
                                Text(
                                  getString(result),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            color: getColor(result),
                            padding: const EdgeInsets.all(8.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              //글 간격을 공간을 두고 띄움
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Image.network(
                                      'https://airvisual.com/images/${result.data.current.weather.ic}.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      '${result.data.current.weather.tp}°',
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                                Text(
                                    '습도 ${result.data.current.weather.hu}%'),
                                Text(
                                    '풍속 ${result.data.current.weather.ws}m/s'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      //여백 주기
                      height: 16,
                    ),
                    ClipRRect(
                      //모서리를 둥글게 해주는 위젯
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 50), //버튼에 여백 주기
                        color: Colors.orange,
                        child: Icon(Icons.refresh, color: Colors.white),
                        onPressed: () {
                          airBloc.fetch();
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
  }

  Color getColor(AirResult result) {
    if (result.data.current.pollution.aqius <= 50) {
      return Colors.greenAccent;
    } else if (result.data.current.pollution.aqius <= 100) {
      return Colors.yellow;
    } else if (result.data.current.pollution.aqius <= 150) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getString(AirResult result) {
    if (result.data.current.pollution.aqius <= 50) {
      return '좋음';
    } else if (result.data.current.pollution.aqius <= 100) {
      return '보통';
    } else if (result.data.current.pollution.aqius <= 150) {
      return '나쁨';
    } else {
      return '최악';
    }
  }
}
