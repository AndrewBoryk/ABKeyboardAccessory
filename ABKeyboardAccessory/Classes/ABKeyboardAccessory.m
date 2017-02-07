//
//  ABKeyboardAccessory.m
//  Pods
//
//  Created by Andrew Boryk on 2/6/17.
//
//

#import "ABKeyboardAccessory.h"

@implementation ABKeyboardAccessory

- (instancetype) initWithDelegate: (id) viewController {
    self = [super init];
    
    if (self) {
        if ([self notNull:viewController]) {
            self.delegate = viewController;
        }
    }
    
    return self;
}

-(void) willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    if (self.superview) {
        [self.superview removeObserver:self
                            forKeyPath:@"center"];
        
        [self.superview removeObserver:self
                            forKeyPath:@"frame"];
    }
    
    // Observe changes in ABKeyboardAccessory frame to determine keyboard offset
    [newSuperview addObserver:self
                   forKeyPath:@"center"
                      options:0
                      context:nil];
    
    [newSuperview addObserver:self
                   forKeyPath:@"frame"
                      options:0
                      context:nil];
    
    [super willMoveToSuperview:newSuperview];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    // Get the frame of the ABKeyboardAccessory
    if (object == self.superview
        && ([keyPath isEqualToString:@"center"] || [keyPath isEqualToString:@"frame"])) {
        
        if ([self notNull: object]) {
            if ([self notNull: [object valueForKeyPath:@"frame"]]) {
                CGRect frame = [[object valueForKeyPath:@"frame"] CGRectValue];
                if ([self.delegate respondsToSelector:@selector(didMoveKeyboardWithFrame:)]) {
                    [self.delegate didMoveKeyboardWithFrame:frame];
                }
                
                CGRect windowFrame = [[[UIApplication sharedApplication] keyWindow] frame];
                
                CGFloat offset = windowFrame.size.height - frame.origin.y;
                
                //
                if ([self.delegate respondsToSelector:@selector(accessoryOffsetDidChange:)]) {
                    [self.delegate accessoryOffsetDidChange:offset];
                }
            }
        }
    }
}

- (BOOL)notNull:(id)object {
    if ([object isEqual:[NSNull null]] || [object isKindOfClass:[NSNull class]] || object == nil) {
        return false;
    }
    else {
        return true;
    }
}

@end
