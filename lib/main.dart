import 'package:dsc_final4/data/provdier_product.dart';
import 'package:dsc_final4/screen/layout_screen.dart';
import 'package:dsc_final4/screen/sign_screen.dart';
import 'package:dsc_final4/screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ProviderProducts(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (ctx, snapshotauth) {
                  if (snapshotauth.connectionState == ConnectionState.waiting) {
                    return SplashScreen();
                  } else if (snapshotauth.hasData) {
                    return LayoutScreen();
                  } else {
                    return SignScreen();
                  }
                },
              );
            }else
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('Could not load app'),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: Text('no data please try another time'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
