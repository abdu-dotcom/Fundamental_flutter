import 'package:flutter/material.dart';
import 'package:fundamental_flutter/data/model/article.dart';
import 'package:fundamental_flutter/common/style.dart';
import 'package:fundamental_flutter/assets/Typography/merriweather.dart';
import 'ui/article_web_view.dart';
import 'ui/article_detail_page.dart';
import 'ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: SecondaryColor,
            ),
        textTheme: myTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: SecondaryColor,
            onPrimary: Colors.white,
            textStyle: TextStyle(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: SecondaryColor,
            unselectedItemColor: Colors.grey),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
    );
  }
}
