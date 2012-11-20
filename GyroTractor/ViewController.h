//
//  ViewController.h
//  GyroTractor
//
//  Created by Hersh Bhargava on 1/17/12.
//  Copyright (c) 2012 H2 Micro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

CMMotionManager *motionManager;
NSOperationQueue *opQ;
NSTimer *timer;
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *infoDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoDisplayLabel2;
@property (weak, nonatomic) IBOutlet UILabel *infoDisplayLabel3;
@property (weak, nonatomic) IBOutlet UILabel *infoDisplayLabel4;
@property (weak, nonatomic) IBOutlet UILabel *infoDisplayLabel5;
@property (weak, nonatomic) IBOutlet UILabel *infoDisplayLabel6;

@end
