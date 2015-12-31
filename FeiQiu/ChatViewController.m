//
//  ChatViewController.m
//  FeiQiu
//
//  Created by zhaoyan on 12/28/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatCell.h"
@implementation ChatViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.rows addObject:@"a jflajs dlfjasljffskajf"];
    [self.rows addObject:@"zhaoy ang nihao wofsjfjalf \n ajfdajslfjaljflajslfjla"];
    [self.rows addObject:@"zhaoyang nihao wofsjfjalf \n ajfdajslfjaljflajslfjlasdf1as3df132as1fd23a1sf1sa231f2as1df23a123s1f23a1sd2 3f1as231d f23as1f23  1as21f2as1d2f1  as2df1asdfasd4f564as65f4a6s4fd654as56d4f5sa4f54sa5f4a56s4df56a4s5fd4 as534f3 5as14fd351as3 df21as2 df3a1s32df1a32s1f32a1s32f1a32s1f32 a1s3 2f1a32s1f321 as321f3as1 f31as3f1a3s1f31a"];
     [self.rows addObject:@"zhaoyang nihao wofsjfjalf \n ajfdajslfjaljflajslfjlasdf1as3df132as1fd23a1sf1sa231f2as1df23a123s1f23a1sd2 3f1as231d f23as1f23  1as21f2as1d2f1  as2df1asdfasd4f564as65f4a6s4fd654as56d4f5sa4f54sa5f4a56s4df56a4s5fd4 as534f3 5as14fd351as3 df21as2 df3a1s32df1a32s1f32a1s32f1a32s1f32 a1s3 2f1a32s1f321 as321f3as1 f31as3f1a3s1f31a地方所发生的"];
    [self.rows addObject:@"zhaoyang nihao wofsjfjalf \n ajfdajslfjaljflajslfjlasdf1as3df132as1fd23a1sf1sa231f2as1df23a123s1f23a1sd2 3f1as231d f23as1f23  1as21f2as1d2f1  as2df1asdfasd4f564as65f4a6s4fd654as56d4f5sa4f54sa5f4a56s4df56a4s5fd4 as534f3 5as14fd351as3 df21as2 df3a1s32df1a32s1f32a1s32f1a32s1f32 a1s3 2f1a32s1f321 as321f3as1 f31as3f1a3s1f31a地方所发生的眨眼啊都手法讲述了附近阿里"];
    [self.rows addObject:@"啊时间对方拉升房价阿里开发建设局发阿司法局阿拉斯加发送计算法考虑将阿里上开发按揭付款就阿里看风景睡觉奥放假啊水立方阿克苏减肥了就爱上就阿斯顿发科技阿里就暗示将地方啦1f31a地方所发生的"];
    [self.rows addObject:@"zhaoyang nihao wofsjfjalf \n ajfdajslfjaljflajslfjlasdf1as3df132as1fd23a1sf1sa231f2as1df23a123s1f23a1sd2 3f1as231d f23as1f23  1as21f2as1d2f1  as2df1as阿斯顿福建按时间段飞阿斯顿积分卡萨飞阿斯科利放假阿雷克斯京东方啊时间分开就阿里康师傅健身房里看见啦发生会计法拉克是进啊就是分了就阿斯利康2a1s32f1a32s1f32 a1s3 2f1a32s1f321 as321f3as1 f31as3f1a3s1f31a地方所发生的"];
    [self.rows addObject:@"zhaoyang nihao wofsjfjalf \n ajfdajslfjaljflajslfjlasdf1a阿斯顿是打发首付款垃圾啊发了激发健身房揭发你哈哈饭覅阿海珐减肥啦书法家垃圾费拉进来那覅覅拉客积分卡拉家乐福拉法基垃圾来发掘了房价阿里发酒疯垃圾啊浪费爱疯阿里解放垃圾2f1a32s1f32 a1s3 2f1a32s1f321 as321f3as1 f31as3f1a3s1f31a地方所发生的"];
    [self.rows addObject:@"zhaoyang nihao wofsjfjalf \n ajfdajslfjaljflajslfjlasdf1as3df132as1fd23a1sf1sa231f2as1df23a123s1f23a1sd2 3f1as231d f23as1f23  1as21f2as1d2f1  as2df1asdfasd4f564阿飞是的撒发生发的说法洒水法师法师的法师啊发顺丰啊2s1f32 a1s3 2f1a32s1f321 as321f3as1 f31as3f1a3s1f31a地方所发生的"];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.tableView.frame = self.view.bounds;
    NSLog(@"%@:%@",self,NSStringFromSelector(_cmd));
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@:%@",self,NSStringFromSelector(_cmd));
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%@:%@",self,NSStringFromSelector(_cmd));
}

-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%@:%@",self,NSStringFromSelector(_cmd));
}

#pragma mark - tableViewDelegate


#pragma mark - tableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rows.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatCell * cell = (ChatCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return  [cell getCellHeight];
}

static NSString * ID = @"chatCell";
-(ChatCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    ChatCellType type = ChatCellTypeSelf;
    if (indexPath.row %2 ==0)
    {
        type = ChatCellTypeOther;
    }
    if (!cell)
    {
       
        cell = [[ChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID ];
    }
    cell.text = [self.rows objectAtIndex:indexPath.row];
    cell.type = type;
    return cell;
}


@end
