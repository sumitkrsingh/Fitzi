//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziProcessEvaluation4.h"
#import "FitziProcessEvaluation3.h"

#define POP_TEXT1  @"First impressions are virtually irreversible! If you stand at the back of the store, behind the counter or are viewed to be only interested in the iPad Mini you are holding you will look like a predator approaching its pray when you walk towards your customer to greet them...or worse yet you will look disinterested. With the extended runway at the front of the store it is essential that you are positioned in areas that allow you to see customers entering the store."

@implementation FitziProcessEvaluation4



- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PageNumberDidChange" object:self];
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

- (IBAction) swipeUpDone:(id) sender
{
    NSLog(@"Swipe Up Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation5"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation5 class]])
            fitziEvolutionView = (FitziProcessEvaluation5 *)object;
    }
    [self addSubview:fitziEvolutionView];
    fitziEvolutionView.frame = CGRectMake(0.0, self.bounds.size.height, fitziEvolutionView.bounds.size.width, fitziEvolutionView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:YES];
                         fitziEvolutionView.frame = self.frame;//CGRectMake(12.0,24.0, equationView1.bounds.size.width, (equationView1.bounds.size.height)-20.0);
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done");
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation3"
                                                    owner:self options:nil];
    FitziProcessEvaluation3 *indexView;
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation3 class]])
            indexView = (FitziProcessEvaluation3 *)object;
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

- (IBAction)showPopUpWithText:(id)sender
{
    [self preparePopupArray];
    PopupView *popupview = [[[NSBundle mainBundle] loadNibNamed:@"PopupView" owner:self options:nil] objectAtIndex:0];
    
    [popupview setPopupString:[popupText objectAtIndex:[sender tag]] andTitle:[popupTitle objectAtIndex:[sender tag]]];
    popupview.frame = CGRectMake(self.bounds.size.width/2 - popupview.bounds.size.width/2, self.bounds.size.height/2 - popupview.bounds.size.height/2, popupview.bounds.size.width, popupview.bounds.size.height);
    [self addSubview:popupview];
}

- (void) preparePopupArray
{
    popupText = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@",POP_TEXT1],nil];//[NSString stringWithFormat:@"%@",POP_TEXT2],[NSString stringWithFormat:@"%@",POP_TEXT3], nil];
    popupTitle = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@",@"Open Ended"],nil];//[NSString stringWithFormat:@"%@",@"Floor awareness"],[NSString stringWithFormat:@"%@",@"Non product greeting"], nil];
}

@end
