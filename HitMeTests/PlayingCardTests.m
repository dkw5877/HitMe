//
//  PlayingCardTests.m
//  HitMe
//
//  Created by user on 2/17/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PlayingCard.h"
#import "SetPlayingCard.h"

@interface PlayingCardTests : XCTestCase

@property(nonatomic)PlayingCard *playingCard;

@end

@implementation PlayingCardTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    //self.playingCard = [[PlayingCard alloc]init];
    
    [super setUp];
    self.playingCard = [[PlayingCard alloc] initWithRank:@"A"
                                                       suit:@"♣︎"
                                                      color:[UIColor blackColor]];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
    
    self.playingCard = nil;
}

//make sure card is not nil
- (void)testPlayingCardExists
{
    XCTAssertNotNil(self.playingCard, @"the playing card should exist");
}

//test that a card is the Ace of clubs
- (void)testCardIsAceOfClubs {
    XCTAssertEqualObjects(self.playingCard.rank, @"A", @"Rank should be A");
    XCTAssertEqualObjects(self.playingCard.suit, @"♣︎", @"Suit should be ♣︎");
    XCTAssertEqualObjects(self.playingCard.color, [UIColor blackColor],
                          @"Color should be black");
}

-(void)testPlayingCardType
{
    XCTAssertEqualObjects([self.playingCard class],[PlayingCard class],@"Class should be PlayingCard");
}


@end
