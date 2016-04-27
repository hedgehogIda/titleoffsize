//
//  LHTitleScrollView.h
//  titleOfSet
//
//  Created by TSX on 16/3/21.
//  Copyright © 2016年 TSX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  LHTitleScrollView;
@protocol LHTitleScrollViewDelegate <NSObject>
-(void)titleScrollView:(LHTitleScrollView*)titleScrollView WithTitleLabel:(UILabel*)titleLabel;

@end
@interface LHTitleScrollView : UIScrollView
@property(nonatomic,strong)NSArray *titleModelArray;
@property(nonatomic,strong)NSMutableArray *bottomLineFrameArr;
@property(nonatomic,strong)UIView *bottomImageView;
@property(nonatomic,strong)id <LHTitleScrollViewDelegate>titledelegate;

@end
