//
//  CopiedTextVC.h
//  Fitzi
//
//  Created by Sumit Kumar Singh on 09/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface CopiedTextVC : UIViewController <MFMailComposeViewControllerDelegate, UIPrintInteractionControllerDelegate>
{
    NSMutableString *textInContent;
}
@property (strong, nonatomic) IBOutlet UITextView *pasteTextView;
@property NSInteger screenTag;

- (IBAction)sendPastedTextInMail:(id)sender;
- (void) writeTextToFile:(NSString *) text;
-(NSString *) displayContent;
- (IBAction)printText:(id)sender;
- (void) setTextContent;

@end
