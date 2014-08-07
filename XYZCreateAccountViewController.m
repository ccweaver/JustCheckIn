//
//  XYZCreateAccountViewController.m
//  JustCheckIn
//
//  Created by Campbell Weaver on 7/23/14.
//  Copyright (c) 2014 Campbell Weaver. All rights reserved.
//

#import "XYZCreateAccountViewController.h"
#import "XYZBackgroundLayer.h"

@interface XYZCreateAccountViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *password_repeat;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UIButton *create_account_button;
@property (weak, nonatomic) IBOutlet UILabel *create_failed;

@end

@implementation XYZCreateAccountViewController

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    // resize your layers based on the view’s new bounds
    CAGradientLayer *bgLayer = [XYZBackgroundLayer blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer replaceSublayer:[[self.view.layer sublayers] objectAtIndex:0] with:bgLayer];
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"cancel"]) {
        return YES;
    }
    if ([identifier isEqualToString:@"create"]) {
        
        
        if (self.username.text.length == 0) {
            self.create_failed.text = @"Please enter a username";
            return NO;
        }
        if (self.password.text.length == 0) {
            self.create_failed.text = @"Please enter a Password";
            return NO;
        }
        if (![self.password_repeat.text isEqualToString:self.password.text]) {
            self.create_failed.text = @"Passwords don't match";
            return NO;
        }
        
        if (self.email.text.length == 0) {
            self.create_failed.text = @"Please Enter an Email Address";
            return NO;
        }
        
        
        NSString *post = [NSString stringWithFormat:@"username=%@&password=%@&email=%@", self.username.text, self.password.text, self.email.text];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://ec2-54-200-21-53.us-west-2.compute.amazonaws.com/~bsturm/checkIn_register.php"]];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        
        NSError* error;
        NSHTTPURLResponse *response = nil;
        NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSString *stringResponse = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"Response ==> %@", stringResponse);
        
        
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:responseData
                              options:kNilOptions
                              error:&error];
        NSLog(@"jsonObject is %@",json);
        
        NSString* success = [json objectForKey:@"success"];
        
        NSLog(@"success: %@", success);
        
        if ([success intValue] == 1) {
            return YES;
        }
        else {
            self.create_failed.text = @"Username is Taken";
            return NO;
        }
        
    }
    return NO;
    
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
    
    CAGradientLayer *bgLayer = [XYZBackgroundLayer blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
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
