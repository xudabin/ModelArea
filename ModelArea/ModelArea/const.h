//
//  const.h
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef ModelArea_const_h
#define ModelArea_const_h

#define MAColor(r, g, b, a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define MASETIMAGE(imageNamed) [UIImage imageNamed:(imageNamed)]
#define MAFONT_SIZE(size) [UIFont systemFontOfSize:(size)]

#define kDefaultColor MAColor(251.0f, 101.0f, 144.0f, 1) //主题色 红色
#define kDefaultTextColor [UIColor whiteColor] //默认字体色
#define kSEPARATOR_COLOR MAColor(225.0f, 225.0f, 227.0f, 1)    //分割线颜色
#define kTABLEVIEW_BACKGROUND MAColor(238.0f, 238.0f, 243.0f, 1) //tableview背景色
#define kDEFAULT_BLACKCOLOR MAColor(43.0f, 43.0f, 43.0f, 1)     //默认黑色
#define kDEFAULT_GRAYCOLOR MAColor(153.0f, 153.0f, 153.0f, 1)     //默认灰色
#define kBLACKCOLOR [UIColor blackColor]

#define kDEFAULT_BLUECOLOR MAColor(80.0, 156.0, 252.0, 1) //默认的蓝色
#define  kSCREEN_SCALE [UIScreen mainScreen].scale*0.5

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenRect [UIScreen mainScreen].bounds

#define IS_IOS_8 [[UIDevice currentDevice] systemVersion].floatValue >= 8.0
#define IS_IPHONEPLUS kScreenWidth > 375 ? YES : NO


#define NavBarHeight IS_IPHONEPLUS ? 93.0 : 64.0

#define BAR_HEIGHT 50

//---------------------------------------------------------

#define HOST @"http://192.168.0.3:8080/MoJieServer/"
#define NetWorkNOReachableError @"网络连接不太顺畅"
#define CouldNotConnectError @"网络连接不太顺畅"

//----------------------注册页面------------------------------

#define MSG_APPKEY @"922660c50904"
#define MSG_APPSECRET @"b8945e8054dd8963f9e39e7fdf612f7d"

#define TEXT_MINI_LENGTH 8
#define TEXT_MAX_LENGTH 16
#define PWD_MINI_LENGTH 8
#define PWD_MAX_LENGTH 16


//#if IS_IPHONEPLUS
//#define NavBarHeight 96
//#else
//#define NavBarHeight 64
//#endif
/**
    计算文本的大小
 */
CGRect getRectFromText(NSString *text, CGSize size, UIFont *font);

#define kDEFAULT_ROWHEIGHT 50

#endif
