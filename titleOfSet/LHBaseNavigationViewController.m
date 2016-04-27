//
//  LHBaseNavigationViewController.m
//  titleOfSet
//
//  Created by TSX on 16/3/21.
//  Copyright © 2016年 TSX. All rights reserved.
//

#import "LHBaseNavigationViewController.h"

@interface LHBaseNavigationViewController ()

@end

@implementation LHBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationBar.barTintColor = NavColor;
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [super pushViewController:viewController animated:YES];
    [self addbackBtn:viewController];
    
}

-(void)addbackBtn:(UIViewController*)viewController{
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    viewController.navigationItem.leftBarButtonItems = @[back];
    
}
-(void)backBtnClick{
    
    [self popViewControllerAnimated:YES];
}
@end
