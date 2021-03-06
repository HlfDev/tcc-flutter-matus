import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:matus_app/app/controllers/user_controller.dart';
import 'package:matus_app/app/themes/app_colors.dart';
import 'package:matus_app/routes.dart';
import 'package:provider/provider.dart';
import 'app/controllers/announcement_controller.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserController(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_) => AnnouncementController(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
          title: 'Matus',
          theme: ThemeData(
            iconTheme: const IconThemeData(color: AppColor.primaryColor),
            primarySwatch: AppColor.primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
