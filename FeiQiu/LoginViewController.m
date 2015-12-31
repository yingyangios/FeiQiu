//
//  LoginViewController.m
//  FeiQiu
//
//  Created by zhaoyan on 12/28/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "LoginViewController.h"
#import "ChatViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define BTN_X WIDTH * 0.3
#define BTN_Y HEIGHT * 0.16

@interface LoginViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic , weak) UIButton * avatar;
@property (nonatomic , weak) UILabel * IPLabel;
@property (nonatomic , weak) UITextField * userNameFeild;
@property (nonatomic , strong) UIImage * avatarImage;

@end

@implementation LoginViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _avatarImage = [UIImage imageWithContentsOfFile:[self getImageFilePath:@"avatar.plist"]];
    
    UIButton * avatar = [[UIButton alloc]initWithFrame:CGRectMake(BTN_X, BTN_Y , 80, 80)];
    [avatar setCenter:CGPointMake(WIDTH / 2, BTN_Y + 80/2)];
    avatar.layer.cornerRadius = 80/ 2;
    avatar.layer.borderWidth = 1.f;
    avatar.layer.borderColor = [[UIColor darkGrayColor]CGColor];
    avatar.layer.masksToBounds = YES;
    [avatar setBackgroundImage:_avatarImage forState:UIControlStateNormal];
    [avatar setBackgroundImage:_avatarImage forState:UIControlStateHighlighted];
    
    [avatar addTarget:self
               action:@selector(getAvatarButton:)
     forControlEvents:UIControlEventTouchUpInside];
    self.avatar = avatar;
    [self.view  addSubview:avatar];
    
    UITextField * userNameFeild = [[UITextField alloc]initWithFrame:CGRectMake(BTN_X -20, BTN_Y + 120, 120, 36)];
    [userNameFeild setCenter:CGPointMake(WIDTH / 2, BTN_Y + 120+36/2)];
    userNameFeild.placeholder = @"Name";
    userNameFeild.textAlignment = NSTextAlignmentCenter;
    userNameFeild.textColor = [UIColor blackColor];
    userNameFeild.layer.borderColor = [[UIColor darkGrayColor]CGColor];
    userNameFeild.layer.borderWidth = 1.f;
    userNameFeild.layer.cornerRadius = 5.f;
    userNameFeild.text =[[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    self.userNameFeild =userNameFeild;
    [self.view addSubview:userNameFeild];
    
    UILabel * IPLabel = [[UILabel alloc]initWithFrame:CGRectMake(BTN_X - 20, BTN_Y + 170, 120, 36)];
    [IPLabel setCenter:CGPointMake(WIDTH /2, BTN_Y + 170 + 18)];
    IPLabel.textColor = [UIColor blackColor];
    IPLabel.text = @"127.0.0.1";
    IPLabel.textAlignment = NSTextAlignmentCenter;
    IPLabel.layer.borderWidth = 1.f;
    IPLabel.layer.borderColor = [[UIColor darkGrayColor]CGColor];
    IPLabel.layer.cornerRadius = 5.f;
    self.IPLabel = IPLabel;
    [self.view addSubview:IPLabel];
    
    UIButton * loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(BTN_X, BTN_Y + 220, 60, 44)];
    [loginBtn setCenter:CGPointMake(WIDTH / 2, BTN_Y +220 +22)];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginBtn.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    loginBtn.layer.borderWidth = 1.f;
    loginBtn.layer.cornerRadius = 6.f;
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginBtn];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
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
#pragma mark - getAvatar

- (void)getAvatarButton:(UIButton *)sender
{
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    [picker setAllowsEditing:YES];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:picker animated:YES completion:nil];
    
    picker.delegate =self;
    
}

#pragma mark - login

- (void)login:(UIButton *)sender
{
    [_userNameFeild resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setObject:_userNameFeild.text forKey:@"userName"];
  
    ChatViewController * chatVC = [[ChatViewController alloc]init];
    [chatVC pushToStack];
}

#pragma mark - imagePickerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"%@",info);
    UIImage * image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    [self.avatar setBackgroundImage:image forState:UIControlStateNormal];
    [self.avatar setBackgroundImage:image forState:UIControlStateHighlighted];
    _avatarImage = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString * path = [self getImageFilePath:@"avatar.plist"];
    NSLog(@"path %@",path);
    NSData * imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:path atomically:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - private
-(NSString *) getImageFilePath:(NSString *)file
{
    NSString * documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask , YES) objectAtIndex:0];
    NSString * path = [documentPath stringByAppendingPathComponent:file];
    return path;
}
@end
