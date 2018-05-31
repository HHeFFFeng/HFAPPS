//
//  CommonMacros.h
//  SMLclub
//
//  Created by hefeng on 2017/11/28.
//  Copyright © 2017年 zhengdi. All rights reserved.
//

#ifndef CommonMacros_h
#define CommonMacros_h

#pragma mark - ——————— 通知(登录) ————————
//登录状态改变通知
#define KNotificationLoginStateChange @"loginStateChange"
//自动登录成功
#define KNotificationAutoLoginSuccess @"KNotificationAutoLoginSuccess"
//被踢下线
#define KNotificationOnKick @"KNotificationOnKick"

#pragma mark - ——————— 通知(User) ———————
//用户信息缓存 名称
#define KUserCacheName @"KUserCacheName"
//用户model缓存
#define KUserModelCache @"KUserModelCache"

#pragma mark - ——————— 通知(网络状态) ————————
//网络状态变化
#define KNotificationNetWorkStateChange @"KNotificationNetWorkStateChange"

#pragma mark - ——————— App Key ———————
#define kWXAppKey @"wxfaedf863e963e84f"
#define kWXAppSecret @"41efe49f20d24b55811a74c2720f38aa"






#endif /* CommonMacros_h */
