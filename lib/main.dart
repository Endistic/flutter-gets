import 'package:flutter/material.dart';
import 'package:getx_state_management/routes/my_route_information_parser.dart';
import 'package:getx_state_management/routes/my_router_delegate.dart';
import 'package:getx_state_management/ui/screen/colorList.dart';
import 'package:getx_state_management/ui/screen/detailScreen.dart';
import 'package:getx_state_management/ui/screen/error_screen.dart';
import 'package:getx_state_management/ui/testView_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(),
      // onGenerateRoute: ((settings) {
      //   String path = settings.name ?? "";
      //   if (path == '/') {
      //     return MaterialPageRoute(builder: (_) => TestPageView());
      //   }

      //   Uri? uri = Uri.tryParse(path);
      //   if (uri != null) {
      //     if (uri.pathSegments.length == 2 &&
      //         uri.pathSegments[0] == 'details') {
      //       var id = uri.pathSegments[1];

      //       return MaterialPageRoute(
      //           builder: (_) => DetailScreen(id: id!),
      //           settings: RouteSettings(name: path));
      //     }
      //   }
      //   return MaterialPageRoute(builder: (_) => const ErrorPathScreen());
      // }),
      // routes: {
      //   '/': (context) => TestPageView(),
      // },
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => TestPageView(),
      //   '/colors': (context) => ColorListScreen()
      // },


    );
  }
}
