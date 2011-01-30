//
//  Game.h
//  AppScaffold
//
//  Created by Daniel Sperl on 14.01.10.
//  Copyright 2010 Incognitek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEParallaxSprite.h"
#import "Ball.h"

@interface Game : SPStage {
	BEParallaxSprite *sky;
	BEParallaxSprite *mountains1;
	BEParallaxSprite *mountains2;
	BEParallaxSprite *grass;
	SPSprite *mContents;
	Ball *ball;
}

- (void)onTouch:(SPTouchEvent *)event;

@end
