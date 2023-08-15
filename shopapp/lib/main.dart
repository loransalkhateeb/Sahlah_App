import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/Cart_Prov.dart';
import 'package:shopapp/Providers/Items_Prov.dart';
import 'package:shopapp/Providers/offers_provider.dart';
import 'package:shopapp/Secreens/Login_Secreen.dart';

import 'Applocalization.dart';
import 'Providers/Category_Item_Provider.dart';
import 'Providers/Sub_Category_Prov.dart';
import 'Providers/category_prov.dart';
import 'Secreens/Bottom_NavigationBar_Secreen/Bottom_NavigationBar_Secreen.dart';
import 'Secreens/Splash_Secreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoriesProv>(
          create: (_) => CategoriesProv(),
        ),
         ChangeNotifierProvider<Offers_Prov>(
           create: (_) => Offers_Prov(),
         ),
         ChangeNotifierProvider<Sub_Category_Prov>(
           create: (_) => Sub_Category_Prov(),
         ),
         ChangeNotifierProvider<Items_Prove>(
           create: (_) => Items_Prove(),
         ),
        ChangeNotifierProvider<CartProvider>(
           create: (_) => CartProvider(),
         ),
         ChangeNotifierProvider<Category_item_provider>(
           create: (_) => Category_item_provider(),
         ),
        // ChangeNotifierProvider<OrderProv>(
        //   create: (_) => OrderProv(),
        // ),
        // ChangeNotifierProvider<OrderDetProv>(
        //   create: (_) => OrderDetProv(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        home: splash_secreen(),
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      ),
    );
  }
}