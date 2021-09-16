import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // appbar의 빨간 debug표시 제거
      title: 'BBANTO',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('BBANTO'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //
          children: [
            Center(
              child: CircleAvatar(      // 원모양의 위젯, 또한 circleavatar 위젯을 클릭하면 전구 표시가 뜨고 wrap with center를 클릭해주면 중앙으로 정렬
                backgroundImage: AssetImage('assets/flying.png'),
                radius: 60.0,   // circle 크기
              ),
            ),
            Divider( // 구분선
              height: 60.0, // Divider의 위쪽 아래쪽으로 30.0씩
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0, // Divider 선이 끝에서 부터 어느정도 떨어져야 할지 지정
            ),
            Text('NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0, // 글자 간 간격
              ),
            ),
            SizedBox(       // 텍스트위젯 간 간격
              height: 10.0,
            ),
            Text('BBANTO',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(       // 텍스트위젯 간 간격
              height: 30.0,
            ),
            Text('BBANTO POWER LEVEL',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('14',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(          // 가로로 위젯 정렬
              children: [
                Icon(Icons.check_circle_outline),    // 아이콘 위젯, 다양한 아이콘 선택 가능
                SizedBox(
                  width: 10.0,
                ),
                Text('using lightsaber',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0
                ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('face hero tattoo',
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('fire flames',
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images.jpeg'),
                radius: 40.0,
                backgroundColor: Colors.amber[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
