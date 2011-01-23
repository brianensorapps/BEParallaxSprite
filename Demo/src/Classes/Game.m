//
//  Game.m
//  AppScaffold
//
//  Created by Daniel Sperl on 14.01.10.
//  Copyright 2010 Incognitek. All rights reserved.
//

#import "Game.h" 

@implementation Game

- (id)initWithWidth:(float)width height:(float)height
{
    if (self = [super initWithWidth:width height:height])
    {
		mContents = [[SPSprite alloc] init];
		mContents.rotation = SP_D2R(90);
		mContents.x = 320;
		[self addChild:mContents];
		[mContents release];
		BEParallaxSprite *sky = [BEParallaxSprite parallexSpriteWithTexture:[SPTexture textureWithContentsOfFile:@"sky.png"]
																	  speed:0.5
																  direction:BE_PARALLAX_DIRECTION_LEFT];
		[mContents addChild:sky];
		BEParallaxSprite *mountains1 = [BEParallaxSprite parallexSpriteWithTexture:[SPTexture textureWithContentsOfFile:@"mountainsback.png"]
																			 speed:3
																		 direction:BE_PARALLAX_DIRECTION_LEFT];
		[mContents addChild:mountains1];
		BEParallaxSprite *mountains2 = [BEParallaxSprite parallexSpriteWithTexture:[SPTexture textureWithContentsOfFile:@"mountainsfront.png"]
																			 speed:5
																		 direction:BE_PARALLAX_DIRECTION_LEFT];
		[mContents addChild:mountains2];
		BEParallaxSprite *grass = [BEParallaxSprite parallexSpriteWithTexture:[SPTexture textureWithContentsOfFile:@"grass.png"]
																		speed:10
																	direction:BE_PARALLAX_DIRECTION_LEFT];
		grass.y = 320-grass.height;
		[mContents addChild:grass];
		ball = [[Ball alloc] init];
		ball.x = 480/2;
		ball.y = 320-57;
		[mContents addChild:ball];
		[ball release];
		[self addEventListener:@selector(onTouch:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
	}
    return self;
}

- (void)onTouch:(SPTouchEvent *)event {
	SPTouch *touch = [event.touches anyObject];
	if (touch.phase == SPTouchPhaseBegan) {
		if (ball.jumping == NO) {
			[ball jump];
		}
	}
}

@end
