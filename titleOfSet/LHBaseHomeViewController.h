//
//  LHBaseHomeViewController.h
//  titleOfSet
//
//  Created by TSX on 16/3/21.
//  Copyright © 2016年 TSX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHContentCollectionView.h"
#import "LHTitleScrollView.h"

@interface LHBaseHomeViewController : UIViewController
@property (nonatomic,strong) NSArray *titleModelArray;
@property (nonatomic,strong) LHTitleScrollView *titleScrollView;

@property (nonatomic,strong) LHContentCollectionView *contentCollectionView;

@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
//记录上一次选中的label的下标
@property (nonatomic,assign) NSInteger lastIndex;

-(void)setUI;
@end
