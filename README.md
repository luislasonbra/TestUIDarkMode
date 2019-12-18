# TestUIDarkMode
Test Cocoa App UI <br>
DarkMode App in Cocoa Obj-c

### Preview

![image](/Screenshots/screenshot_0.png)<br>

this is the code that does the magic<br>
place inside the file: **AppDelegate.m**<br>

```Obj-C
after: @implementation AppDelegate
```
---
```Obj-C
- (void) applicationWillFinishLaunching:(NSNotification *)notification {
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
			
			//visualEffect setWantsLayer: TRUE];
			//[visualEffect.layer setCornerRadius: 10.0f];
			
			// fix view containt
			NSView *view = [window contentView];
			[visualEffect willRemoveSubview: view];

			// set new content view and new view
			[window setContentView: visualEffect];
			[[window contentView] addSubview: view];
		}
		// end make effect **************************************************
		
		[[window standardWindowButton: NSWindowZoomButton] setHidden: TRUE];
		[window setMinSize:NSSizeFromCGSize(CGSizeMake([window minSize].width, 75))];
	}
	
	// Insert code here to initialize your application
}
```
