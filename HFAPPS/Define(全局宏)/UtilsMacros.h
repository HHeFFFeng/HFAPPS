//
//  UtilsMacros.h
//  SMLclub
//
//  Created by hefeng on 2017/11/24.
//  Copyright © 2017年 zhengdi. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

//内部版本号 每次发版递增
#define KVersionCode 1

//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//状态栏高度 + 导航条高度
#define kStatusBarAndNaviHeight (CGRectGetHeight(kApplication.statusBarFrame) + 44)
//tabbar高度
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
//底部宏
#define kSafeAreaBottomHeight (kScreenHeight == 812.0 ? 34 : 0)

//数据验证
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define ValidStr(f) StrValid(f)
#define ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define ValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define ValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])

///IOS 版本判断
#define IOSAVAILABLEVERSION(version) ([[UIDevice currentDevice] availableVersion:version] < 0)
// 当前系统版本
#define kCurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]
//当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#endif /* UtilsMacros_h */
