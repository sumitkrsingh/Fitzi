//
//  RichTextEditor.h
//  RichTextEdtor


#import <UIKit/UIKit.h>
#import "RichTextEditorToolbar.h"
#import "FitziCommon.h"

@class RichTextEditor;
@protocol RichTextEditorDataSource <NSObject>
@optional
- (NSArray *)fontSizeSelectionForRichTextEditor:(RichTextEditor *)richTextEditor;
- (NSArray *)fontFamilySelectionForRichTextEditor:(RichTextEditor *)richTextEditor;
- (RichTextEditorToolbarPresentationStyle)presentationStyleForRichTextEditor:(RichTextEditor *)richTextEditor;
- (UIModalPresentationStyle)modalPresentationStyleForRichTextEditor:(RichTextEditor *)richTextEditor;
- (UIModalTransitionStyle)modalTransitionStyleForRichTextEditor:(RichTextEditor *)richTextEditor;
- (RichTextEditorFeature)featuresEnabledForRichTextEditor:(RichTextEditor *)richTextEditor;
- (BOOL)shouldDisplayToolbarForRichTextEditor:(RichTextEditor *)richTextEditor;
- (BOOL)shouldDisplayRichTextOptionsInMenuControllerForRichTextEditor:(RichTextEditor *)richTextEdiotor;
@end

@interface RichTextEditor : UITextView

@property (nonatomic, weak) IBOutlet id <RichTextEditorDataSource> dataSource;
@property (nonatomic, assign) CGFloat defaultIndentationSize;

- (void)setBorderColor:(UIColor*)borderColor;
- (void)setBorderWidth:(CGFloat)borderWidth;
- (NSString *)htmlString;
- (void) applySelectedAttributes;
- (NSString *) getNSStringFromUIColor:(UIColor *) inputColor;
- (UIColor *) getUIColorFromNSString:(NSString *) inputString;

@end
