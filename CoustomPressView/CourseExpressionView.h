//
//  CoruseExpressionView.h
//  ScaleDemo
//
//  Created by 杨振民 on 16/2/15.
//  Copyright © 2016年 杨振民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceKeyBoardView.h"

@protocol CourseExpressionViewDelegate <NSObject>
- (void)faceExpressionBtnClick:(NSInteger)faceIndex;
- (void)faceExpressionDeleteBtnClick;
@end

@interface CourseExpressionView : UIView<FaceKeyBoardViewDelegate>

@property (nonatomic, strong) NSArray *hanzArr;
@property (nonatomic, weak) id<CourseExpressionViewDelegate>delegate;

+ (instancetype)shareExpressView;
+ (CGFloat)getHeight;
- (void)show;
- (void)dismiss;

@end
