//
//  ABKeyboardAccessory.h
//  Pods
//
//  Created by Andrew Boryk on 2/6/17.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol ABKeyboardAccessoryDelegate;

@interface ABKeyboardAccessory : UIView

/// Delegate for ABKeyboardAccessory
@property (weak, nonatomic) id <ABKeyboardAccessoryDelegate> delegate;

/// Initialize an ABKeyboardAccessory with a delegate
- (instancetype) initWithDelegate: (id) viewController;

@end

@protocol ABKeyboardAccessoryDelegate <NSObject>

@optional

/// Called when the keyboard frame changes, and privides a listener for the ABKeyboardAccessory frame position changing. Useful if determining offset when textView/textField is not flush with bottom of screen.
- (void) didMoveKeyboardWithFrame: (CGRect) frame;

/// Called when the keyboard frame changes, and privides a listener for the ABKeyboardAccessory vertical offset position changing
- (void) accessoryOffsetDidChange: (CGFloat) yOffset;

@end
