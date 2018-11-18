// My
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../routes/AppNavigator.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),  // 设置背景颜色
      child: Center(
        child: RaisedButton(
          child: Text('点击跳转到home'),
          onPressed: () => navigator.navigateTo(context, '/cmdbHome'),
        ),
      ),
    );
  }
}
