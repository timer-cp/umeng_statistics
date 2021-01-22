# umeng_statistics

The plugin of Umeng statistics.

友盟统计官方Flutter插件实现不好，而且繁琐，自己实现的一个，可以直接添加使用。
 github库直接引用方式：
 ```
 umeng_analytics:
     git:
       url: https://github.com/timer-cp/umeng_statistics.git
 ```

## User Guide

/// 初始化Appkey
static Future<bool> initAppKey(String androidAppKey, String iosAppKey, String channel)

/// 事件统计功能
static Future<bool> onEvent(String id, Map<String, Object> data)

/// 设置用户账户
static Future<bool> onProfileSignIn(String userID)

/// 取消用户账户
static Future<bool> onProfileSignOff()

/// 自动采集页面
static Future<bool> setPageCollectionModeAuto()

/// 手动采集页面
static Future<bool> setPageCollectionModeManual()

/// 自动页面时长统计，必须配对使用
static Future<bool> onPageStart(String viewName)

/// 结束页面时长统计，必须配对使用
  static Future<bool> onPageEnd(String viewName)

## 代码混淆
```
-keep class com.umeng.** {*;}
-keepclassmembers class * {
   public <init> (org.json.JSONObject);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
```

## 合规指南
* Android
“我们的产品集成友盟+SDK，友盟+SDK需要收集您的设备Mac地址、唯一设备识别码（IMEI/android ID/IDFA/OPENUDID/GUID、SIM 卡 IMSI 信息）以提供统计分析服务，并通过地理位置校准报表数据准确性，提供基础反作弊能力。”
* iOS
“我们的产品集成友盟+SDK，友盟+SDK需要收集您的设备Mac地址、唯一设备识别码（IMEI/android ID/IDFA/OPENUDID/GUID、SIM 卡 IMSI 信息）以提供统计分析服务，并通过地理位置校准报表数据准确性，提供基础反作弊能力。”

