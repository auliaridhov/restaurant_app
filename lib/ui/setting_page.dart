import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:restaurant_app/widgets/custom_dialog.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class SettingPage extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settingsTitle),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(settingsTitle),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('Scheduling Restaurant'),
                  Spacer(),
                  Consumer<SchedulingProvider>(
                    builder: (context, scheduled, _) {
                      return Switch.adaptive(
                        value: provider.isDailyRestaurantActive,
                        onChanged: (value) async {
                          if (Platform.isIOS) {
                            customDialog(context);
                          } else {
                            scheduled.scheduledNews(value);
                            provider.enableDailyNews(value);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
