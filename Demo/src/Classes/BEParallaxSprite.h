//
//  BEParallaxSprite.h
//
//  Created by Brian Ensor on 1/29/11.
//  Copyright 2011 Brian Ensor Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BE_PARALLAX_DIRECTION_LEFT 1
#define BE_PARALLAX_DIRECTION_RIGHT 2
#define BE_PARALLAX_DIRECTION_UP 3
#define BE_PARALLAX_DIRECTION_DOWN 4

@interface BEParallaxSprite : SPSprite {
	SPImage *mImage1;
	SPImage *mImage2;
	float mSpeed;
	int mDirection;
	float mCurStep;
	bool mRunning;
}

@property (nonatomic, assign) bool running;
@property (nonatomic, assign) float speed;

- (void)onEnterFrame:(SPEnterFrameEvent *)event;
- (void)start;
- (void)stop;
- (id)initWithTexture:(SPTexture *)texture;
- (id)initWithTexture:(SPTexture *)texture speed:(float)speed;
- (id)initWithTexture:(SPTexture *)texture speed:(float)speed direction:(int)direction;
+ (BEParallaxSprite *)parallexSpriteWithTexture:(SPTexture *)texture;
+ (BEParallaxSprite *)parallexSpriteWithTexture:(SPTexture *)texture speed:(float)speed;
+ (BEParallaxSprite *)parallexSpriteWithTexture:(SPTexture *)texture speed:(float)speed direction:(int)direction;

@end
