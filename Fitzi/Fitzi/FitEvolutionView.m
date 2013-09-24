//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitEvolutionView.h"

@implementation FitEvolutionView

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
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquationView"
                                            owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquationView class]])
            equationView = (FitEquationView *)object;
    }
    [self addSubview:equationView];
   // equationView.frame = CGRectMake(0.0, self.bounds.size.height, equationView.bounds.size.width, equationView.bounds.size.height);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
}*/

/*- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done_evolution");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"Interpreting_QmoPhaseRevealed2_2 "
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[Interpreting_QmoPhaseRevealed2_2 class]])
            qmoRevealed = (Interpreting_QmoPhaseRevealed2_2 *)object;
    }
    [self addSubview:qmoRevealed];
    // equationView.frame = CGRectMake(0.0, self.bounds.size.height, equationView.bounds.size.width, equationView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         //equationView.frame = self.frame;// its final location
                         
                         qmoRevealed.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}*/

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done_evolution");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquation1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquation1 class]])
            equation1 = (FitEquation1 *)object;
    }
    [self addSubview:equation1];
     equation1.frame = CGRectMake(0.0, self.bounds.size.height, equation1.bounds.size.width, equation1.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         //equationView.frame = self.frame;// its final location
                         
                         equation1.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
}



/*- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    
}*/

@end
