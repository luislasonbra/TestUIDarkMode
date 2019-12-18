//
//  AppDelegate.m
//  TestUIDarkMode
//
//  Created by luislasonbra on 17/12/19.
//  Copyright © 2019 luislasonbra. All rights reserved.
//
//https://medium.com/@kevingutowski/how-to-setup-a-tableview-in-2019-obj-c-c7dece203333
//https://github.com/lukakerr/NSWindowStyles
//https://github.com/mpv-player/mpv/issues/4789
//https://stackoverflow.com/questions/7620251/how-to-get-main-window-app-delegate-from-other-class-subclass-of-nsviewcontro&xid=17259,1500004,15700002,15700021,15700186,15700191,15700256,15700259,15700262,15700265,15700271,15700283&usg=ALkJrhji9ws2uUQ-cpPu7skP-DA-H7ZTXg
//https://stackoverflow.com/questions/24414483/how-can-i-use-nsvisualeffectview-in-windows-title-bar?noredirect=1&lq=1
//https://github.com/lukakerr/NSWindowStyles
//https://stackoverflow.com/questions/26518520/how-to-make-a-smooth-rounded-volume-like-os-x-window-with-nsvisualeffectview

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void) applicationWillFinishLaunching:(NSNotification *)notification {
	// changed style
	//NSWindow *window = [[NSApplication sharedApplication] mainWindow];
	NSWindow *window = [[[NSApplication sharedApplication] windows] objectAtIndex:0];
	if (window != NULL) {
		[window setOpaque: TRUE];
		[window setTitlebarAppearsTransparent: TRUE];
		[window setAppearance:[NSAppearance appearanceNamed: NSAppearanceNameVibrantDark]];
		[window setBackgroundColor: [NSColor blackColor]];
		[window setStyleMask: [window styleMask] | NSWindowStyleMaskFullSizeContentView];
		
		//[window setBackgroundColor: [NSColor clearColor]];
		
		// make effect **************************************************
		NSVisualEffectView *visualEffect = [[NSVisualEffectView alloc] init];
		if (visualEffect != NULL) {
			[visualEffect setBlendingMode: NSVisualEffectBlendingModeBehindWindow];
			[visualEffect setState: NSVisualEffectStateActive];
			[visualEffect setMaterial: NSVisualEffectMaterialUltraDark];
			
//			[visualEffect setWantsLayer: TRUE];
//			[visualEffect.layer setCornerRadius: 10.0f];
			
			// fix view containt
			NSView *view = [window contentView];
			[visualEffect willRemoveSubview: view];

			// set new content view and new view
			[window setContentView: visualEffect];
			[[window contentView] addSubview: view];
		}
		// end make effect **************************************************
		
		//[[window standardWindowButton:NSWindowCloseButton] setHidden:YES];
		//[[window standardWindowButton:NSWindowMiniaturizeButton] setHidden:YES];
		//[[window standardWindowButton:NSWindowZoomButton] setHidden:YES];
		
		//[window setMinSize:NSSizeFromCGSize(CGSizeMake(450, 281))];
		
		[[window standardWindowButton: NSWindowZoomButton] setHidden: TRUE];
		[window setMinSize:NSSizeFromCGSize(CGSizeMake([window minSize].width, 75))];
	}
	
	// Insert code here to initialize your application
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	// Insert code here to tear down your application
	return TRUE;
}


@end
