//
//  ImplementingFitziRules1.h
//  Fitzi
//
//  Created by MacBook on 05/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImplementingFitziRules2.h"

@interface ImplementingFitziRules1 : UIView
{
    ImplementingFitziRules2* rules2;
}
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeUp;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeDown;

- (IBAction) swipeUpDone:(id) sender;
- (IBAction) swipeDownDone:(id) sender;

@end
