//
//  ViewController.h
//  MultiThreadingAssignment
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)build:(id)sender;

- (IBAction)but:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *labelBuild;

@property (strong, nonatomic) IBOutlet UITextField *labelBuy;

-(void)countBuild;
-(void)buyCar;
@end

