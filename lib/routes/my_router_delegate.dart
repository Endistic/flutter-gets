import 'package:flutter/material.dart';
import 'package:getx_state_management/configuration/my_configuration.dart';
import 'package:getx_state_management/constant/my_route.dart';
import 'package:getx_state_management/state/app_state.dart';
import 'package:getx_state_management/ui/screen/colorDetail.dart';
import 'package:getx_state_management/ui/screen/colorList.dart';
import 'package:getx_state_management/ui/screen/error_screen.dart';

// ใข้ 2 class เข้ามาช่วย ChangeNotifier and PopNavigatorRouterDelegateMixin เข้ามา
// Chnagenitifier สามารถ rebuild ได้ใหม่เมื่อ state เปลี่ยนแปลง = stateful
// PopNavigatorRouterDelegateMixin  implementation routing back button

class MyRouterDelegate extends RouterDelegate<MyConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyConfiguration> {
  // กำหนด App State
  late MyAppState state;

  // constructor
  // เพิ่ม addListener เมื่อ App State มีการ update delegate จะมีการ update ด้วย
  MyRouterDelegate() {
    state = MyAppState();
    state.addListener(notifyListeners);
  }

  // หลังจากที่ delegate แล้ว ให้ทำการ dispose เพื่อหยุดการทำงาน
  @override
  void dispose() {
    super.dispose();
    state.removeListener(notifyListeners);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  // getter returns configuration ไปที่ App State จะถูกเรียกหลังจาก build widget แล้วส่งไปยัง restoreRouteInformation in Route Parser
  // เพื่อ Update URL
  @override
  MyConfiguration? get currentConfiguration {
    if (state.isError) {
      return MyConfiguration.unknown();
    } else {
      if (state.color != null) {
        return MyConfiguration.details(colorItem: state.color!);
      }
      return MyConfiguration.home();
    }
  }

  bool _handlePopPage(Route route, result) {
    Page page = result.settings as Page;

    if (page.key == ValueKey("page_home")) {
      return false;
    }

    route.didPop(result);

    if (page.key == ValueKey("page_color_detail")) {
      state.color = null;
      return true;
    }

    if (page.key == ValueKey("page_error")) {
      state.color = null;
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: ((route, result) => _handlePopPage(route, result)),
      pages: [
        MaterialPage(
            key: const ValueKey('page_home'),
            child: ColorListScreen(
              onColorItemSelected: (colorItem) {
                state.color = colorItem;
              },
            )),
        if (state.color != null)
          MaterialPage(
              key: const ValueKey('page_color_detail'),
              child: ColorDetailScreen(colorItem: state.color!)),
        if (state.isError)
          const MaterialPage(
              key: ValueKey('page_error'), child: ErrorPathScreen())
      ],
    );
  }

  // เรียกเมื่อมีการเข้าถึง Route โดยตรง ต่างจาก
  @override
  Future<void> setNewRoutePath(MyConfiguration congifuration) async {
    if (congifuration.isKnown) {
      if (congifuration.route == MyRoutes.HOME) {
        state.isError = false;
        state.color = null;
        return;
      } else if (congifuration.route == MyRoutes.DETAIL) {
        Map<String, dynamic> arguments = congifuration.arguments;
        if (arguments.containsKey("color")) {
          var colorItem = arguments["color"];
          if (colorItem != null) {
            state.isError = false;
            state.color = colorItem;
            return;
          }
        }
      }
    }
    state.isError = true;
    state.color = null;
  }
}
