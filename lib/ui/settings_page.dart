import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/platform_widget.dart';

class SettingsPage extends StatelessWidget {
  static var settingsTitle = "Settings";

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('settings'),
        ),
        child: _buildList(context));
  }

  _buildList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text('Dark Theme'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {
                defaultTargetPlatform == TargetPlatform.iOS
                    ? showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Coming Soon'),
                            content: Text('This feature will be coming soon!'),
                            actions: [
                              CupertinoDialogAction(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        })
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Coming Soon!'),
                            content: Text('This feature will be coming soon!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.purple),
                                ),
                              ),
                            ],
                          );
                        });
              },
            ),
          ),
        )
      ],
    );
  }
}
