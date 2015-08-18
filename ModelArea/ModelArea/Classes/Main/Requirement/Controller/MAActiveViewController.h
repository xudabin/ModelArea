//
//  MAActiveViewController.h
//  ModelArea
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAAlreadyTableViewCell.h"
#import "MAReqActTableViewCell.h"
#import "MALeaveMessageTableViewCell.h"

@interface MAActiveViewController : UIViewController<MAReqActTableViewCellDelegate,MAAlreadyTableViewCellDelegate,MALeaveMessageTableViewCellDelegate>



//用来确定在上一界面点击的是那一行，通过该行来发送请求，获取数据来布表
@property(nonatomic,assign)int didSelectedRow;

@end
