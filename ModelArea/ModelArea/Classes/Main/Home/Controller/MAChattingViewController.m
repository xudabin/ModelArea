//
//  MAChattingViewController.m
//  ModelArea
//
//  Created by mac on 15/8/17.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAChattingViewController.h"
#import "MAMessageFrameModel.h"
#import "MAInputView.h"
#import "MAMessageModel.h"
#import "MAMessageCell.h"


@interface MAChattingViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate, MAInputViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *messageFrames;
@property (nonatomic, strong)NSDictionary *autoReplays;
@property (nonatomic, weak) MAInputView *inputView;

@end

@implementation MAChattingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"kelly";
    self.navigationItem.rightBarButtonItem = nil;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - InputViewHeight)];
    self.tableView.backgroundColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //移除分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //不让选中
    self.tableView.allowsSelection = NO;
    [self.view addSubview:_tableView];
    
    [self setupInputView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)setupInputView {
    MAInputView *inputView = [MAInputView inputView];
    inputView.frame = CGRectMake(0, self.view.height-InputViewHeight, self.view.width, InputViewHeight);
    inputView.inputArea.delegate = self;
    inputView.delegate = self;
    [self.view addSubview:inputView];
    self.inputView = inputView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    
    CGRect keyboardF = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [info[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    int curve = [info[UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:curve];
        self.view.transform = CGAffineTransformMakeTranslation(0, keyboardF.origin.y - self.view.height);
    }];
}

/**
 *  数据frame模型
 *
 */
- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            
            MAMessageModel *msg = [MAMessageModel messageWithDict:dict];
            
            //是否需要隐藏时间
            MAMessageFrameModel *lastFm = [arr lastObject];
            
            msg.hideTime = [lastFm.message.time isEqualToString:msg.time];
            
            MAMessageFrameModel *fm = [[MAMessageFrameModel alloc]init];
            fm.message = msg;
            
            [arr addObject:fm];
        }
        _messageFrames = arr;
        
    }
    return _messageFrames;
}

/**
 *  自动回复的懒加载
 */
- (NSDictionary *)autoReplays
{
    if (_autoReplays == nil) {
        
        _autoReplays = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autoReplay.plist" ofType:nil]];
    }
    
    return _autoReplays;
}


/**
 *  添加一条消息
 *
 */
- (void)addMessageWithText:(NSString *)text andType:(MAMessageModelType)type
{
    MAMessageModel *model = [[MAMessageModel alloc]init];
    model.text = text;
    
    NSDate *date = [[NSDate alloc]init];
    
    NSDateFormatter *dateFt = [[NSDateFormatter alloc]init];
    dateFt.dateFormat = @"HH:mm";
    
    model.time = [dateFt stringFromDate:date];
    model.type = type;
    
    //是否需要隐藏事件
    MAMessageFrameModel *lastFm = [self.messageFrames lastObject];
    model.hideTime = [lastFm.message.time isEqualToString:model.time];
    
    MAMessageFrameModel *fm = [[MAMessageFrameModel alloc]init];
    fm.message = model;
    
    [self.messageFrames addObject:fm];
}

/**
 *  自动回复
 */
- (NSString *)autoPlayMessage:(NSString *)text
{
    for (int i = 0; i < text.length; i ++) {
        //依次截取输入框的每一个字符串
        NSString *word = [text substringWithRange:NSMakeRange(i, 1)];
        
        if (self.autoReplays[word]) return self.autoReplays[word];
        
        
    }
    
    return @"厉害";
    
}

#pragma mark - 输入框的代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //1.改变模型数据
    [self addMessageWithText:textField.text andType:MAMessageModelGatsby];
    
    
    //1.5 自动回复
    [self addMessageWithText:[self autoPlayMessage:textField.text] andType:MAMessageModelJobs];
    
    
    //2. 刷新表格
    [self.tableView reloadData];
    
    //3. 自动滚到最后一条
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    //4. 清空输入框
    self.inputView.inputArea.text = nil;
    
    return YES;
}

#pragma mark - tableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"messageCell";
    MAMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MAMessageCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.messageFrame = self.messageFrames[indexPath.row];
    return cell;
}

#pragma mark - tableView代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MAMessageFrameModel *mf = self.messageFrames[indexPath.row];
    
    return mf.cellHeight;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - MAInputViewDelegate

- (void)inputView:(MAInputView *)inputView didClickButton:(MAInputViewButtonType)type {
    switch (type) {
        case MAInputViewButtonTypeVoice:
            NSLog(@"发送语音");
            break;
        case MAInputViewButtonTypeSmile:
            NSLog(@"发送表情");
            break;
        case MAInputViewButtonTypeUpload:
            NSLog(@"发送文件");
            //[self sendFile];
            break;
    }
}

- (void)sendVoice {

}

- (void)sendSmile {
    [self sendFile];
}

- (void)sendFile {
    self.inputView.inputArea.inputView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height, self.view.width, 120)];
}


@end
