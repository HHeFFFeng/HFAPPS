//
//  HFMainTabBarController.m
//  SMLclub
//
//  Created by hefeng on 2017/12/18.
//  Copyright © 2017年 zhengdi. All rights reserved.
//

#import "HFMainTabBarController.h"
#import "HFNavigationController.h"
#import "SMLHealthyclassroomViewController.h"

@interface HFMainTabBarController () <UITabBarControllerDelegate>

@end

@implementation HFMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    self.tabBar.tintColor = AppColor;
    
    //添加子控制器
    [self setUpAllChildViewController];
}


- (void)setUpAllChildViewController {
    /** 我的健康 */
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    HFNavigationController *firstNav = [self setupChildViewController:homeVC title:@"我的健康" imageName:@"xtb46@2x" seleceImageName:@"xtb47@2x"];
    
    /** 专属活动 */
    SpecialActivityViewController *specialActivityVC = [[UIStoryboard storyboardWithName:@"Activity" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([SpecialActivityViewController class])];
    HFNavigationController *secondNav = [self setupChildViewController:specialActivityVC title:@"专属活动" imageName:@"xtb48@2x" seleceImageName:@"xtb49@2x"];
    
    /** 今日开讲 */
    TodaySpeechViewController *todaySpeechVC = [[UIStoryboard storyboardWithName:@"TodaySpeech" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([TodaySpeechViewController class])];
    HFNavigationController *thirdNav = [self setupChildViewController:todaySpeechVC title:@"今日开讲" imageName:@"WechatIMG69@2x" seleceImageName:@"WechatIMG68@2x"];
    
    SMLHealthyclassroomViewController *shopVC = [[SMLHealthyclassroomViewController alloc] init];
    HFNavigationController *fourthNav = [self setupChildViewController:shopVC title:@"健康课堂" imageName:@"xtb52@2x" seleceImageName:@"xtb53@2x"];
    
    /** 我的 */
    MyZoneHomeViewController *meVC = [[UIStoryboard storyboardWithName:@"Mall" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MyZoneHomeViewController class])];
    HFNavigationController *fifthNav = [self setupChildViewController:meVC title:@"会员中心" imageName:@"xtb54@2x" seleceImageName:@"xtb55@2x"];
    
    if ([SMLHttpRequestManager sharedNetworkClient].goodIdea) {
        self.viewControllers = @[firstNav, secondNav, thirdNav, fourthNav, fifthNav];
    }else {
        self.viewControllers = @[secondNav, thirdNav, fourthNav, fifthNav];
    }
    
}

- (HFNavigationController *)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName {
    
    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    HFNavigationController *nav = [[HFNavigationController alloc] initWithRootViewController:controller];
    return nav;
}

- (void)setRedDotWithIndex:(NSInteger)index isShow:(BOOL)isShow {
    
}

#pragma mark - ——————— UITabBarControllerDelegate ———————
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    if ([viewController.tabBarItem.title isEqualToString:@"会员中心"]) {
        if ([[HFUserManager sharedUserManager] isLogin]) {
            return YES;
        }else {
            LoginViewController *longinVC = [[UIStoryboard storyboardWithName:@"Common" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([LoginViewController class])];
            longinVC.superVC = self;
            [viewController presentViewController:longinVC animated:YES completion:nil];
            return NO;
        }
    }else {
        return YES;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
