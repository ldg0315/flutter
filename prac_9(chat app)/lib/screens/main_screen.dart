import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/config/palette.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation(){
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/red.jpg'),
                      fit: BoxFit.fill
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                            text: 'Welcome',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white
                            ),
                            children: [
                              TextSpan(
                                text: isSignupScreen ? 'to Yummy chat!' : ' back',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        isSignupScreen ? 'Signup to continue' : 'Signup to continue',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 배경
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                padding: EdgeInsets.all(20.0),
                height: isSignupScreen ? 280.0 : 250.0,
                width: MediaQuery.of(context).size.width-40, // 미디어 쿼리로 인해 항상 좌우여백 20pixel을 유지할 수 있다. (핸드폰을 90도 기울여도 동일)
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(  // 테두리 그림자 효과
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:!isSignupScreen ? Palette.activeColor : Palette.textColor1
                                  ),
                                ),
                                if(!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen? Palette.activeColor : Palette.textColor1
                                  ),
                                ),
                                if(isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      if(isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20), // textfield와 상위 column간의 간격
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(1), // state가 뒤엉키는 것을 방지 (입력한 textform을 이동하면 초기화)
                                validator: (value){
                                  if(value!.isEmpty || value.length < 4){
                                    return 'Please enter at least 4 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userName = value!;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(  // textfield에 포커스 되있어도 outlineinputborder 형태 유지
                                    borderSide: BorderSide(
                                        color: Palette.textColor1
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                    color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10) // textfield size
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                key: ValueKey(2),
                                validator: (value){
                                  if(value!.isEmpty || !value.contains('@')){
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userEmail = value!;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(  // textfield에 포커스 되있어도 outlineinputborder 형태 유지
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'email',
                                    hintStyle: TextStyle(
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10) // textfield size
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                key: ValueKey(3),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6){
                                    return 'Password must be at least 7 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userPassword = value!;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(  // textfield에 포커스 되있어도 outlineinputborder 형태 유지
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10) // textfield size
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if(!isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(4),
                                validator: (value){
                                  if(value!.isEmpty || !value.contains('@')){
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userEmail = value!;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(  // textfield에 포커스 되있어도 outlineinputborder 형태 유지
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'email',
                                    hintStyle: TextStyle(
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10) // textfield size
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                key: ValueKey(5),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6){
                                    return 'Password must be at least 7 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userPassword = value!;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Palette.iconColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(  // textfield에 포커스 되있어도 outlineinputborder 형태 유지
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10) // textfield size
                                ),
                              ),
                            ],

                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ),
            ),
            // 텍스트 폼 필드
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen ? 430 : 390,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: GestureDetector(
                    onTap: (){
                      _tryValidation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.red
                            ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 전송버튼
            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignupScreen ? MediaQuery.of(context).size.height-125 : MediaQuery.of(context).size.height-165,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(isSignupScreen ? 'or Signup with' : 'or Signin with'),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                        onPressed: () {

                        },
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(155, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: Palette.googleColor
                        ),
                        icon: Icon(Icons.add),
                        label: Text('Google'),
                    ),
                  ],
                )),
            // google login button
          ],
        ),
      ),
    );
  }
}