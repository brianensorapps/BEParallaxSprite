//
//  Ball.h
//  ParallaxSprite Demo
//
//  Created by Brian Ensor on 1/23/11.
//  Copyright 2011 Brian Ensor Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ball : SPSprite {
	SPImage *ballImage;
	int rotation;
	BOOL jumping;
	BOOL running;
}

@property (nonatomic) BOOL jumping;
@property (nonatomic) BOOL running;

- (void)start;
- (void)stop;
- (void)jump;
- (void)onEnterFrame:(SPEnterFrameEvent *)event;

@end
