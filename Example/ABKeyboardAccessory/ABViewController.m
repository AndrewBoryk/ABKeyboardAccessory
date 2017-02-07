//
//  ABViewController.m
//  ABKeyboardAccessory
//
//  Created by andrewboryk on 02/06/2017.
//  Copyright (c) 2017 andrewboryk. All rights reserved.
//

#import "ABViewController.h"

@interface ABViewController ()

@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // First step: Set the ABKeyboardAccessory as the inputField's 'inputAccessoryView'
    self.inputField.inputAccessoryView = [[ABKeyboardAccessory alloc] initWithDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Storyboard Actions
- (IBAction)backgroundTouchAction:(id)sender {
    [self resignAllKeyboards];
}

#pragma mark - UITextField Delegate Methods
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self resignAllKeyboards];
    
    return YES;
}

#pragma mark - Helper Methods
- (void) resignAllKeyboards {
    [self.inputField resignFirstResponder];
}

#pragma mark - ABSwipeAccessory Delegate Methods
- (void) accessoryOffsetDidChange:(CGFloat)yOffset {
    
    // Second step: Adjust the UI based off of the keyboard offset change
    [self.view layoutIfNeeded];
    self.bottomOffset.constant = yOffset;
    
    [UIView animateWithDuration:0.001f animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void) didMoveKeyboardWithFrame:(CGRect)frame {
    
    //    Alternate adjustment: If the textView/textField does not rest on the bottom of the screen, you and adjust offset using the frame
    //    CGRect windowFrame = [[[UIApplication sharedApplication] keyWindow] frame];
    //
    //    CGFloat yOffset = windowFrame.size.height - frame.origin.y;
    //    [self.view layoutIfNeeded];
    //    self.bottomOffset.constant = yOffset;
    //    [UIView animateWithDuration:0.001f animations:^{
    //        [self.view layoutIfNeeded];
    //    }];
    
}


@end
