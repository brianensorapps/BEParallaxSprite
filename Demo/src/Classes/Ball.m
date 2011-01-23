//
//  Ball.m
//  ParallaxSprite Demo
//
//  Created by Brian Ensor on 1/23/11.
//  Copyright 2011 Brian Ensor Apps. All rights reserved.
//

#import "Ball.h"

@implementation Ball

@synthesize jumping;

- (id)init {
    if (self = [super init]) {
		ballImage = [SPImage imageWithContentsOfFile:@"ball.png"];
		ballImage.x = -ballImage.width/2;
		ballImage.y = -ballImage.height/2;
		ballImage.color = 0xFF0000;
		[self addChild:ballImage];
		[self addEventListener:@selector(onEnterFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
	}
    return self;
}

- (void)jump {
	[self setJumping:YES];
}

- (void)onEnterFrame:(SPEnterFrameEvent *)event {
	if (jumping) {
		if (self.y <= 320-57-30) {
			[self setJumping:NO];
		}
		else {
			self.y -= 3;
		}
	}
	else {
		if (self.y != 320-57) {
			self.y += 3;
		}
	}
	rotation += 20;
	self.rotation = SP_D2R(rotation);
}

- (void)dealloc {
    [super dealloc];
}

@end

