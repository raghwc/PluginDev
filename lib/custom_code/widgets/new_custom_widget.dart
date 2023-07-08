// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:typed_data';

// See installation notes below regarding AndroidManifest.xml and Info.plist
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:fast_contacts/fast_contacts.dart';

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _NewCustomWidgetState createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  List<Contact> _contacts = const [];
  String? _text;

  final _ctrl = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    try {
      await Permission.contacts.request();
      final sw = Stopwatch()..start();
      // List<Contact> contacts =
      //     await FlutterContacts.getContacts().then((feature) => feature);
      List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);

      sw.stop();
      _contacts = contacts;
    } on PlatformException catch (ex) {
      _text = 'Failed to get contacts:\n${ex.details}';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
          onPressed: () async {
            await initPlatformState();
            if (_text != null) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Alert"),
                    content: Text(_text ?? ""),
                    actions: <Widget>[
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              // Show the contacts using a dialog or another widget
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Contacts'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _contacts
                          .map((contact) => Text(contact.displayName ?? ''))
                          .toList(),
                    ),
                  ),
                ),
              );
            }
          },
          child: Text('Sync Contact'),
        ));
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
