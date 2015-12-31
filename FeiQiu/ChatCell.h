//
//  ChatCell.h
//  FeiQiu
//
//  Created by zhaoyan on 12/28/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ICON_WIDTH 30
#define ICON_HEIGHT 30
#define WIDTH [UIScreen mainScreen].bounds.size.width

typedef NS_ENUM(NSInteger , ChatCellType)
{
    ChatCellTypeSelf=0,
    ChatCellTypeOther,
    ChatCellTypeNone,
};

@interface ChatCell : UITableViewCell

@property (nonatomic , assign) ChatCellType type;
@property (nonatomic , strong) NSString * text;

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
                        type:(ChatCellType) type;
-(CGFloat)getCellHeight;
@end
