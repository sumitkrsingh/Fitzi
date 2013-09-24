//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitEquationView.h"

@implementation FitEquationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/*- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done");
    NSLog(@"Swipe Up Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation class]])
            fitziEvolutionView = (FitziProcessEvaluation *)object;
    }
    [self addSubview:fitziEvolutionView];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];

}*/

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done_equ");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation class]])
            fitziEvolutionView = (FitziProcessEvaluation *)object;
    }
    [self addSubview:fitziEvolutionView];
    // equationView.frame = CGRectMake(0.0, self.bounds.size.height, equationView.bounds.size.width, equationView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         //equationView.frame = self.frame;// its final location
                         
                         fitziEvolutionView.frame = self.frame;//CGRectMake(0.0,-12.0, fitziEvolutionView.bounds.size.width, (fitziEvolutionView.bounds.size.height)- 20.0);
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
}

@end
