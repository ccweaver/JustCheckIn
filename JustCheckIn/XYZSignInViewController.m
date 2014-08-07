//
//  XYZSignInViewController.m
//  JustCheckIn
//
//  Created by Campbell Weaver on 7/23/14.
//  Copyright (c) 2014 Campbell Weaver. All rights reserved.
//

#import "XYZSignInViewController.h"
#import "XYZBackgroundLayer.h"

@interface XYZSignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *sign_in_button;
@property (weak, nonatomic) IBOutlet UIButton *create_account_button;
@property (weak, nonatomic) IBOutlet UILabel *sign_in_failed;

@end

@implementation XYZSignInViewController


#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
    self.username.placeholder = @"test1";
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
    self.password.placeholder = @"test2";
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    self.sign_in_failed.text = @"a;lskdjf";
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"CreateAccountSeg"]) {
        return YES;
    }
    if ([identifier isEqualToString:@"SignInSeg"]) {
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://ec2-54-200-21-53.us-west-2.compute.amazonaws.com/~bsturm/php_working_check.php"]];
        
         // Specify that it will be a POST request
         request.HTTPMethod = @"POST";
         
         // This is how we set header fields
         [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        // Convert your data and set your request's HTTPBody property
        NSString *stringData = @"key1=val1&key2=val2";
        
        NSData *requestBodyData = [stringData dataUsingEncoding:NSUTF8StringEncoding];
        request.HTTPBody = requestBodyData;
        
        // Create url connection and fire request
        NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
        
        
        if ([self.username.text isEqualToString:@"campbell"]) {
            return YES;
        }
        if (self.username.text.length == 0 || self.password.text.length == 0) {
            self.sign_in_failed.text = @"Please enter a Username and Password";
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

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.password.secureTextEntry = YES;
    
    CAGradientLayer *bgLayer = [XYZBackgroundLayer blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    // resize your layers based on the view’s new bounds
    CAGradientLayer *bgLayer = [XYZBackgroundLayer blueGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer replaceSublayer:[[self.view.layer sublayers] objectAtIndex:0] with:bgLayer];
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
