//
//  FaceKeyBoardView.m
//  Pods
//
//  Created by 杨振民 on 16/2/17.
//
//

#import "FaceKeyBoardView.h"
#import "Define.h"
#import "CourseExpressionView.h"
#import "BaseHelper.h"

@implementation FaceKeyBoardView

- (instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)images withPage:(NSInteger)page
{
    if (self = [super initWithFrame:frame]) {
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            Lpadding = iPhoneLpadding;//左边距
            Rpadding = iPhoneRpadding;//右边距
            Tpadding = iPhoneTpadding;//上边距
            Bpadding = iPhoneBpadding;//下边距
            ItemWidth = iPhoneItemHeight;
            ItemHeight = iPhoneItemHeight;
            HitemNumber = iPhoneHitemNumber;//列数
            VitemNumber = iPhoneVitemNumber;//行数
            ExpressViewHeight = iPhoneExpressViewHeight;//表情键盘高度
        }else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            Lpadding = iPadLpadding;//左边距
            Rpadding = iPadRpadding;//右边距
            Tpadding = iPadTpadding;//上边距
            Bpadding = iPadBpadding;//下边距
            ItemWidth = iPadItemHeight;
            ItemHeight = iPadItemHeight;
            HitemNumber = iPadHitemNumber;//列数
            VitemNumber = iPadVitemNumber;//行数
            ExpressViewHeight = iPadExpressViewHeight;//表情键盘高度
        }

        self.backgroundColor = RGB16(0xebf0f6);
        for (int i = 0; i < images.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(Lpadding+i%HitemNumber*(ItemWidth+Hpadding), Tpadding+i/HitemNumber*(ItemHeight+Vpadding), ItemWidth, ItemHeight);
            if ([images[i] isKindOfClass:[UIImage class]]) {
                [btn setImage:images[i] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(faceClick:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = page*(HitemNumber*VitemNumber - 1) + i;
            }else
            {
                [btn setImage:[BaseHelper themeImageWithImageName:@"faceDelete"] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
            }
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)faceClick:(UIButton *)faceBtn
{
    if (_delegate && [_delegate respondsToSelector:@selector(faceBtnClick:)]) {
        [_delegate faceBtnClick:faceBtn.tag];
    }
}

- (void)deleteClick:(UIButton *)deleteBtn
{
    if (_delegate && [_delegate respondsToSelector:@selector(faceDeleteBtnClick)]) {
        [_delegate faceDeleteBtnClick];
    }
}

@end
