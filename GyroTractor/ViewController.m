//
//  ViewController.m
//  GyroTractor
//
//  Created by Hersh Bhargava on 1/17/12.
//  Copyright (c) 2012 H2 Micro. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize infoDisplayLabel;
@synthesize infoDisplayLabel2;
@synthesize infoDisplayLabel3;
@synthesize infoDisplayLabel4;
@synthesize infoDisplayLabel5;
@synthesize infoDisplayLabel6;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
#define degrees(x) (180.0 * x / M_PI)
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval = 1.0/30.0;
    [motionManager startDeviceMotionUpdates];
    
    

             
    //timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/60.0) target:self selector:@selector(readIt) userInfo:nil repeats:YES];
                      
    
    //Gyroscope
    
    if([motionManager isGyroAvailable])
    {
        if([motionManager isGyroActive] == NO)
        {
            [motionManager setGyroUpdateInterval:0.1];
            
            [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue]
                                            withHandler:^(CMGyroData *gyroData, NSError *error)
             {
                 NSString *x = [[NSString alloc] initWithFormat:@"%.02f",gyroData.rotationRate.x];
                 infoDisplayLabel.text = x;
                 
                 NSString *y = [[NSString alloc] initWithFormat:@"%.02f",gyroData.rotationRate.y];
                 infoDisplayLabel2.text = y;
                 
                 NSString *z = [[NSString alloc] initWithFormat:@"%.02f",gyroData.rotationRate.z];
                 infoDisplayLabel3.text = z;
                 
                 CMAttitude *attitude;
                 
                 CMDeviceMotion *motion = motionManager.deviceMotion;
                 
                 
                 attitude = motion.attitude;
                 NSString *yaw = [NSString stringWithFormat:@"Yaw = %f", degrees(attitude.yaw)];
                 infoDisplayLabel4.text = yaw;
                 NSString *pitch = [NSString stringWithFormat:@"Pitch = %f", degrees(attitude.pitch)];
                 infoDisplayLabel5.text = pitch;
                 NSString *roll = [NSString stringWithFormat:@"Roll = %f", degrees(attitude.roll)];
                 infoDisplayLabel6.text = roll;
                 //NSLog(@"roll = %f... pitch = %f ... yaw = %f", degrees(attitude.roll), degrees(attitude.pitch), degrees(attitude.yaw));
                 
                 
                 
                 NSString *urlWithData = [NSString stringWithFormat:@"http://localhost:9292?x=%.02f&y=%.02f&z=%.02f&pitch=%f&roll=%f&yaw=%f", gyroData.rotationRate.x,gyroData.rotationRate.y,gyroData.rotationRate.z,degrees(attitude.pitch),degrees(attitude.roll), degrees(attitude.yaw)];
                 
                 //NSLog(urlWithData);
                 
                 NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlWithData]
                                                                     cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                                     timeoutInterval:10];
                 
                 [request setHTTPMethod: @"GET"];
                 
                 NSError *requestError;
                 NSURLResponse *urlResponse = nil;
                 
                 
                 NSData *response1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
                 */
                                  
             }];
        }
    }
    else
    {
        NSLog(@"Gyroscope not Available!");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@":{" message:@"No Gyro" delegate:self cancelButtonTitle:@"GRRR" otherButtonTitles:@"Get an iPhone 4", nil];
        [alert show];
        
    }    
 
          
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setInfoDisplayLabel:nil];
    [self setInfoDisplayLabel2:nil];
    [self setInfoDisplayLabel3:nil];
    [self setInfoDisplayLabel4:nil];
    [self setInfoDisplayLabel5:nil];
    [self setInfoDisplayLabel6:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
             
-(void)readIt {
    /*
    CMAttitude *attitude;
    
    CMDeviceMotion *motion = motionManager.deviceMotion;        
    
    
    attitude = motion.attitude;
    NSString *yaw = [NSString stringWithFormat:@"Yaw = %f", degrees(attitude.yaw)];
    infoDisplayLabel4.text = yaw;
    NSString *pitch = [NSString stringWithFormat:@"Pitch = %f", degrees(attitude.pitch)];
    infoDisplayLabel5.text = pitch;
    NSString *roll = [NSString stringWithFormat:@"Roll = %f", degrees(attitude.roll)];
    infoDisplayLabel6.text = roll;
    NSLog(@"roll = %f... pitch = %f ... yaw = %f", degrees(attitude.roll), degrees(attitude.pitch), degrees(attitude.yaw));
    */
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
