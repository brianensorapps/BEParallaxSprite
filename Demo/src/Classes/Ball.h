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
}

@property (nonatomic) BOOL jumping;

- (void)jump;
- (void)onEnterFrame:(SPEnterFrameEvent *)event;

@end
