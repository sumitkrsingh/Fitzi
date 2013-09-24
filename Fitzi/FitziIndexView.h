//
//  FitziIndexView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 29/08/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FitEvolutionView.h"
@class FitEvolutionView;
@class FitEquation1;
@class FitziProcessEvaluation;
@class FitziIntroductionView;
@class CapturePhase;
@class InterpretingPhaseView;
@class InterpretingPhaseView1;
@class InterpretingPhaseView3;
@class FitEvolutionView16;
@class InterpretingPhaseFitting;
@class ImplementingFitziRules1;
@class OperetingiPad1;
@class Troubleshooting1;
@class FitEvolutionView_Additional;

@interface FitziIndexView : UIView
{
    FitEvolutionView *nextView;
    FitEvolutionView_Additional* fitEvolutionView_Additional;
    
    FitEquation1* equ1;
    FitziProcessEvaluation* fitziProcessEvaluation;
    FitziIntroductionView* fitziIntroductionView;
    CapturePhase* capturePhase;
    InterpretingPhaseView* interpretingPhaseView;
    InterpretingPhaseView1* interpretingPhaseView1;
    InterpretingPhaseView3* interpretingPhaseView3;
    FitEvolutionView16* fitEvolutionView16;
    InterpretingPhaseFitting* interpretingPhaseFitting;
    ImplementingFitziRules1* implementingFitziRules1;
    OperetingiPad1* operetingiPad1;
    Troubleshooting1* troubleshooting1;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;
- (IBAction)goToEvolutionScreen:(id)sender;
- (IBAction)goToEquation1Screen:(id)sender;
- (IBAction)goToFitziProcessEvaluationScreen:(id)sender;
- (IBAction)goToFitziIntroductionViewScreen:(id)sender;
- (IBAction)goToCapturePhaseScreen:(id)sender;
- (IBAction)goToInterpretingPhaseViewScreen:(id)sender;
- (IBAction)goToInterpretingPhaseView1Screen:(id)sender;
- (IBAction)goToInterpretingPhaseView3Screen:(id)sender;
- (IBAction)goToFitEvolutionView16Screen:(id)sender;
- (IBAction)goToInterpretingPhaseFittingScreen:(id)sender;
- (IBAction)goTooperetingiPad1Screen:(id)sender;
- (IBAction)goTotroubleshooting1Screen:(id)sender;

@end
