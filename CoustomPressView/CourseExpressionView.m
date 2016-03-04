//
//  CoruseExpressionView.m
//  ScaleDemo
//
//  Created by 杨振民 on 16/2/15.
//  Copyright © 2016年 杨振民. All rights reserved.
//

#import "CourseExpressionView.h"
#import "Define.h"
#import "BaseHelper.h"


@interface CourseExpressionView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *expressImages;
@property (nonatomic, strong) NSMutableArray *faceImagesArr;
@end

@implementation CourseExpressionView


+ (CGFloat)getHeight
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)//iPhone
    {
        ExpressViewHeight = iPhoneExpressViewHeight;//表情键盘高度
    }else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)//iPad
    {
        ExpressViewHeight = iPadExpressViewHeight;//表情键盘高度
    }
    height = ExpressViewHeight;
    return height;
}

+ (instancetype)shareExpressView
{
    static dispatch_once_t onceToken;
    static CourseExpressionView *courseExpressionView = nil;
    dispatch_once(&onceToken, ^{
        courseExpressionView = [[CourseExpressionView alloc] init];
    });
    return courseExpressionView;
}

- (instancetype)init
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)//iPhone
    {
        HitemNumber = iPhoneHitemNumber;//列数
        VitemNumber = iPhoneVitemNumber;//行数
        ExpressViewHeight = iPhoneExpressViewHeight;//表情键盘高度
        PageControlHeight = iPhonePageControlHeight;
        PageControlPadding = iPhonePageControlPadding;
    }else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)//iPad
    {
        HitemNumber = iPadHitemNumber;//列数
        VitemNumber = iPadVitemNumber;//行数
        ExpressViewHeight = iPadExpressViewHeight;//表情键盘高度
        PageControlHeight = iPadPageControlHeight;
        PageControlPadding = iPadPageControlPadding;
    }

    CGRect frame = CGRectMake(0, SCREEN_HEIGHT , SCREEN_WIDTH, ExpressViewHeight);
    if (self = [super initWithFrame:frame]) {
        UIScrollView *sv = [[UIScrollView alloc] initWithFrame:self.bounds];
        //设置整页翻动
        sv.contentSize = CGSizeMake(SCREEN_WIDTH*pageCount, ExpressViewHeight);
        sv.contentOffset = CGPointMake(0, 0);
        sv.pagingEnabled = YES;
        sv.bounces = NO;
        sv.delegate = self;
        sv.showsHorizontalScrollIndicator = NO;
        [self addSubview:sv];
        
        for (int i = 0; i < pageCount; i++) {
            FaceKeyBoardView *fv = [[FaceKeyBoardView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, ExpressViewHeight) withImages:self.expressImages[i] withPage:i];
            fv.delegate = self;
            [sv addSubview:fv];
        }
        
        UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - PageControlWidth)/2, ExpressViewHeight - PageControlHeight - PageControlPadding, PageControlWidth, PageControlHeight)];
        pageControl.pageIndicatorTintColor = RGB16(0xc1c0be);
        pageControl.currentPageIndicatorTintColor = RGB16(0x777777);
        pageControl.numberOfPages = pageCount;
        pageControl.currentPage = 0;
        [self addSubview:pageControl];
        
        self.hanzArr = [BaseHelper loadEmojiHanz];
    }
    return self;
}

- (NSMutableArray *)expressImages
{
        if (!_expressImages) {
        _expressImages = [NSMutableArray array];
        int tempNumber = 0;
        for (int i = 0; i < pageCount; i++) {
            NSMutableArray *subImages = [NSMutableArray array];
            if (i != pageCount - 1) {
                for (int j = tempNumber; j < tempNumber + VitemNumber * HitemNumber - 1; j++) {
                    UIImage *image = (j >= 10) ? [BaseHelper themeImageWithImageName:[NSString stringWithFormat:@"f0%i",j]]:[BaseHelper themeImageWithImageName:[NSString stringWithFormat:@"f00%i",j]];
                    [subImages addObject:image];
                }
                [subImages addObject:@""];
                tempNumber += VitemNumber * HitemNumber - 1;
            }else
            {
                for (int j = tempNumber; j < tempNumber + 87%(VitemNumber * HitemNumber - 1); j++) {
                    UIImage *image = (j >= 10) ? [BaseHelper themeImageWithImageName:[NSString stringWithFormat:@"f0%i",j]]:[BaseHelper themeImageWithImageName:[NSString stringWithFormat:@"f00%i",j]];
                    [subImages addObject:image];
                }
                [subImages addObject:@""];
            }
            [_expressImages addObject:subImages];
        }
    }
    return _expressImages;
}


- (void)show
{
    UIWindow *win = [[UIApplication sharedApplication].delegate window];
    [win addSubview:self];
    
    [UIView animateWithDuration:AnimationTime animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT - ExpressViewHeight, SCREEN_WIDTH, ExpressViewHeight);
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:AnimationTime animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT , SCREEN_WIDTH, ExpressViewHeight);
    } completion:^(BOOL finished) {
        if(finished)
        {
            [self removeFromSuperview];
        }
    }];
}

#pragma mark --<UIScrollViewDelegate>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/SCREEN_WIDTH;
    if([scrollView.superview.subviews.lastObject isKindOfClass:[UIPageControl class]])
    {
        ((UIPageControl *)scrollView.superview.subviews.lastObject).currentPage = page;
    }
    
}

#pragma mark --<FaceKeyBoardViewDelegate>
- (void)faceBtnClick:(NSInteger)faceIndex
{
    if (_delegate && [_delegate respondsToSelector:@selector(faceExpressionBtnClick:)]) {
        [_delegate faceExpressionBtnClick:faceIndex];
    }
}

- (void)faceDeleteBtnClick
{
    if (_delegate && [_delegate respondsToSelector:@selector(faceExpressionDeleteBtnClick)]) {
        [_delegate faceExpressionDeleteBtnClick];
    }
}
@end
