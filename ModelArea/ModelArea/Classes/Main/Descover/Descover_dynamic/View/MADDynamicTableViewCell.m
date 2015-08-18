//
//  MADynamicTableViewCell.m
//  ModelArea
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADDynamicTableViewCell.h"
#import "DUserCellFrame.h"
#import "DUser.h"
#import "SDPhotoGroup.h"
#import "SDPhotoItem.h"
#define IMAGEWIDTH  (kScreenWidth-120)/3

@implementation MADDynamicTableViewCell
{
   NSArray *_srcStringArray;
    NSArray *_detailCommentArray;
    CGFloat _cellHeight;
    
}
- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _photoImageView =[[UIImageView alloc]initWithFrame:CGRectMake(20/2, 30/2, 110/2, 110/2)];
        [self addSubview:_photoImageView];
        _nameLabel =[[UILabel alloc]init];
        [self addSubview:_nameLabel];
        
        _timeLabel =[[UILabel alloc]init];
        _timeLabel.textAlignment =NSTextAlignmentRight;
        [self addSubview:_timeLabel];
        
        _detailTxetLabel =[[UILabel alloc]init];
        
        _detailTxetLabel.numberOfLines =0;
        [self addSubview:_detailTxetLabel];
        
        _view =[[UIView alloc]init] ;

               [self addSubview:_view];
        
        
         

//        _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(150/2, 30/2, 100, 15)];
//        _nameLabel.textAlignment =NSTextAlignmentLeft;
//        [self addSubview:_nameLabel];
        
//        _timeLabel =[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-10-50, 30/2, 50, 15)];
//        _timeLabel.textAlignment =NSTextAlignmentRight;
//        [self addSubview:_timeLabel];
        
//        _detailTxetLabel =[[UILabel alloc]initWithFrame:CGRectMake(150/2, 15+15+10,rect.size.width-90, 50)];
//        _detailTxetLabel.font =[UIFont systemFontOfSize:13];
//        [_detailTxetLabel setNumberOfLines:0];
//        [self addSubview:_detailTxetLabel];
        
//        for (int i=0; i<6; i++) {
//            _detailPhotoButton =[[UIButton alloc]initWithFrame:CGRectMake(150/2+(IMAGEWIDTH*2+15)/2*(i%3), 100+(IMAGEWIDTH*2+15)/2*(i/3), IMAGEWIDTH, IMAGEWIDTH)];
//           _detailPhotoButton.backgroundColor =[UIColor colorWithHue:arc4random()%256/255.0 saturation:arc4random()%256/255.0 brightness:arc4random()%256/255.0 alpha:1];
//    
//            _detailPhotoButton.tag =i+1;
//            
//            [self addSubview:_detailPhotoButton];
//}
//        _view =[[UIView alloc]initWithFrame:CGRectMake(130/2, 170/2, rect.size.width, 150)]
//        ;
//        [self addSubview:_view];
        _loveButton =[[UIButton alloc]init];
        _loveButton.tag =1;
        [self addSubview:_loveButton];
        _loveLabel =[[UILabel alloc]init];
        [self addSubview:_loveLabel];
        _commentButton =[[UIButton alloc]init];
        _commentButton .tag =2;
        [self addSubview:_commentButton];
        
        _commentLabel =[[UILabel alloc]init];
        _commentLabel.font =[UIFont systemFontOfSize:15];
        _kitNumButton =[[UIButton  alloc]init];
        [self addSubview:_kitNumButton];
        _kitNumLabel =[[UILabel alloc]init];
        [self addSubview:_kitNumLabel];
        
        NSArray *array =_userCellFrame.user.Array;
        NSLog(@"++++++++++++++++%lu",array.count);
        [self addSubview:_commentLabel];
        _detailCommentArray =@[@"hvbh :你好",@"Kitty 回复hvbh: you too",@"hvbh :在干啥呢",@"Kitty 回复hvbh:无聊中",@"hvbh :有空不？",@"Kitty 回复hvbh:有空不，咋哪，有啊",@"hvbh :请你吃饭",@"Kitty 回复hvbh:好啊，什么时候"];
       
       
        for (int i=0; i<_detailCommentArray.count; i++) {
              _detailCommentLabel =[[UILabel alloc]init];
            
            _detailCommentLabel .frame =CGRectMake(150/2, 320+(15+5)*i, 200, 15);
            NSLog(@"%@",_detailCommentLabel.text);
            _detailCommentLabel .text =_detailCommentArray[i];
            [self addSubview:_detailCommentLabel];
        }

      
    }
    return self;
}
- (void)setUserCellFrame:(DUserCellFrame *)userCellFrame
{
    _userCellFrame =userCellFrame;
    self.photoImageView.image =[UIImage imageNamed:userCellFrame.user.userImage];
    self.nameLabel.text =userCellFrame.user.userName;
    self.nameLabel.frame =userCellFrame.nameF;
    self.timeLabel.text =userCellFrame.user.time;
    self.timeLabel.frame =userCellFrame.timeF;
    self.detailTxetLabel.text =userCellFrame.user.content;
    self.detailTxetLabel.frame =userCellFrame.contentF;
    self.loveLabel.text =userCellFrame.user.loveCount;
    self.commentLabel.text =userCellFrame.user.commentCount;
    _srcStringArray =[[NSArray alloc]init];
    _srcStringArray =userCellFrame.user.Array;
    if (userCellFrame.user.Array.count !=0) {
        self.view.frame =userCellFrame.viewF;
        SDPhotoGroup *photoGroup = [[SDPhotoGroup alloc] init];
        
        NSMutableArray *temp = [NSMutableArray array];
        [_srcStringArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
            SDPhotoItem *item = [[SDPhotoItem alloc] init];
            item.thumbnail_pic = src;
            
            [temp addObject:item];
        }];
        
        photoGroup.photoItemArray = [temp copy];
        [_view addSubview:photoGroup];
        
        self.loveButton.frame =CGRectMake((150+IMAGEWIDTH)/2, userCellFrame.cellHeight-30, 48/2, 40/2);
        self.loveLabel.frame  =CGRectMake((180+IMAGEWIDTH+44)/2, userCellFrame.cellHeight-210, 40, 15);
        self.commentButton.frame =CGRectMake(((150+IMAGEWIDTH)/2+70), userCellFrame.cellHeight-210, 44/2, 40/2);
        self.commentLabel.frame =CGRectMake(((150+IMAGEWIDTH)/2+100), userCellFrame.cellHeight-210,  40, 15);
        self.kitNumButton.frame =CGRectMake(((150+IMAGEWIDTH)/2+150), userCellFrame.cellHeight-210, 44/2, 26/2);
        self.kitNumLabel.frame =CGRectMake(((150+IMAGEWIDTH)/2+180), userCellFrame.cellHeight-210, 40, 15);
    }
    self.kitNumButton.frame =CGRectMake(((150+IMAGEWIDTH)/2+150), userCellFrame.cellHeight-210, 44/2, 26/2);
    [self.kitNumButton setBackgroundImage:[UIImage imageNamed:@"kitnumber"] forState:UIControlStateNormal];
    self.kitNumLabel.frame =CGRectMake(((150+IMAGEWIDTH)/2+180), userCellFrame.cellHeight-210, 40, 15);
    self.kitNumLabel.text =@"10";
     self.commentLabel.frame =CGRectMake(((150+IMAGEWIDTH)/2+100), userCellFrame.cellHeight-210,  40, 15);
    self.commentButton.frame =CGRectMake(((150+IMAGEWIDTH)/2+70), userCellFrame.cellHeight-210, 44/2, 40/2);
    self.loveButton.frame =CGRectMake((150+IMAGEWIDTH)/2, userCellFrame.cellHeight-210, 48/2, 40/2);
    self.loveLabel.frame  =CGRectMake((180+IMAGEWIDTH+44)/2, userCellFrame.cellHeight-210, 40, 15);
    [self.loveButton setBackgroundImage:[UIImage imageNamed:userCellFrame.user.loveImage] forState:UIControlStateNormal];
    [self.commentButton setBackgroundImage:[UIImage imageNamed:userCellFrame.user.commentImage] forState:UIControlStateNormal];
    
    _detailCommentArray =[[NSArray alloc]init];
    _detailCommentArray =userCellFrame.user.detailCommentArray;
  
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
