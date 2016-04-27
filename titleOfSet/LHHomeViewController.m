//
//  LHHomeViewController.m
//  titleOfSet
//
//  Created by TSX on 16/3/22.
//  Copyright © 2016年 TSX. All rights reserved.
//

#import "LHHomeViewController.h"

@interface LHHomeViewController ()

@end

@implementation LHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  = [UIColor whiteColor];
    self.titleModelArray = @[@"html5",@"OC",@"web",@"C#",@"JAVA",@".net",@"C",@"swift"];
    [self setUI];
}


@end
