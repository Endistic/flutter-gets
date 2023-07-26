import 'package:flutter/material.dart';
import 'package:getx_state_management/configuration/my_configuration.dart';
import 'package:getx_state_management/constant/my_route.dart';
import 'package:getx_state_management/model/color_item.dart';

import '../data/color_data.dart';

class MyRouteInformationParser extends RouteInformationParser<MyConfiguration> {
  @override
  Future<MyConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    var uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'colors') {
      ColorItem? colorItem = ColorData.getByTitle(uri.pathSegments[1]);
      if (colorItem != null) {
        return MyConfiguration(
            route: MyRoutes.DETAIL, arguments: {"color": colorItem});
      }
    }
    return MyConfiguration.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(MyConfiguration route) {
    if (route.isKnown) {
      if (route.route == MyRoutes.HOME) {
        return const RouteInformation(location: "/");
      }

      if (route.route == MyRoutes.DETAIL) {
        if (route.arguments.containsKey("color")) {
          ColorItem? colorItem = route.arguments["color"];
          if (colorItem != null) {
            return RouteInformation(location: "/colors/${colorItem.title}");
          }
        }
      }
    }
    return const RouteInformation(location: "/error");
  }
}
