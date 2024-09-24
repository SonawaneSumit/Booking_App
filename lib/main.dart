// import 'package:booking_app/screen/LoginPage/Login_page.dart';
import 'package:booking_app/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const Myapp());

  WidgetsFlutterBinding.ensureInitialized();
  // it's help for some time we get white screen when app start, and now we not facing this problen
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.blueAccent,
            elevation: 15,
          )),
      debugShowCheckedModeBanner: false,
      title: 'E-Booking',
      home: const splashscreen(),
      // home: login_page(),
    );
  }

  // @override
  // HttpClient createHttpClient(SecurityContext? context) {
  //   return super.createHttpClient(context)
  //     ..badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  // }
}
