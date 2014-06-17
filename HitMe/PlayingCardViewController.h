//
//  PlayingCardViewController.h
//  HitMe
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlayingCard;

@interface PlayingCardViewController : UIViewController
@property (nonatomic, readonly)PlayingCard* playingCard;
@property (nonatomic)BOOL isFaceUp;

-(void)displayCard:(PlayingCard*)playingCard;
@end
