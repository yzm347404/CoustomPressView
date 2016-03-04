//
//  FaceKeyBoardView.h
//  Pods
//
//  Created by 杨振民 on 16/2/17.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#pragma mark -- iPad常量
static CGFloat const iPadLpadding = 70;//左边距
static CGFloat const iPadRpadding = 70;//右边距
static CGFloat const iPadTpadding = 40;//上边距
static CGFloat const iPadBpadding = 40;//下边距
static CGFloat const iPadItemWidth = 44;
static CGFloat const iPadItemHeight = 44;
static int const iPadHitemNumber = 11;//列数
static int const iPadVitemNumber = 4;//行数
static CGFloat const iPadExpressViewHeight = 300;//表情键盘高度
static CGFloat const iPadPageControlHeight = 20;
static CGFloat const iPadPageControlPadding = 10;
#pragma mark -- iPhone常量
static CGFloat const iPhoneLpadding = 20;//左边距
static CGFloat const iPhoneRpadding = 20;//右边距
static CGFloat const iPhoneTpadding = 10;//上边距
static CGFloat const iPhoneBpadding = 10;//下边距
static CGFloat const iPhoneItemWidth = 22;
static CGFloat const iPhoneItemHeight = 22;
static int const iPhoneHitemNumber = 9;//列数
static int const iPhoneVitemNumber = 4;//行数
static CGFloat const iPhoneExpressViewHeight = 130;//表情键盘高度
static CGFloat const iPhonePageControlHeight = 10;
static CGFloat const iPhonePageControlPadding = 0;
#pragma mark -- 静态变量
static CGFloat  Lpadding = 0;//左边距
static CGFloat  Rpadding = 0;//右边距
static CGFloat  Tpadding = 0;//上边距
static CGFloat  Bpadding = 0;//下边距
static CGFloat  ItemWidth = 0;
static CGFloat  ItemHeight = 0;
static int  HitemNumber = 0;//列数
static int  VitemNumber = 0;//行数
static CGFloat  ExpressViewHeight = 0;//表情键盘高度
static  CGFloat  height = 0;
static CGFloat  PageControlHeight = 0;
static CGFloat  PageControlPadding = 0;

static CGFloat const PageControlWidth = 200;
static CGFloat const AnimationTime = 0.25;//动画时间
static NSInteger const pageCount = 3;//页数
#define Hpadding (SCREEN_WIDTH-Lpadding-Rpadding-HitemNumber*ItemWidth)/(HitemNumber-1)//水平间隔
#define Vpadding (ExpressViewHeight-Tpadding-Bpadding-VitemNumber*ItemHeight)/(VitemNumber-1)//垂直间隔


@protocol FaceKeyBoardViewDelegate<NSObject>
- (void)faceBtnClick:(NSInteger)faceIndex;
- (void)faceDeleteBtnClick;
@end

@interface FaceKeyBoardView : UIView

@property (nonatomic, weak) id<FaceKeyBoardViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)images withPage:(NSInteger)page;

@end
