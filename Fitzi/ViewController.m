//
//  ViewController.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 28/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeDownToNextScreen:(id)sender
{
    NSLog(@"Inside Swipe Guesture..");
    
//    UIStoryboard *appstoryBoard = [self storyboard];
//    UIViewController *screen = [appstoryBoard instantiateViewControllerWithIdentifier:@"MainScreen"];
//    [self presentViewController:screen animated:YES completion:nil];
    
 // OR USE ABOVE.. Both Works
    
    [self performSegueWithIdentifier:@"MainScreen" sender:sender];
}

@end
