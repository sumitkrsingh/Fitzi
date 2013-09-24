//
//  InterpretingPhaseView_Lifestyle.m
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "InterpretingPhaseView_Lifestyle.h"
#import "InterpretingPhaseView_Athelete.h"

@implementation InterpretingPhaseView_Lifestyle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done_evolution");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"Interpreting_QmoPhaseRevealed"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[Interpreting_QmoPhaseRevealed class]])
            qmo = (Interpreting_QmoPhaseRevealed *)object;
    }
    [self addSubview:qmo];
    qmo.frame = CGRectMake(0.0, self.bounds.size.height, qmo.bounds.size.width, qmo.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                          qmo.frame = self.frame; //CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseView_Athelete"
                                                    owner:self options:nil];
    InterpretingPhaseView_Athelete *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseView_Athelete class]])
            indexView = (InterpretingPhaseView_Athelete *)object;
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
