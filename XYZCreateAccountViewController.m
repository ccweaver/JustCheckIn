//
//  XYZCreateAccountViewController.m
//  JustCheckIn
//
//  Created by Campbell Weaver on 7/23/14.
//  Copyright (c) 2014 Campbell Weaver. All rights reserved.
//

#import "XYZCreateAccountViewController.h"

@interface XYZCreateAccountViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *password_repeat;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UIButton *create_account_button;

@end

@implementation XYZCreateAccountViewController

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"cancel"]) {
        return YES;
    }
    if (self.username.text.length == 0) {
        self.username.placeholder = @"Please enter a username";
        return NO;
    }
    else {
        self.username.textColor = [UIColor blackColor];
        self.username.placeholder = @"";
    }
    if (self.password.text.length == 0) {
        self.password.placeholder = @"Please enter a Password";
        return NO;
    }
    if (![self.password_repeat.text isEqualToString:self.password.text]) {
        self.password_repeat.placeholder = @"Passwords don't match";
    }
    
    if (self.email.text.length == 0) {
        return NO;
    }
    return YES;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.password.secureTextEntry = YES;
    self.password_repeat.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
