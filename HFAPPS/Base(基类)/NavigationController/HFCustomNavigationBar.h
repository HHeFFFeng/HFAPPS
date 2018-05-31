//
//  HFCustomNavigationBar.h
//  SMLclub
//
//  Created by hefeng on 2018/1/30.
//  Copyright © 2018年 zhengdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFCustomNavigationBar : UIView
@property (nonatomic, copy) void(^onClickLeftButton)(void);
@property (nonatomic, copy) void(^onClickRightButton)(void);

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, strong) UIColor  *titleLabelColor;
@property (nonatomic, strong) UIFont   *titleLabelFont;
@property (nonatomic, strong) UIColor  *barBackgroundColor;
@property (nonatomic, strong) UIImage  *barBackgroundImage;

+ (instancetype)customNavigationBar;

- (void)hf_setBottomLineHidden:(BOOL)hidden;
- (void)hf_setBackgroundAlpha:(CGFloat)alpha;
- (void)hf_setTintColor:(UIColor *)color;

- (void)hf_setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)hf_setLeftButtonWithImage:(UIImage *)image;
- (void)hf_setLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

- (void)hf_setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)hf_setRightButtonWithImage:(UIImage *)image;
- (void)hf_setRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

@end
