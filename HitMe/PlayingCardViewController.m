//
//  PlayingCardViewController.m
//  HitMe
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCard.h"

@interface PlayingCardViewController ()

@property (weak, nonatomic) IBOutlet UILabel *playingCardLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playingCardBackImageView;
@property (nonatomic,readwrite)PlayingCard* playingCard;
@end

@implementation PlayingCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.layer.cornerRadius = self.view.frame.size.width/32;
    
}

- (BOOL)isFaceUp
{
    return self.playingCardBackImageView.hidden;
}

- (void)setIsFaceUp:(BOOL)isFaceUp
{
    self.playingCardBackImageView.hidden = isFaceUp;
}

- (IBAction)viewTappedToFlipCard:(UITapGestureRecognizer *)sender
{
    
    [UIView animateWithDuration:.25 animations:^{
        
        //create an affine transformation
        //Returns an affine transformation matrix constructed from scaling values provided, which are the factors to scale the x-axis and y-axis. In this case we are shrinking the x-axis to 100th the size
        self.view.transform = CGAffineTransformMakeScale(0.01, 1);
        
        //set the views center to current horizontal center plus the center of the frame size
        self.view.center = CGPointMake(self.view.center.x + self.view.frame.size.width/2, self.view.center.y);
        
        
    } completion:^(BOOL finished) {
        //once the animation is complete, set image to hidden/unhidden
        self.playingCardBackImageView.hidden = !self.playingCardBackImageView.hidden;
        
        //execute a view animation and set the tranform to the identity transform
        [UIView animateWithDuration:.25 animations:^{
            self.view.transform = CGAffineTransformIdentity;
        }];
    }];
}


-(void)displayCard:(PlayingCard*)playingCard
{
    self.playingCard = playingCard;
    self.playingCardLabel.textColor = self.playingCard.color;
    self.playingCardLabel.text = [NSString stringWithFormat:@"%@ %@",self.playingCard.rank, self.playingCard.suit];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
