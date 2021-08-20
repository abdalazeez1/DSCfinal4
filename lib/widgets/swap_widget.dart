import 'package:flutter/material.dart';

class Swap extends StatelessWidget {
  final Function? swap;
  final bool? isLogin;

  Swap({this.swap, this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isLogin! ? 'if you haven\'t account?':'already have account',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
        TextButton(
            child: Text(
              !isLogin! ? 'LogIN' : 'Signup',
              softWrap: false,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                  fontSize: 12),
            ),
            onPressed: () => swap!(!isLogin!))
      ],
    );
  }
}
