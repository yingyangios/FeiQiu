//
//  ChatCell.m
//  FeiQiu
//
//  Created by zhaoyan on 12/28/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "ChatCell.h"
#import "UIButton+BackImage.h"
#import "ToolUtil.h"
@interface ChatCell ()

@property (nonatomic , weak) UIButton * avatarBtn;
@property (nonatomic , weak) UITextView * textView;
@property (nonatomic , weak) UILabel * timeLabel;
@property (nonatomic , strong) UIImage * bubble;
@property (nonatomic , weak) UIImageView * bubbleView;
@property (nonatomic , assign) CGFloat bubbleViewHeight;
@property (nonatomic , assign) CGFloat bubbleViewWidth;
@property (nonatomic , strong) NSArray * bubbleImages;

@end

@implementation ChatCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
                        
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.textLabel.hidden = YES;
        self.imageView.hidden = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton * avatartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        avatartBtn.layer.masksToBounds = YES;
        avatartBtn.layer.cornerRadius = ICON_HEIGHT / 2;
        [self.contentView addSubview:avatartBtn];
        self.avatarBtn = avatartBtn;
        
        UITextView * textView = [[UITextView alloc]init];
        textView.editable = NO;
        textView.showsHorizontalScrollIndicator = NO;
        textView.showsVerticalScrollIndicator = NO;
        textView.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
        textView.textColor = [UIColor blackColor];
        textView.backgroundColor = [UIColor clearColor];
        self.textView = textView;
        
        
        UILabel * timeLabel = [[UILabel alloc]init];
        timeLabel.font = [UIFont systemFontOfSize:12];
        timeLabel.textColor = [UIColor darkGrayColor];
        timeLabel.bounds = CGRectMake(0, 0, 100, 10);
        timeLabel.center = CGPointMake(WIDTH / 2, 5);
        timeLabel.text = @"";
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        UIImageView * bubbleView = [[UIImageView alloc]init];
        [bubbleView addSubview:self.textView];
        [self.contentView addSubview:bubbleView];
        
        self.bubbleView = bubbleView;
        
        if (!_bubbleImages)
        {
            _bubbleImages =@[@"bubble-classic-square-blue",@"bubble-classic-square-gray"];
        }
        
    }
    return self;
}

#pragma mark - property

-(void)setType:(ChatCellType)type
{
    _type = type;
    UIImage * bubbleImage = [UIImage imageNamed:_bubbleImages[type]];
    CGSize size = [self caculateTextSzie:_textView.text];
    
    switch (type)
    {
        case ChatCellTypeOther:
        {
            
            UIImage * orientationImage = [[UIImage alloc]initWithCGImage:bubbleImage.CGImage
                                                                   scale:bubbleImage.scale
                                                             orientation:UIImageOrientationDown];
            _bubble = orientationImage;
            _bubble = [orientationImage resizableImageWithCapInsets:UIEdgeInsetsMake(15.0f, 20, 15.0f, 20.0f)
                                                       resizingMode:UIImageResizingModeStretch];
            
            [_avatarBtn setBackgroundImageWithFilePath:[ToolUtil getImageFilePath:@"avatar.plist"] isLocal:YES forState:UIControlStateNormal];
            self.textView.frame = CGRectMake(15, 5, size.width+5, size.height);
            break;
        }
        case ChatCellTypeSelf:
        {
            bubbleImage = [[UIImage alloc]initWithCGImage:bubbleImage.CGImage
                                                        scale:bubbleImage.scale
                                                  orientation:UIImageOrientationDownMirrored];
            _bubble = [bubbleImage resizableImageWithCapInsets:UIEdgeInsetsMake(15.0f, 20, 15.0f, 20.0f)
                                                       resizingMode:UIImageResizingModeStretch];
            [_avatarBtn setBackgroundImageWithFilePath:[ToolUtil getImageFilePath:@"avatar.plist"] isLocal:YES forState:UIControlStateNormal];
            self.textView.frame = CGRectMake(10, 5, size.width, size.height);
            break;
        }
            
        default:
            break;
    }
    self.bubbleViewHeight = _textView.frame.size.height + 10;
    self.bubbleViewWidth = _textView.frame.size.width + 25;
    self.bubbleView.image = _bubble;
    
}

-(void)setText:(NSString *)text
{
    _text = text;
    self.textView.text = text;
}

#pragma mark - private
-(CGSize)caculateTextSzie:(NSString *)text
{
    CGSize size;
//    for ios 6
//    size = [text sizeWithFont:_textView.font constrainedToSize:CGSizeMake(WIDTH * 0.6, 0) lineBreakMode:NSLineBreakByWordWrapping];
    size = [text boundingRectWithSize:CGSizeMake(WIDTH * 0.6, 0) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_textView.font} context:nil].size;
    // caculation size is smaller than actually
    CGFloat width = size.width + 20;
    CGFloat height = size.height + 20;
    return CGSizeMake(width, height);
}

-(CGFloat)getCellHeight
{
    CGFloat height = 0.0f;
    
    height = ICON_HEIGHT > _bubbleViewHeight ? ICON_HEIGHT  : _bubbleViewHeight + 10;
    return height + 5;
}


#pragma mark - layoutSubView

-(void)layoutSubviews
{
    switch (_type)
    {
        case ChatCellTypeOther:
        {
            _avatarBtn.frame = CGRectMake(10, 10, ICON_WIDTH, ICON_HEIGHT);
            _bubbleView.frame = CGRectMake(10*2 + ICON_WIDTH , 10, _textView.frame.size.width + 20, _textView.frame.size.height + 10);
            
            break;
        }
        case ChatCellTypeSelf:
        {
            _bubbleView.frame = CGRectMake(WIDTH - _bubbleViewWidth- ICON_WIDTH - 10 , 10, _textView.frame.size.width + 10, _textView.frame.size.height + 10);
            _avatarBtn.frame = CGRectMake(WIDTH -10 - ICON_WIDTH, 10, ICON_WIDTH, ICON_HEIGHT);
            break;
        }
            
        default:
            break;
    }
//    self.textView.center = _bubbleView.center;
    NSLog(@"bubbleView:%@",NSStringFromCGRect(_bubbleView.frame));
    NSLog(@"textView:%@",NSStringFromCGRect(_textView.frame));
}

#pragma mark - reuseCell

-(void)prepareForReuse
{
    [super prepareForReuse];
}


@end
