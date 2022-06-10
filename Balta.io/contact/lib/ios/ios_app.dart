import 'package:contact/ios/views/home_view.dart';
import 'package:contact/ios/styles.dart';
import 'package:flutter/cupertino.dart';

class IOSApp extends StatelessWidget {
  const IOSApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: iosLightTheme(),
      home: const HomeView(),
    );
  }
}