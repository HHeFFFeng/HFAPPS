//
//  MallViewController.h
//  SMLclub
//
//  Created by hefeng on 2017/10/9.
//  Copyright © 2017年 zhengdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFCustomNavigationBar.h"

@interface HFViewController : UIViewController

/** 假导航栏 */
@property (nonatomic, strong) HFCustomNavigationBar *customNaviBar;
/** TableView */
@property (nonatomic, strong) UITableView *baseTableView;
/** CollectionView */
@property (nonatomic, strong) UICollectionView *baseCollectionView;

/** 是否显示返回按钮,默认情况是YES */
@property (nonatomic, assign) BOOL isShowLiftBack;


/** 添加导航栏按钮 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

/** 添加假导航栏 */
- (void)addCustomNaviBar;
/** 没有数据展示Image */
-(void)showNoDataWithTitle:(NSString *)title;


/** 添加上下拉刷新 */
- (void)addRefreshForTableView:(UITableView *)tableView;
- (void)headerRefreshing;
- (void)footerRefreshing;

/** 返回 */
- (void)backBtnClicked;

@end
