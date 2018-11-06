//
//  BaseNavStyle.m
//  LPLeeksProProject
//
//  Created by my y on 2018/11/2.
//  Copyright © 2018年 pangyunlei. All rights reserved.
//

#import "BaseNavStyle.h"
#import "LMJNavigationBar.h"

@interface  BaseNavStyle() <LMJNavigationBarDelegate, LMJNavigationBarDataSource>

@property (nonatomic, weak) UIViewController *vc;

@end

@implementation BaseNavStyle

- (id)initWithVC:(UIViewController *)vc {
    if (self = [super init]) {
        self.vc = vc;
    }
    return self;
}

- (void)setNormalStyle {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self lmj_navgationBar];
        self.lmj_navgationBar.lmj_width = self.vc.view.lmj_width;
        [self.vc.view bringSubviewToFront:self.lmj_navgationBar];
    });
    
    
}

- (LMJNavigationBar *)lmj_navgationBar {
    // 父类控制器必须是导航控制器
    if(!_lmj_navgationBar && [self.vc.parentViewController isKindOfClass:[UINavigationController class]]) {
        LMJNavigationBar *navigationBar = [[LMJNavigationBar alloc] initWithFrame:CGRectMake(0,
                                                                                             0,
                                                                                             [UIScreen mainScreen].bounds.size.width,
                                                                                             0)];
        [self.vc.view addSubview:navigationBar];
        _lmj_navgationBar = navigationBar;
        
        _lmj_navgationBar.dataSource = self;
        _lmj_navgationBar.lmjDelegate = self;
        _lmj_navgationBar.hidden = ![self navUIBaseViewControllerIsNeedNavBar:self];
    }
    return _lmj_navgationBar;
}

/** 导航条的左边的 view */
- (UIView *)lmjNavigationBarLeftView:(LMJNavigationBar *)navigationBar{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    [btn layoutButtonWithEdgInsetsStyle: WxyButtonEdgeInsetsStyleImageLeft imageTitleSpacing:50];
    [btn setImage:[UIImage imageNamed:@"icon_back_h"] forState:UIControlStateNormal];
    return btn;
}

/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar{
    [self.vc.navigationController popViewControllerAnimated:YES];
}

//#pragma mark - DataSource
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(BaseNavStyle *)navUIBaseViewController{
    return YES;
}

/** 是否显示底部黑线 */
- (BOOL)lmjNavigationIsHideBottomLine:(LMJNavigationBar *)navigationBar
{
    return YES;
}

/** 导航条的高度 */
- (CGFloat)lmjNavigationHeight:(LMJNavigationBar *)navigationBar {
    return [UIApplication sharedApplication].statusBarFrame.size.height + 44.0;
}

/**头部标题*/
- (NSMutableAttributedString*)lmjNavigationBarTitle:(LMJNavigationBar *)navigationBar {
    return [self changeTitle:self.vc.title ?: self.vc.navigationItem.title];
}

- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle {
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(0, title.length)];
    return title;
}

@end
