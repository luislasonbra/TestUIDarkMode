//
//  ViewController.m
//  TestUIDarkMode
//
//  Created by luislasonbra on 17/12/19.
//  Copyright © 2019 luislasonbra. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction) bt_test_action:(NSButton *)sender {
	NSString *src = [_textField_test stringValue];
	NSLog(@"_textField_test.value: %@", src);
	
//	NSString *src = @"HOLA_MUNDO_CONSOLE_LOG";
//	NSLog(@"_textField_test.value: %@", src);
}

- (void) viewDidLoad {
	[super viewDidLoad];
	[_textField_test setFocusRingType: NSFocusRingTypeNone]; // fix border
}

- (void) setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

@end


















