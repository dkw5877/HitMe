//
//  ViewController.m
//  HitMe
//
//  Created by user on 2/5/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

#import "GameViewController.h"
#import "HitMeGame.h"
#import "PlayingCardViewController.h"


@interface GameViewController ()

@property(nonatomic)HitMeGame *game;
@property(nonatomic)PlayingCardViewController* playingCardVC;
@property(nonatomic)PlayingCardViewController* nextCardVC;

@property (weak, nonatomic) IBOutlet UIImageView *deckPlaceholderImageView;
@property (weak, nonatomic) IBOutlet UIView *playingCardView;

@end

@implementation GameViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpGame];
    [self setupGameBoard];
}


-(void)setupGameBoard
{
    self.playingCardVC = [[self childViewControllers]firstObject];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        //set the alpha of both cards to transparent
        self.deckPlaceholderImageView.alpha = 0;
        self.playingCardView.alpha = 0;
        
    } completion:^(BOOL finished) {
        //when the animation is complete, show the next card
        [self showNextCard];
    }];
}

- (void)setUpGame
{
    //initialize the game
    self.game = [[HitMeGame alloc]init];
    
    //setup the game, full and shuffle the deck
    [self.game fillAndShuffleDeck];
}


-(void)createNextCard
{
    
    //create a new playing card view controller from a storyboard id
    self.nextCardVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PlayingCardScene"];
    
    //set the size of the view controller to the size of the card image
    self.nextCardVC.view.frame = self.deckPlaceholderImageView.frame;
    
    //add the playing card view to game view
    [self.view addSubview:self.nextCardVC.view];
    
    //make the card transparent
    self.nextCardVC.view.alpha = 0;
    
    //set the next card to be face up if the previous card was face up
    self.nextCardVC.isFaceUp = self.playingCardVC.isFaceUp;
    
    //animate the card into view (fade the card into view)
    [UIView animateWithDuration:0.0 animations:^{
        self.nextCardVC.view.alpha = 1.0;
    }];
}

-(void)showNextCard
{
    if (self.game.hasNextCard)
    {
        [self createNextCard];
        [self.nextCardVC displayCard:[self.game nextCard]];
    }
}



- (IBAction)nextCardTapped:(UIButton *)nextCardButton
{
    [self showNextCard];
    
    //if there are more cards, then the button will be active
    nextCardButton.enabled = [self.game hasNextCard];
}

- (IBAction)viewDidGetSwipeUp:(UISwipeGestureRecognizer *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.nextCardVC.view.frame = self.playingCardView.frame;
        self.playingCardVC.view.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        self.playingCardVC = self.nextCardVC;
        [self showNextCard];
        
    }];
}


@end
