//
//  Interpreting_QmoPhaseRevealed.m
//  Fitzi
//
//  Created by MacBook on 04/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "Interpreting_QmoPhaseRevealed.h"
#import "InterpretingPhaseView_Lifestyle.h"

@implementation Interpreting_QmoPhaseRevealed

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
    NSLog(@"Swipe Up Done_ inter");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"Interpreting_QmoPhaseRevealed1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[Interpreting_QmoPhaseRevealed1 class]])
            qmo1 = (Interpreting_QmoPhaseRevealed1 *)object;
    }
    [self addSubview:qmo1];
    qmo1.frame = CGRectMake(0.0, self.bounds.size.height, qmo1.bounds.size.width, qmo1.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         qmo1.frame = self.frame; // its final location
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseView_Lifestyle"
                                                    owner:self options:nil];
    InterpretingPhaseView_Lifestyle *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseView_Lifestyle class]])
            indexView = (InterpretingPhaseView_Lifestyle *)object;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
