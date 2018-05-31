//
//  MallViewController.m
//  SMLclub
//
//  Created by hefeng on 2017/10/9.
//  Copyright © 2017年 zhengdi. All rights reserved.
//

#import "HFViewController.h"
#import "HFRequestFailView.h"

@interface HFViewController ()
@property (nonatomic, strong) HFRequestFailView *failView;

@end

@implementation HFViewController

#pragma mark - ——————— getter ———————
- (HFCustomNavigationBar *)customNaviBar {
    if (!_customNaviBar) {
        _customNaviBar = [HFCustomNavigationBar customNavigationBar];
    }
    return _customNaviBar;
}

- (UITableView *)baseTableView {
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kStatusBarAndNaviHeight -kTabBarHeight) style:UITableViewStylePlain];
        
        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _baseTableView.estimatedRowHeight = 0;
        _baseTableView.estimatedSectionHeaderHeight = 0;
        _baseTableView.estimatedSectionFooterHeight = 0;
        _baseTableView.backgroundColor = SQCViewBgColor;
        _baseTableView.scrollsToTop = YES;
        _baseTableView.tableFooterView = [UIView new];
        
        //头部刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = NO;
        _baseTableView.mj_header = header;
        
        //底部刷新
        _baseTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    }
    return _baseTableView;
}

- (UICollectionView *)baseCollectionView {
    if (!_baseCollectionView) {
        UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
        _baseCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kStatusBarAndNaviHeight - kTabBarHeight) collectionViewLayout:flow];
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = NO;
        _baseCollectionView.mj_header = header;
        
        _baseCollectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
        
        _baseCollectionView.backgroundColor = SQCViewBgColor;
        _baseCollectionView.scrollsToTop = YES;
    }
    return _baseCollectionView;
}

#pragma mark - ——————— 上下拉刷新 ———————
- (void)headerRefreshing{
    
}

- (void)footerRefreshing{
    
}

#pragma mark - ——————— 无数据展示 ———————
-(void)showNoDataWithTitle:(NSString *)title {
    @weakify(self);
    [HFAlertViewCenter showAlertViewWithTitle:title subTitle:nil cancelTitle:@"联系客服" comfirmTitle:@"返回上一页" doBlock:^(id selectedValue) {
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    } cancelBlock:^{
        [HFAlertViewCenter callPhone:@"4006166200"];
    } origin:self];
}

#pragma mark - ——————— 刷新 ———————
- (void)addRefreshForTableView:(UITableView *)tableView {
    _baseTableView = tableView;
    NSAssert(self.baseTableView, @"请设置baseTableView");
    __weak typeof(self) weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf headerRefreshing];
    }];
    weakSelf.baseTableView.mj_header = header;
    
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf footerRefreshing];
    }];
    weakSelf.baseTableView.mj_footer = refreshFooter;
}

#pragma mark - ——————— life cycle ———————
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isShowLiftBack = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"⭕️⭕️⭕️⭕️⭕️⭕️⭕️ %@ will appear ⭕️⭕️⭕️⭕️⭕️⭕️⭕️",NSStringFromClass([self class]));
}

- (void)dealloc {
    NSLog(@"❌❌❌❌❌❌❌ %@ dealloc ❌❌❌❌❌❌❌",NSStringFromClass([self class]));
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - ——————— 添加假导航栏 ———————
- (void)addCustomNaviBar {
    [self.view addSubview:self.customNaviBar];
}


#pragma mark - ——————— 是否显示返回按钮 ———————
/**
 *  是否显示返回按钮
 */
- (void)setIsShowLiftBack:(BOOL)isShowLiftBack {
    _isShowLiftBack = isShowLiftBack;
    NSInteger VCCount = self.navigationController.viewControllers.count;
    //下面判断的意义是 当VC所在的导航控制器中的VC个数大于1 或者 是present出来的VC时，才展示返回按钮，其他情况不展示
    if (isShowLiftBack && ( VCCount > 1 || self.navigationController.presentingViewController != nil)) {
        [self addNavigationItemWithImageNames:@[@"ty03"] isLeft:YES target:self action:@selector(backBtnClicked) tags:nil];
        
    } else {
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem * NULLBar=[[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
        self.navigationItem.leftBarButtonItem = NULLBar;
    }
}

#pragma mark ————— 导航栏 添加图片按钮 —————
/**
 导航栏添加图标按钮
 
 @param imageNames 图标数组
 @param isLeft 是否是左边 非左即右
 @param target 目标
 @param action 点击方法
 @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags {
    NSMutableArray * items = [[NSMutableArray alloc] init];
    //调整按钮位置
    //    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    //将宽度设为负值
    //    spaceItem.width= -5;
    //    [items addObject:spaceItem];
    NSInteger i = 0;
    for (NSString * imageName in imageNames) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 50, 44);
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
        }else{
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
        }
        
        btn.tag = [tags[i++] integerValue];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

#pragma mark - ——————— 返回Action ———————
- (void)backBtnClicked {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



@end
