//
//  HFMainTabBarController.h
//  SMLclub
//
//  Created by hefeng on 2017/12/18.
//  Copyright © 2017年 zhengdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFMainTabBarController : UITabBarController

/**
 设置小红点
 @param index tabbar下标
 @param isShow 是显示还是隐藏
 */
-(void)setRedDotWithIndex:(NSInteger)index isShow:(BOOL)isShow;

@end
