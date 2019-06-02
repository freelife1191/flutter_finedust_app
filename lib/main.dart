import 'package:flutter/material.dart';

/**
 * 미세먼지 앱 메인화면
 */
void main() => runApp(MyApp());

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
      body: Padding(
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //글 간격을 공간을 두고 띄움
                        children: <Widget>[
                          Text('얼굴사진'),
                          Text(
                            '80',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            '보통',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      color: Colors.yellow,
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //글 간격을 공간을 두고 띄움
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('이미지'),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                '11°',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          Text('습도 100%'),
                          Text('풍속 5.7m/s'),
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
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}