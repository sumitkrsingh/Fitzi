/*
 *  UIBarButtonItem+WEPopover.m
 *  WEPopover
 *
 */

#import "UIBarButtonItem+WEPopover.h" 

@implementation UIBarButtonItem(WEPopover)

- (CGRect)frameInView:(UIView *)v {
	
	UIView *theView = self.customView;
	if (!theView && [self respondsToSelector:@selector(view)]) {
		theView = [self performSelector:@selector(view)];
	}
	
	UIView *parentView = theView.superview;
	NSArray *subviews = parentView.subviews;
	
	NSUInteger indexOfView = [subviews indexOfObject:theView];
	NSUInteger subviewCount = subviews.count;
	
	if (subviewCount > 0 && indexOfView != NSNotFound) {
		UIView *button = [parentView.subviews objectAtIndex:indexOfView];
		return [button convertRect:button.bounds toView:v];
	} else {
		return CGRectZero;
	}
}

- (UIView *)superview {
	
	UIView *theView = self.customView;
	if (!theView && [self respondsToSelector:@selector(view)]) {
		theView = [self performSelector:@selector(view)];
	}
	
	UIView *parentView = theView.superview;
	return parentView;
}

@end
