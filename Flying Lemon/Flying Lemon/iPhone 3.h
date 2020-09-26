//
//  iPhone 3.h
//  Flying Lemon
//
//  Created by dddiehard10 on 15/02/16.
//  Copyright © 2016 dddiehard10. All rights reserved.


// Files corresponding to 3.5 inch iPhones

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AudioToolbox/AudioToolbox.h>

int Lemonflying3;
int RandomUpperTunnelPosition3;
int RandomLowerTunnelPosition3;
int ScoreNumber1iphone;

@interface iPhone_3 : UIViewController <ADBannerViewDelegate> {
    
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
