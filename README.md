# umeng_statistics

The plugin of Umeng statistics.

 github 引用方式：
 ```
 umeng_analytics:
     git:
       url: https://github.com/timer-cp/umeng_statistics.git
 ```

## User Guide

/// 初始化Appkey
```
static Future<bool> initAppKey(
        String androidAppKey, String iosAppKey, String channel,
      {bool logEnabled = false, bool encryptEnabled  = false, processEvent = false})
```
/// 事件统计
```
static Future<bool> onEvent(String id, Map<String, Object> data)
```
/// 设置用户账户
```
static Future<bool> onProfileSignIn(String userID)
```
/// 取消用户账户
```
static Future<bool> onProfileSignOff()
```
/// 自动采集页面
```
static Future<bool> setPageCollectionModeAuto()
```
/// 手动采集页面
```
static Future<bool> setPageCollectionModeManual()
```
/// 开始页面时长统计，必须配对使用
```
static Future<bool> onPageStart(String viewName)
```
/// 结束页面时长统计，必须配对使用
```
static Future<bool> onPageEnd(String viewName)
```

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



