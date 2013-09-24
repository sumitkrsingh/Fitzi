//
//  FitziIndexView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "FitziIndexView.h"
#import "FitEvolutionView.h"
#import "FitEvolutionView_Additional.h"


@implementation FitziIndexView

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
   // NSLog(@"Swipe Up Done_index");
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEvolutionView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEvolutionView class]])
            nextView = (FitEvolutionView *)object;
    }
    [self addSubview:nextView];
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView beginAnimations:@"page transition" context:nil];
                         [UIView setAnimationDuration:2.0];
                         [UIView setAnimationTransition:YES ? UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown forView:self cache:NO];
                         nextView.frame = self.frame;
                     }completion:^(BOOL finished) {
                         [UIView setAnimationsEnabled:NO];
                     }];
}

- (IBAction) swipeDownDone:(id) sender
{
    NSLog(@"Swipe Down Done_index");
    /*NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziMainViewController"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEvolutionView class]])
            nextView = (FitEvolutionView *)object;
    }
    [self addSubview:nextView];
    nextView.frame = CGRectMake(0.0, self.bounds.size.height, nextView.bounds.size.width, nextView.bounds.size.height);
    [UIView animateWithDuration:1.0
                     animations:^{
                         nextView.frame = self.frame;
                     }];// its final location*/
   // [self removeFromSuperview];
    
}

- (IBAction)goToEvolutionScreen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEvolutionView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEvolutionView class]])
            nextView = (FitEvolutionView *)object;
    }
    [self addSubview:nextView];
    nextView.frame = self.frame;
}

- (IBAction)goToEquation1Screen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEquation1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEquation1 class]]&& [object tag] == 2)
            equ1 = (FitEquation1 *)object;
    }
    [self addSubview:equ1];
    equ1.frame = self.frame;
}

- (IBAction)goToFitziProcessEvaluationScreen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziProcessEvaluation"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziProcessEvaluation class]])
            fitziProcessEvaluation = (FitziProcessEvaluation *)object;
    }
    [self addSubview:fitziProcessEvaluation];
    fitziProcessEvaluation.frame = self.frame;
}

- (IBAction)goToFitziIntroductionViewScreen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitziIntroductionView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitziIntroductionView class]])
            fitziIntroductionView = (FitziIntroductionView *)object;
    }
    [self addSubview:fitziIntroductionView];
    fitziIntroductionView.frame = self.frame;
}

- (IBAction)goToCapturePhaseScreen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"CapturePhase"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[CapturePhase class]])
            capturePhase = (CapturePhase *)object;
    }
    [self addSubview:capturePhase];
    capturePhase.frame = self.frame;
}

- (IBAction)goToInterpretingPhaseViewScreen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseView"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseView class]])
            interpretingPhaseView = (InterpretingPhaseView *)object;
    }
    [self addSubview:interpretingPhaseView];
    interpretingPhaseView.frame = self.frame;
}

- (IBAction)goToInterpretingPhaseView1Screen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseView1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseView1 class]])
            interpretingPhaseView1 = (InterpretingPhaseView1 *)object;
    }
    [self addSubview:interpretingPhaseView1];
    interpretingPhaseView1.frame = self.frame;
}
- (IBAction)goToInterpretingPhaseView3Screen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseView3"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseView3 class]])
            interpretingPhaseView3 = (InterpretingPhaseView3 *)object;
    }
    [self addSubview:interpretingPhaseView3];
    interpretingPhaseView3.frame = self.frame;
}


- (IBAction)goToFitEvolutionView16Screen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"FitEvolutionView16"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[FitEvolutionView16 class]])
            fitEvolutionView16 = (FitEvolutionView16 *)object;
    }
    [self addSubview:fitEvolutionView16];
    fitEvolutionView16.frame = self.frame;
}

- (IBAction)goToInterpretingPhaseFittingScreen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"InterpretingPhaseFitting"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[InterpretingPhaseFitting class]])
            interpretingPhaseFitting = (InterpretingPhaseFitting *)object;
    }
    [self addSubview:interpretingPhaseFitting];
    interpretingPhaseFitting.frame = self.frame;
}

- (IBAction)goToImplementingFitziRules1Screen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"ImplementingFitziRules1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[ImplementingFitziRules1 class]])
            implementingFitziRules1 = (ImplementingFitziRules1 *)object;
    }
    [self addSubview:implementingFitziRules1];
    implementingFitziRules1.frame = self.frame;
}

- (IBAction)goTooperetingiPad1Screen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"OperetingiPad1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[OperetingiPad1 class]])
            operetingiPad1 = (OperetingiPad1 *)object;
    }
    [self addSubview:operetingiPad1];
    operetingiPad1.frame = self.frame;
}
- (IBAction)goTotroubleshooting1Screen:(id)sender
{
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"Troubleshooting1"
                                                    owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[Troubleshooting1 class]])
            troubleshooting1 = (Troubleshooting1 *)object;
    }
    [self addSubview:troubleshooting1];
    troubleshooting1.frame = self.frame;
}

@end
