//
//  ViewController.m
//  MultiThreadingAssignment
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
static int counter =1;
static int max =10;
static int buyCar =0;
@interface ViewController ()

@end

@implementation ViewController
@synthesize labelBuild,labelBuy;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)countBuild{
    for (int i=buyCar ; i<=max; i++)
    {
        dispatch_block_t myblock =
        ^{
            labelBuild.text = [NSString stringWithFormat:@"%d",i];
            
         };
        buyCar =i;
        //get code block queue of main thread
        dispatch_queue_t mainQ = dispatch_get_main_queue();
        
        //pass myblock to mainQ
        dispatch_async(mainQ, myblock);
        
        
        [NSThread sleepForTimeInterval:1];
        NSLog(@"%d",i);
    }
}
-(void)buyCar
{
    
    if (counter <= max-5)
    {
        labelBuy.text =[NSString stringWithFormat:@"%d",counter++];
        if (counter%5 == 0)
        {
            max = max+5;
            [NSThread detachNewThreadSelector:@selector(countBuild) toTarget:self withObject:nil];
        }
        
    }

}


- (IBAction)build:(id)sender {
    
    [NSThread detachNewThreadSelector:@selector(countBuild) toTarget:self withObject:nil];
    
}

- (IBAction)but:(id)sender {
    
    [NSThread detachNewThreadSelector:@selector(buyCar) toTarget:self withObject:nil];
}
@end
