//
//  FitEquationView_Additional.h
//  Fitzi
//
//  Created by MacBook on 11/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitziProcessEvaluation.h"
#import "RichTextEditor.h"

@interface FitEquationView_Additional : UIView <RichTextEditorDataSource>
{
    FitziProcessEvaluation* fitziProcessEvaluation;
}

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;
- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
