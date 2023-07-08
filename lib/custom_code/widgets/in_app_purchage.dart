// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../pages/home_page/home_page_widget.dart';
import '../../payment/payment_widget.dart';

class InAppPurchage extends StatefulWidget {
  const InAppPurchage({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _InAppPurchageState createState() => _InAppPurchageState();
}

class _InAppPurchageState extends State<InAppPurchage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const HomePageWidget(),
    const PaymentWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store is loading'));
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<FirebaseNotifier>(
    //         create: (_) => FirebaseNotifier()),
    //     ChangeNotifierProvider<DashCounter>(create: (_) => DashCounter()),
    //     ChangeNotifierProvider<DashUpgrades>(
    //       create: (context) => DashUpgrades(
    //         context.read<DashCounter>(),
    //         context.read<FirebaseNotifier>(),
    //       ),
    //     ),
    //     ChangeNotifierProvider<IAPRepo>(
    //       create: (context) => IAPRepo(context.read<FirebaseNotifier>()),
    //     ),
    //     ChangeNotifierProvider<DashPurchases>(
    //       create: (context) => DashPurchases(
    //         context.read<DashCounter>(),
    //       ),
    //     ),
    //   ],
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text(widget.title),
    //     ),
    //     body: _widgetOptions[_selectedIndex],
    //     bottomNavigationBar: BottomNavigationBar(
    //       items: const <BottomNavigationBarItem>[
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.home),
    //           label: 'Home',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.shop),
    //           label: 'Purchase',
    //         ),
    //       ],
    //       currentIndex: _selectedIndex,
    //       selectedItemColor: Colors.amber[800],
    //       onTap: (index) => setState(() => _selectedIndex = index),
    //     ),
    //   ),
    // );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
