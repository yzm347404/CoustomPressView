//
//  ViewController.m
//  CoustomPressView
//
//  Created by 杨振民 on 16/3/4.
//  Copyright © 2016年 杨振民. All rights reserved.
//

#import "ViewController.h"
#import "CourseExpressionView.h"
#import "BaseHelper.h"
#import "Define.h"


@interface ViewController ()<CourseExpressionViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = nil;
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)show:(id)sender {
    CourseExpressionView *pressView = [CourseExpressionView new];
    pressView.delegate = self;
    [pressView show];
}

- (void)faceExpressionBtnClick:(NSInteger)faceIndex
{
    if(faceIndex >= [BaseHelper loadEmojiHanz].count) return;
    
    NSMutableString *faceName = [(NSString *)[BaseHelper loadEmojiHanz][faceIndex] mutableCopy];
//    DLog(@"%ld",(unsigned long)[BaseHelper loadEmojiHanz].count);
    [faceName insertString:HANZ_START_FLAG atIndex:0];
    [faceName appendString:HANZ_END_FLAG];
    if (self.textView.text.length > 0) {
        NSMutableString *originalStr = [self.textView.text mutableCopy];
        [originalStr appendString:faceName];
        self.textView.text = originalStr;
    }else
    {
        self.textView.text = faceName;
    }
    
    [self.textView scrollRangeToVisible:NSMakeRange(self.textView.text.length, 1)];
}

- (void)faceExpressionDeleteBtnClick
{
    int length = (int) self.textView.text.length;
    if (length > 0) {
        NSMutableString *text = [self.textView.text mutableCopy];
        if (length >= 4) {
            NSString *lastStr = [ self.textView.text substringFromIndex:length-4];
            if ([lastStr hasPrefix:HANZ_START_FLAG] && [lastStr hasSuffix:HANZ_END_FLAG]) {
                [text deleteCharactersInRange:NSMakeRange(length-4, 4)];
            } else {
                [text deleteCharactersInRange:NSMakeRange(length-1, 1)];
            }
        }
        else {
            [text deleteCharactersInRange:NSMakeRange(length-1, 1)];
        }
        self.textView.text = text;
    }

}
@end
