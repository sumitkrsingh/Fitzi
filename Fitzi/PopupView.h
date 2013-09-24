//
//  PopupView.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 07/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupView : UIView

@property (weak, nonatomic) IBOutlet UITextView *popupText;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

- (void) setPopupString:(NSString *)popupText andTitle:(NSString *) titleString;
- (IBAction)btnClosePressed:(id)sender;

@end
