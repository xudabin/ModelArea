//
//  MASearchViewController.m
//  ModelArea
//
//  Created by mac on 15/8/3.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MADSearchViewController.h"

@interface MADSearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>

@end

@implementation MADSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem rightItemWithTarget:self action:nil image:nil highLighted:nil];
    _dataArray= [[NSMutableArray alloc]initWithObjects:@"123",@"456",@"124",@"ytre",@"tyre",@"vbn",@"6785",@"6453",@"hgfd",@ "hgfd",@"iuyt",@"78654",nil];
    _resultArray =[[NSMutableArray alloc]init];
    UITableView *tableView =[[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.delegate =self;
    tableView.dataSource =self;
    tableView.tag =1;
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UISearchBar *searchBar =[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    searchBar.placeholder =@"搜索";
    searchBar.scopeButtonTitles=@[@"按首字母搜索",@"按包含搜素"];
    tableView.tableHeaderView =searchBar;
    _dispiay =[[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
    _dispiay.searchResultsDataSource =self;
    _dispiay.delegate =self;
    [_dispiay.searchResultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag ==1) {
        return _dataArray.count;
    }
    return _resultArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (tableView.tag==1) {
         cell.textLabel.text =_dataArray[indexPath.row];
    }else{
        NSLog(@"++++++++%d",_resultArray.count);
    cell.textLabel.text =_resultArray[indexPath.row];
    }
    return cell;
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    NSString *searchString =controller.searchBar.text;
    [self searchDisplayController:controller shouldReloadTableForSearchString:searchString];
    return YES;
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString

{   //把上次的搜索结果 删除
    [_resultArray removeAllObjects];
    
    
    //判断 现在的 搜索 条件 是什么 ？
    int  index = controller.searchBar.selectedScopeButtonIndex ;
    //需要把 满足条件的数据添加 到_resultArray 中
    
    //找到待搜索的数据（_dataArray）中，满足条件的数据，添加到_resultArray
    
    //按照首字母搜索
    if (index == 0)
    {
        for (int i = 0 ; i < _dataArray.count; i++)
        {
            NSString * str = _dataArray[i];
            //判断str是否以searchString为前缀
            if ([str hasPrefix:searchString])
            {
                [_resultArray addObject:str];
            }
        }
    }
    
    //按照 包含搜索
    if (index == 1)
    {
        for (int i = 0; i < _dataArray.count; i++)
        {
            //是否包含 判断
            NSString * str  = _dataArray[i];
            
            NSRange range = [str rangeOfString:searchString];
            if (range.location != NSNotFound)
            {
                //包含
                [_resultArray addObject:str];
            }
            
        }
    }

    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
