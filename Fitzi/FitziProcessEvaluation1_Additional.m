//
//  FitziProcessEvaluation1_Additional.m
//  Fitzi
//
//  Created by MacBook on 12/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziProcessEvaluation1_Additional.h"
#import "FitziProcessEvaluation1.h"

@implementation FitziProcessEvaluation1_Additional

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PageNumberDidChange" object:self];
    }
    return self;
}

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"mai right mai aaya");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation1"
                                                    owner:self options:nil];
    FitziProcessEvaluation1 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation1 class]])
            indexView = (FitziProcessEvaluation1 *)object;
    }
    [self addSubview:indexView];
    indexView.frame = CGRectMake(0.0, self.bounds.size.height, indexView.bounds.size.width, indexView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:NO ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         indexView.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}
- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"mai left mai aaya");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation2"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation2 class]])
            fitziProcessEvaluation2 = (FitziProcessEvaluation2 *)object;
    }
    [self addSubview:fitziProcessEvaluation2];
    fitziProcessEvaluation2.frame = CGRectMake(0.0, self.bounds.size.height, fitziProcessEvaluation2.bounds.size.width, fitziProcessEvaluation2.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitziProcessEvaluation2.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
