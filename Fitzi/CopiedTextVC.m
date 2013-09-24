//
//  CopiedTextVC.m
//  Fitzi
//
//  Created by Sumit Kumar Singh on 09/09/13.
//  Copyright (c) 2013 Gaurav Bhardwaj. All rights reserved.
//

#import "CopiedTextVC.h"
#import "FitziCommon.h"

@interface CopiedTextVC ()

@end

@implementation CopiedTextVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTextContent];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendPastedTextInMail:(id)sender
{
    if (self.screenTag == 2)
    {
        NSMutableDictionary *dictTowrite = [[NSMutableDictionary alloc]init];
        [dictTowrite setObject:self.pasteTextView.text forKey:@"textVal"];
        [dictTowrite setObject:[NSString stringWithFormat:@"%@",[NSDate date]] forKey:@"timestamp"];
        
        [FitziCommon insertNotes:dictTowrite];
    }
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
    [mailController setMailComposeDelegate:self];
    [mailController setSubject:@"Fitzi iPad App"];
    [mailController setMessageBody:self.pasteTextView.text isHTML:NO];
    
    if(textInContent.length > 1)
    {
          [self presentViewController:mailController animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No text" message:@"No text to send..." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    [textInContent setString:@""];
    [self writeTextToFile:textInContent];
}

- (void) writeTextToFile:(NSString *) text
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"PastedText.txt"];
    [text writeToFile:appFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

-(NSString *) displayContent
{
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/PastedText.txt",
                          documentsDirectory];
    NSString *content = [[NSString alloc] initWithContentsOfFile:fileName
                                                    usedEncoding:nil
                                                           error:nil];
    return content;

}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)printText:(id)sender
{
    UIPrintInteractionController *print = [UIPrintInteractionController sharedPrintController];
    print.delegate = self;
    
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
    printInfo.jobName = @"Fitzi Selected Text Print";
    print.printInfo = printInfo;
    NSString* str = self.pasteTextView.text;
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    print.printInfo = printInfo;
    print.showsPageRange = YES;
    print.printingItem = data;
    
    UIViewPrintFormatter *viewFormatter = [self.view viewPrintFormatter];
    viewFormatter.startPage = 0;
    print.printFormatter = viewFormatter;
    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if (!completed && error) {
            NSLog(@"Printing could not complete because of error: %@", error);
        }
    };
    [print presentFromRect:[sender frame] inView:self.view animated:YES completionHandler:completionHandler];
    //    [print presentAnimated:YES completionHandler:completionHandler];
}

- (void) setTextContent
{
    NSArray *fetchedData;
    switch (self.screenTag) {
        case 2:
            fetchedData = [FitziCommon getMyNotesData];
            NSLog(@"getMyNotesData: %@",fetchedData);
            [self.pasteTextView setEditable:TRUE];
            break;
        case 3:
            fetchedData = [FitziCommon getHighlightedData];
            NSLog(@"getHighlightedData: %@",fetchedData);
            break;
        case 4:
            fetchedData = [FitziCommon getUnderlinedData];
            NSLog(@"getUnderlinedData: %@",fetchedData);
            break;
        default:
            fetchedData = [FitziCommon getUnderlinedData];
            NSLog(@"Get All Data: %@",fetchedData);
            break;
    }
    
    textInContent = [[NSMutableString alloc] init];
    for (int i=0; i<[fetchedData count]; i++)
    {
        NSDictionary *rowDict = [fetchedData objectAtIndex:i];
        
        //        NSString *dateStr = [rowDict valueForKey:@"timestamp"];
        //        NSDateFormatter *dtF = [[NSDateFormatter alloc] init];
        //        [dtF setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        //        NSDate *d = [dtF dateFromString:dateStr];
        //        NSDateFormatter *dateFormatStr = [[NSDateFormatter alloc] init];
        //        [dateFormatStr setDateFormat:@"yyyy-MM-dd hh:mm"];
        //        NSString *strDate = [dateFormatStr stringFromDate:d];
        
        [textInContent appendString:[NSString stringWithFormat:@"%@",[rowDict valueForKey:@"timestamp"]]];
        [textInContent appendString:@"\n"];
        [textInContent appendString:[rowDict valueForKey:@"textString"]];
        [textInContent appendString:@"\n\n"];
    }
    self.pasteTextView.text = textInContent;
}

@end
