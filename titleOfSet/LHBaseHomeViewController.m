//
//  LHBaseHomeViewController.m
//  titleOfSet
//
//  Created by TSX on 16/3/21.
//  Copyright © 2016年 TSX. All rights reserved.
//

#import "LHBaseHomeViewController.h"
#import "LHCollectionViewCell.h"
#define contentIdentifier @"contentCollectionViewIdentifier"

@interface LHBaseHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,LHTitleScrollViewDelegate>

@end

@implementation LHBaseHomeViewController
#pragma mark - 懒加载
-(NSArray *)titleModelArray{
    if (_titleModelArray ==nil) {
        _titleModelArray = [[NSArray alloc]init];
    }
    return _titleModelArray;
    
}
-(LHTitleScrollView *)titleScrollView{
    if (_titleScrollView ==nil) {
        _titleScrollView = [[LHTitleScrollView alloc]initWithFrame:CGRectMake(0, 64, LHScreenWidth, 37)];
        _titleScrollView.titleModelArray = self.titleModelArray;
        _titleScrollView.titledelegate = self;
    }
    return _titleScrollView;
}
-(UICollectionViewFlowLayout *)flowLayout{
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = self.contentCollectionView.bounds.size;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}
-(LHContentCollectionView *)contentCollectionView{
    if (_contentCollectionView ==nil) {
        _contentCollectionView = [[LHContentCollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleScrollView.frame), LHScreenWidth, LHScreenheight-CGRectGetMaxY(self.titleScrollView.frame)-49) collectionViewLayout:self.flowLayout];
        _contentCollectionView.delegate = self;
        _contentCollectionView.dataSource = self;
        _contentCollectionView.pagingEnabled = YES;

        for (int i=0; i<self.titleModelArray.count; i++) {
            [_contentCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%d",contentIdentifier,i]];
        }
    }
    return _contentCollectionView;
}
#pragma mark - 视图的生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;//即是否根据按所在界面的navigationbar与tabbar的高度,自动调整scrollview的 inset,让你在滑动tableView的时候可以看到导航栏下面的内容。 同时， 开始的时候是从导航栏以下开始第一个cell. 不影响使用
    
    
}
#pragma mark - 设置子控件
-(void)setUI{
    
    
    [self.view addSubview:self.titleScrollView];
    
    [self.view addSubview:self.contentCollectionView];
    
}
#pragma mark - contentCollectionView的代理方法和数据源方法

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%ld",self.titleModelArray.count);
    return self.titleModelArray.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%d",contentIdentifier,(int)indexPath.row] forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor =[UIColor yellowColor];
    }else{
        cell.backgroundColor = [UIColor redColor];
    }
 
    return cell;

}
#pragma mark - titleScrollViewDelegate的代理方法 改变选中label的title颜色
-(void)titleScrollView:(LHTitleScrollView *)titleScrollView WithTitleLabel:(UILabel *)titleLabel{
    NSInteger i= titleLabel.tag;
    long index = self.lastIndex;
    NSLog(@"%ld",index);
    /**
     *  self.titleScrollView.subviews[self.lastIndex+1];
        根据上边打印的index，可以知道初始第一个即索引为0时，为下划线视图类型为UIView
        self.lastIndex==0时是下划线View，所以把每个标题的label的索引加1
     */
    UILabel *lastlabel = self.titleScrollView.subviews[self.lastIndex+1];
    lastlabel.textColor = [UIColor blackColor];
    titleLabel.textColor = [UIColor colorWithRed:0.038 green:0.562 blue:1.000 alpha:1.000];
    self.lastIndex = i;
    [self.contentCollectionView setContentOffset:CGPointMake(i*LHScreenWidth, 0) animated:NO];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    int currentIndex = self.contentCollectionView.contentOffset.x/self.contentCollectionView.bounds.size.width;
    UILabel *lastlabel = self.titleScrollView.subviews[self.lastIndex];
    lastlabel.textColor = [UIColor blackColor];
    UILabel *titlelabel = self.titleScrollView.subviews[currentIndex];
    titlelabel.textColor = [UIColor colorWithRed:0.038 green:0.562 blue:1.000 alpha:1.000];
    self.lastIndex = currentIndex;
    
    //选中的label居中
    CGFloat neescrollX = titlelabel.center.x - self.titleScrollView.bounds.size.width*0.5;
    CGFloat maxscrollX = self.titleScrollView.contentSize.width - self.titleScrollView.bounds.size.width;
    if (neescrollX<0) {
        neescrollX = 0;
    }
    if (neescrollX>maxscrollX) {
        neescrollX = maxscrollX;
    }
    [self.titleScrollView setContentOffset:CGPointMake(neescrollX, 0) animated:NO];
}
@end
