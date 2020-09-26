//
//  Game.h
//  Flying Lemon
//
//  Created by dddiehard10 on 25/05/15.
//  Copyright (c) 2015 dddiehard10. All rights reserved.


// File corresponding to every devide except for 3.5 inch iPhone and iPad Pro.

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AudioToolbox/AudioToolbox.h>

int Lemonflying;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;

@interface Game : UIViewController <ADBannerViewDelegate> {
    
    IBOutlet UIImageView *Lemon;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TopTunnel;
    IBOutlet UIImageView *BottomTunnel;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIButton *Replay;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *Gameover;
    IBOutlet ADBannerView *Banner;
    
    
    NSTimer *LemonMovement;
    NSTimer *TunnelMovement;
    
    NSInteger HighScoreNumber;
    
    SystemSoundID Tap;
    SystemSoundID Crash;
    SystemSoundID Point;


}

-(IBAction)StartGame:(id)sender;
-(void)LemonMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)Gameover;
-(void)TapSound;
-(void)CrashSound;
-(void)PointSound;

@end
