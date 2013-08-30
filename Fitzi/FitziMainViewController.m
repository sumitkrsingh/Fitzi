//
//  FitziMainViewController.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 28/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziMainViewController.h"

@interface FitziMainViewController ()

@end

@implementation FitziMainViewController

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
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziIndexView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziIndexView class]])
            indexView = (FitziIndexView *)object;
    }
    indexView.frame = targetView.frame;
    [targetView addSubview:indexView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
