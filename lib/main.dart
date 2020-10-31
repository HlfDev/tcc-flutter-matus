import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:matus_app/app/models/announcement.dart';
import 'package:matus_app/app/models/user_manager.dart';
import 'package:matus_app/app/themes/app_colors.dart';
import 'package:provider/provider.dart';
import 'app/models/announcement_manager.dart';
import 'app/screens/announcement/announcement_edit_screen.dart';
import 'app/screens/announcement/announcement_open_screen.dart';
import 'app/screens/base/main_screen.dart';

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
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => AnnouncementManager(),
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
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/announcement_edit':
                return MaterialPageRoute(
                    builder: (_) => AnnouncementEditScreen(
                        settings.arguments as Announcement));

              case '/announcement_open':
                return MaterialPageRoute(
                    builder: (_) => AnnouncementOpenScreen(
                        settings.arguments as Announcement));
              default:
                return MaterialPageRoute(
                    builder: (_) => MainScreen(), settings: settings);
            }
          }),
    );
  }
}
