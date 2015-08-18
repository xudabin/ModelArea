//
//  MAInputAccessoryView.h
//  ModelArea
//
//  Created by mac on 15/8/17.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
static const CGFloat InputViewHeight = 44;

typedef NS_ENUM(NSUInteger, MAInputViewButtonType) {
    MAInputViewButtonTypeVoice, //发送语音
    MAInputViewButtonTypeSmile, //发送表情
    MAInputViewButtonTypeUpload, //发送文件
};

@class MAInputView;
@protocol MAInputViewDelegate <NSObject>

@optional
- (void)inputView:(MAInputView *)inputView didClickButton:(MAInputViewButtonType)type;

@end

@interface MAInputView : UIView

@property (nonatomic, weak) IBOutlet UITextField *inputArea;
@property (nonatomic, weak) id<MAInputViewDelegate> delegate;
+ (instancetype)inputView;

@end
