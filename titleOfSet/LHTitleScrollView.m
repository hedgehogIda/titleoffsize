//
//  LHTitleScrollView.m
//  titleOfSet
//
//  Created by TSX on 16/3/21.
//  Copyright © 2016年 TSX. All rights reserved.
//

#import "LHTitleScrollView.h"
#define  titleCount 7

@implementation LHTitleScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.showsHorizontalScrollIndicator = NO;
    }
    return  self;
}
-(void)setTitleModelArray:(NSArray *)titleModelArray{
    _titleModelArray = titleModelArray;
    CGFloat titleLabelWidth = 0;
    if (titleModelArray.count ==3) {
        titleLabelWidth = [UIScreen mainScreen].bounds.size.width*1.0/3;
        
    }
    else{
        titleLabelWidth = [UIScreen mainScreen].bounds.size.width*1.0/7;
        
    }
    for (int i=0; i<titleModelArray.count; i++) {
        NSString *titelStr =titleModelArray[i];
        CGFloat titleLabelX = i*titleLabelWidth;
        CGFloat titleLabelY = 0;
        CGFloat titleLabelHight = self.frame.size.height-3;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.tag = i;
        titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelWidth, titleLabelHight);
        titleLabel.text  = titelStr;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.userInteractionEnabled = YES;
        [titleLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleLabelClick:)] ];
        
        /**
         *  下划线的位置数组
         */
        CGFloat bottomLineX = titleLabelX;
        CGFloat bottomLineY = titleLabelHight;
        CGFloat bottomLineW = titleLabelWidth;
        CGFloat bottomLintH = 3;
        CGRect bottomRect = CGRectMake(bottomLineX, bottomLineY, bottomLineW, bottomLintH);
        [self.bottomLineFrameArr addObject:[NSValue valueWithCGRect:bottomRect]];
        
        
        if (i==0) {
            titleLabel.textColor = [UIColor colorWithRed:0.038 green:0.562 blue:1.000 alpha:1.000];
            
            /**
             *  下划线的添加,下划线只是一个UIview，随着UIView的响应事件代理方法，而改变下划线的frame
             */
            UIView *image = [[UIView alloc]init];
            image.tag = 1001;
            image.backgroundColor = [UIColor colorWithRed:0.038 green:0.562 blue:1.000 alpha:1.000];
            _bottomImageView = image;
            [self addSubview:_bottomImageView];
            _bottomImageView.frame = [[self.bottomLineFrameArr objectAtIndex:0]CGRectValue];
        }
        [self addSubview:titleLabel];
    }
    self.contentSize = CGSizeMake(titleModelArray.count*titleLabelWidth, self.frame.size.height);
}
-(void)titleLabelClick:(UITapGestureRecognizer*)recognizer{
    
    UILabel *label = (UILabel*)recognizer.view;
    
    NSInteger i = label.tag;
    _bottomImageView.frame = [[self.bottomLineFrameArr objectAtIndex:i]CGRectValue];
    
    if ([self.titledelegate respondsToSelector:@selector(titleScrollView:WithTitleLabel:)]) {
        [self.titledelegate titleScrollView:self WithTitleLabel:label];
    }
}
-(NSMutableArray *)bottomLineFrameArr{
    if (!_bottomLineFrameArr) {
        self.bottomLineFrameArr = [NSMutableArray array];
    }
    return _bottomLineFrameArr;
}
@end
