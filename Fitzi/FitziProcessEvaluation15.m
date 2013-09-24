//
//  FitziProcessEvaluation15.m
//  Fitzi
//
//  Created by MacBook on 06/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziProcessEvaluation15.h"
#import "FitziProcessEvaluation14.h"

@implementation FitziProcessEvaluation15

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
//NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziIntroductionView"
//                                                   owner:self options:nil];
//for (id object in bundle) {
//    if ([object isKindOfClass:[FitziIntroductionView class]])
//        nextView = (FitziIntroductionView *)object;
//}
//[self addSubview:nextView];
//[UIView beginAnimations:nil context:NULL];
//[UIView setAnimationDuration:2.0];
//[UIView commitAnimations];

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEvolutionView16"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEvolutionView16 class]])
            fitEvolutionView16 = (FitEvolutionView16 *)object;
    }
    [self addSubview:fitEvolutionView16];
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitEvolutionView16.frame = self.frame; // its final location
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziIndexView"
                                                    owner:self options:nil];
    FitziIndexView *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziIndexView class]])
            indexView = (FitziIndexView *)object;
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

@end
