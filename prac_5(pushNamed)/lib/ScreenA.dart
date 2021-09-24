import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/b');  // pushNamed의 context는 ScreenA의 context, routeName은 main에서 선언한 이동할 route를 지정하면 된다.
                },
                child: Text('Go to ScreenB')),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/c');
                },
                child: Text('Go to ScreenC'))
          ],
        ),
      ),
    );
  }
}
