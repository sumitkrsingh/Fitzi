//
//  PopupView.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 07/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "PopupView.h"

@implementation PopupView

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
- (void) setPopupString:(NSString *)popupText andTitle:(NSString *) titleString
{
    self.popupText.text = popupText;
    self.lblTitle.text = titleString;
   // [self setNeedsDisplay];
}

- (IBAction)btnClosePressed:(id)sender
{
    [self removeFromSuperview];
}
@end
