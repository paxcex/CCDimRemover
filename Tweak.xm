#import <version.h>

%group DimRemoval

%hook ControlCenterContainerView

-(void)controlCenterWillPresent {

	%orig;
	UIView *dimView;

	if(kCFCoreFoundationVersionNumber) {
		dimView = [self valueForKey:@"_darkeningContainer"];
	} else {
		dimView = [self valueForKey:@"_darkeningView"];
	}

	dimView.alpha = 0.05;
}
%end

%end

%ctor {


	Class controlCenterClass = objc_getClass("CCUIControlCenterContainerView") ? objc_getClass("CCUIControlCenterContainerView") : objc_getClass("SBControlCenterContainerView");


	%init(DimRemoval, ControlCenterContainerView=controlCenterClass);
}
