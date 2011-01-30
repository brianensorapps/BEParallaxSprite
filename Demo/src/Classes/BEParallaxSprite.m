//
//  BEParallaxSprite.m
//
//  Created by Brian Ensor on 1/29/11.
//  Copyright 2011 Brian Ensor Apps. All rights reserved.
//

#import "BEParallaxSprite.h"

@implementation BEParallaxSprite

@synthesize speed = mSpeed;
@synthesize running = mRunning;

- (id)initWithTexture:(SPTexture *)texture {
	if (self = [super init]) {
		[self initWithTexture:texture speed:1 direction:BE_PARALLAX_DIRECTION_LEFT];
	}
	return self;
}

- (id)initWithTexture:(SPTexture *)texture speed:(float)speed {
	if (self = [super init]) {
		[self initWithTexture:texture speed:speed direction:BE_PARALLAX_DIRECTION_LEFT];
	}
	return self;
}

- (id)initWithTexture:(SPTexture *)texture speed:(float)speed direction:(int)direction {
	if (self = [super init]) {
		mRunning = YES;
		mDirection = direction;
		if (direction < 1 || direction > 4) {
			mDirection = BE_PARALLAX_DIRECTION_LEFT;
		}
		mSpeed = speed;
		mImage1 = [SPImage imageWithTexture:texture];
		[self addChild:mImage1];
		mImage2 = [SPImage imageWithTexture:texture];
		if (mDirection == BE_PARALLAX_DIRECTION_DOWN) {
			mImage2.y = mImage1.y-mImage2.height;
		}
		if (mDirection == BE_PARALLAX_DIRECTION_UP) {
			mImage2.y = mImage1.y+mImage1.height;
		}
		if (mDirection == BE_PARALLAX_DIRECTION_RIGHT) {
			mImage2.x = mImage1.x-mImage2.width;
		}
		if (mDirection == BE_PARALLAX_DIRECTION_LEFT) {
			mImage2.x = mImage1.x+mImage1.width;
		}
		[self addChild:mImage2];
		[self addEventListener:@selector(onEnterFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
	}
    return self;
}

+ (BEParallaxSprite *)parallexSpriteWithTexture:(SPTexture *)texture {
	return [[[BEParallaxSprite alloc] initWithTexture:texture speed:1 direction:BE_PARALLAX_DIRECTION_LEFT] autorelease];
}

+ (BEParallaxSprite *)parallexSpriteWithTexture:(SPTexture *)texture speed:(float)speed {
	return [[[BEParallaxSprite alloc] initWithTexture:texture speed:speed direction:BE_PARALLAX_DIRECTION_LEFT] autorelease];
}

+ (BEParallaxSprite *)parallexSpriteWithTexture:(SPTexture *)texture speed:(float)speed direction:(int)direction {
	return [[[BEParallaxSprite alloc] initWithTexture:texture speed:speed direction:direction] autorelease];
}

- (void)start {
	if (mRunning != YES) {
		mRunning = YES;
	}
}

- (void)stop {
	if (mRunning != NO) {
		mRunning = NO;
	}
}

- (void)onEnterFrame:(SPEnterFrameEvent *)event {
	if (mRunning == YES) {
		mCurStep += mSpeed;
		if (mCurStep < 1) return;
		if (mDirection == BE_PARALLAX_DIRECTION_DOWN) {
			mImage1.y += floor(mCurStep);
			mImage2.y += floor(mCurStep);
			if (mImage1.y >= mImage1.height) {
				mImage1.y = mImage2.y-mImage2.height;
			}
			if (mImage2.y >= mImage2.height) {
				mImage2.y = mImage1.y-mImage1.height;
			}
		}
		if (mDirection == BE_PARALLAX_DIRECTION_UP) {
			mImage1.y -= floor(mCurStep);
			mImage2.y -= floor(mCurStep);
			if (mImage1.y <= -mImage1.height) {
				mImage1.y = mImage2.y+mImage2.height;
			}
			if (mImage2.y <= -mImage2.height) {
				mImage2.y = mImage1.y+mImage1.height;
			}
		}
		if (mDirection == BE_PARALLAX_DIRECTION_RIGHT) {
			mImage1.x += floor(mCurStep);
			mImage2.x += floor(mCurStep);
			if (mImage1.x >= mImage1.width) {
				mImage1.x = mImage2.x-mImage2.width;
			}
			if (mImage2.x >= mImage2.width) {
				mImage2.x = mImage1.x-mImage1.width;
			}
		}
		if (mDirection == BE_PARALLAX_DIRECTION_LEFT) {
			mImage1.x -= floor(mCurStep);
			mImage2.x -= floor(mCurStep);
			if (mImage1.x <= -mImage1.width) {
				mImage1.x = mImage2.x+mImage2.width;
			}
			if (mImage2.x <= -mImage2.width) {
				mImage2.x = mImage1.x+mImage1.width;
			}
		}
		mCurStep -= floor(mCurStep);
	}
}

- (void)dealloc {
	[super dealloc];
}

@end
