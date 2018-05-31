//
//  HFNavigationController.m
//  SMLclub
//
//  Created by hefeng on 2017/12/18.
//  Copyright © 2017年 zhengdi. All rights reserved.
//

#import "HFNavigationController.h"

@interface HFNavigationController () {
    NSArray *_classNames;
}
@end

@implementation HFNavigationController

//APP生命周期中 只会执行一次
+ (void)initialize {
    //导航栏主题 title文字属性
    UINavigationBar *navBar = [UINavigationBar appearance];
    //导航栏背景图
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"tabBarBj"] forBarMetrics:UIBarMetricsDefault];
    [navBar setBarTintColor:SQCNavBgFontColor];
    [navBar setTintColor:SQCNavBgFontColor];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName :SQCNavBgFontColor, NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    [navBar setBackgroundImage:[UIImage imageWithColor:SQCNavBgColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[UIImage new]];//去掉阴影线
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _classNames = @[@"HFRecordHealthViewController",//记血压
                    @"MedicineRemindViewController",//家庭药箱
                    @"HFMyTripViewController",//我的行程
                    @"HealthFileViewController",//健康档案
                    @"MyFamilyViewController",//我的家人
                    @"HFRecommendGuestsViewController",//推荐人列表
                    @"HFHomeMessageViewController", //系统消息
                    @"SMLDailyHealthViewController", //联系客服
                    @"SMLHealthCheckVC", //健康自检
                    @"SMLDetectionItemVC", //异常提醒
                    @"SMLHealthReportViewController",//体检报告
                    @"CloudCoinViewController", //云币商城
                    ];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    HFNSLog(@"子控制器数量:%ld",self.viewControllers.count);
    NSString *className = NSStringFromClass([viewController class]);
    //1.进入二级界面 2.未登录 3.属于需要登录的界面
    if (self.viewControllers.count > 0 && ![HFUserManager sharedUserManager].isLogin && [_classNames containsObject:className]) {
        LoginViewController *longinVC = [[UIStoryboard storyboardWithName:@"Common" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([LoginViewController class])];
        [self presentViewController:longinVC animated:YES completion:nil];
        return;
    }else {
        
    }
    [super pushViewController:viewController animated:animated];
}

@end
