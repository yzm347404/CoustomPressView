//
//  Define.h
//  CoustomPressView
//
//  Created by 杨振民 on 16/3/4.
//  Copyright © 2016年 杨振民. All rights reserved.
//

#ifndef Define_h
#define Define_h
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define BEGIN_FLAG    @"<f"
#define END_FLAG      @">"
#define HANZ_START_FLAG @"["
#define HANZ_END_FLAG @"]"
#endif /* Define_h */
