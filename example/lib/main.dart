import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:umeng_statistics/umeng_statistics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initUmeng();
  }

  Future<void> initUmeng() async {
    UmengStatistics.initAppKey("android app key", "iOS app key", "xxx",
        encryptEnabled: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Umeng Analytics Plugin example'),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  Map<String, Object> data = HashMap();
                  data['tab1click'] = 1;
                  UmengStatistics.onEvent("UMEvent", data);
                },
                child: Text("事件统计"),
              ),
              RaisedButton(
                onPressed: () {
                  UmengStatistics.onProfileSignIn("1001");
                },
                child: Text("设置用户账户"),
              ),
              RaisedButton(
                onPressed: () {
                  UmengStatistics.onProfileSignOff();
                },
                child: Text("取消用户账户"),
              ),
              RaisedButton(
                onPressed: () {
                  UmengStatistics.setPageCollectionModeAuto();
                },
                child: Text("自动采集页面"),
              ),
              RaisedButton(
                onPressed: () {
                  UmengStatistics.setPageCollectionModeManual();
                },
                child: Text("手动采集页面"),
              ),
              RaisedButton(
                onPressed: () {
                  UmengStatistics.onPageStart("page1");
                },
                child: Text("页面时长统计开始"),
              ),
              RaisedButton(
                onPressed: () {
                  UmengStatistics.onPageStart("page2");
                },
                child: Text("页面时长统计结束"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
