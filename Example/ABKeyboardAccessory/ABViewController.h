//
//  ABViewController.h
//  ABKeyboardAccessory
//
//  Created by andrewboryk on 02/06/2017.
//  Copyright (c) 2017 andrewboryk. All rights reserved.
//

@import UIKit;

#import <ABKeyboardAccessory/ABKeyboardAccessory.h>

@interface ABViewController : UIViewController <ABKeyboardAccessoryDelegate, UITextFieldDelegate>

#pragma mark - Properties
/// Test field for typing
@property (strong, nonatomic) IBOutlet UITextField *inputField;

/// Space between textField toolbar and bottom of the screen
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomOffset;

#pragma mark - Actions
/// Detect background touch and hide keyboard
- (IBAction)backgroundTouchAction:(id)sender;

@end

