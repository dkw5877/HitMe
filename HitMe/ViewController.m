//
//  ViewController.m
//  HitMe
//
//  Created by user on 2/5/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

#import "ViewController.h"
#import "HitMeGame.h"
#import "PlayingCard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *playingCardLabel;
@property(nonatomic)HitMeGame *game;
@property(nonatomic)PlayingCard *currentPlayingCard;
@property(nonatomic)BOOL isFaceDown;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //round the edges of the playing card
    self.playingCardLabel.layer.cornerRadius = self.playingCardLabel.frame.size.width/12;
    
    //initialize the game
    self.game = [[HitMeGame alloc]init];
    
    //setup the game, full and shuffle the deck
    [self.game fillAndShuffleDeck];
    
    
    //get a card from the deck
    [self.game nextCard];
}

/**
 *
 *
 **/
-(void)redrawCard
{
    self.playingCardLabel.text = [NSString stringWithFormat:@"%@ %@",self.currentPlayingCard.rank,self.currentPlayingCard.suit];

    
    if(self.isFaceDown)
    {
        //set the color of card to white
        self.playingCardLabel.textColor = [UIColor whiteColor];
    }
    else
    {
        self.playingCardLabel.textColor = self.currentPlayingCard.color;
        
    }
}



- (IBAction)flipCardButtonTouched:(UIButton *)sender {
    
    /*
    if ([self.playingCardLabel.textColor isEqual:[UIColor whiteColor]]) {
        self.playingCardLabel.textColor = [UIColor blackColor];
    } else self.playingCardLabel.textColor = [UIColor whiteColor];*/

    //change the status of the card
    self.isFaceDown = ! self.isFaceDown;
    [self redrawCard];
    
}

/**
 *
 *
 **/
-(void)getNextCard
{
    self.currentPlayingCard = [self.game nextCard];
    [self redrawCard];
}


- (IBAction)nextCardButtonTapped:(UIButton *)sender
{
    
    /*
     if([self.playingCardLabel.text isEqualToString:@"A ♣︎"])
     {
     self.playingCardLabel.text = @"3 ♠︎";
     }
     else
     {
     self.playingCardLabel.text = @"A ♣︎";
     }
     */
    
    [self getNextCard];
    
    //if there are more cards, then the button will be active
    sender.enabled = [self.game hasNextCard];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
