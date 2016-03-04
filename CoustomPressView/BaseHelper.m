//
//  BaseHelper.m
//  CoustomPressView
//
//  Created by 杨振民 on 16/3/4.
//  Copyright © 2016年 杨振民. All rights reserved.
//

#import "BaseHelper.h"

@implementation BaseHelper
// 存储图片对应的汉字意思，显示在文本框
+ (NSArray *)loadEmojiHanz
{
    NSArray *hanzData = [[NSArray alloc] initWithObjects:@"好累",@"大笑",@"憨笑",@"同情",@"晕啊",@"流泪",@"吐舌",@"抓狂",@"尴尬",@"可爱",@"发怒",@"流汗",@"微笑",@"感冒",@"土豪",@"偷笑",@"很酷",@"衰呀",@"惊讶",@"骂人",@"鄙视",@"抠鼻",@"动心",@"鼓掌",@"囧了",@"怀疑",@"吐了",@"咪笑",@"高兴",@"思考",@"左哼",@"右哼",@"小声",@"委屈",@"哈欠",@"压力",@"疑问",@"眨眼",@"害羞",@"难过",@"拜拜",@"苹果",@"很棒",@"很弱",@"给力",@"云彩",@"朋友",@"威武",@"照相",@"汽车",@"飞机",@"爱心",@"机器",@"粉兔",@"熊猫",@"NO",@"OK",@"赞了",@"来吧",@"胜利",@"爱你",@"加油",@"小气",@"握手",@"玫瑰",@"红心",@"心碎",@"猪头",@"咖啡",@"K歌",@"晚安",@"太阳",@"喝茶",@"很萌",@"礼物",@"互粉",@"钟表",@"单车",@"蛋糕",@"围巾",@"手套",@"雪花",@"雪人",@"帽子",@"绿叶",@"足球",@"赞", nil];
    
    return hanzData;
}

+ (UIImage *)themeImageWithImageName:(NSString *)name
{
    return [UIImage imageNamed:name];
}
@end
