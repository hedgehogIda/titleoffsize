//
//  LHBaseTabBarViewController.m
//  titleOfSet
//
//  Created by TSX on 16/3/21.
//  Copyright © 2016年 TSX. All rights reserved.
//

#import "LHBaseTabBarViewController.h"
#import "LHHomeViewController.h"
#import "LHBaseNavigationViewController.h"
@interface LHBaseTabBarViewController ()

@end

@implementation LHBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllers];
}
-(void)addChildViewControllers{
    LHHomeViewController *homeVc = [[LHHomeViewController alloc]init];
    [self addChildViewController:homeVc WithTitle:@"html5" image:@"tab_home"];

}
-(void)addChildViewController:(UIViewController *)childController WithTitle:(NSString *)title image:(NSString *)imageName{
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    childController.title = title;
    
    
    LHBaseNavigationViewController *nav = [[LHBaseNavigationViewController alloc]initWithRootViewController:childController];
    //    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childController];
    //
    //    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //
    //    nav.navigationBar.barTintColor = [UIColor colorWithRed:22.0/255.0 green:147.0/255.0 blue:114.0/255.0 alpha:1.0];
    
    
    
    [self addChildViewController:nav];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
