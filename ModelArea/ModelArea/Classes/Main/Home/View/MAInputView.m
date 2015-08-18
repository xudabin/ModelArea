//
//  MAInputAccessoryView.m
//  ModelArea
//
//  Created by mac on 15/8/17.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAInputView.h"

@interface MAInputView ()
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;
@property (weak, nonatomic) IBOutlet UIButton *smileButton;
@property (weak, nonatomic) IBOutlet UIButton *uploadButton;

@end


@implementation MAInputView

+ (instancetype)inputView {
    return [[[NSBundle mainBundle] loadNibNamed:@"MAInputView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    self.voiceButton.tag = MAInputViewButtonTypeVoice;
    [self.voiceButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.smileButton.tag = MAInputViewButtonTypeSmile;
    [self.smileButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.uploadButton.tag = MAInputViewButtonTypeUpload;
    [self.uploadButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(inputView: didClickButton:)]) {
        [self.delegate inputView:self didClickButton:sender.tag];
        
    }
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.width = kScreenWidth;
//        self.height = InputViewHeight;
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chat_bottom_bg"]];
//        
//        [self setupButton:@"chat_bottom_voice_nor" heighted:@"chat_bottom_voice_press"];
//        [self setupInputView];
//        [self setupButton:@"chat_bottom_smile_nor" heighted:@"chat_bottom_smile_nor"];
//        [self setupButton:@"chat_bottom_up_nor" heighted:@"chat_bottom_up_press"];
//    }
//    return self;
//}
//
//- (void)setupButton:(NSString *)image heighted:(NSString *)heighted {
//    UIButton *button = [[UIButton alloc] init];
//    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:heighted] forState:UIControlStateHighlighted];
//    [self addSubview:button];
//}
//
//- (void)setupInputView {
//    UITextField *textField = [[UITextField alloc] init];
//    textField.background = [UIImage imageNamed:@"chat_bottom_textfield"];
//    [self addSubview:textField];
//    self.inputArea = textField;
//}
//
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    for (NSUInteger i=0; i<self.subviews.count; i++) {
//        UIView *view = (UIView *)self.subviews[i];
//        view.frame = CGRectMake(i*ButtonWidth, 0, ButtonWidth, InputViewHeight);
//        if (i == 1) {
//            view.frame = CGRectMake(i*ButtonWidth+Spacing, (InputViewHeight-TextFieldH)/2, TextFieldW, TextFieldH);
//        }
//        if (i > 1) {
//            view.frame = CGRectMake(CGRectGetMaxX(self.inputView.frame)+(i-2)*ButtonWidth+Spacing, 0, ButtonWidth, InputViewHeight);
//        }
//        
//    }
//}

@end
