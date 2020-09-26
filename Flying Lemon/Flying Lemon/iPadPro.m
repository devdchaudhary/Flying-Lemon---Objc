//
//  iPadPro.m
//  Flying Lemon
//
//  Created by dddiehard10 on 15/02/16.
//  Copyright © 2016 dddiehard10. All rights reserved.
//

#import "iPadPro.h"

@interface iPadPro ()

@end


@implementation iPadPro

-(BOOL)prefersStatusBarHidden {
    
    return YES;
}

- (void)viewDidLoad {
    
    TopTunnel.hidden = NO;
    BottomTunnel.hidden = NO;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    Replay.hidden = YES;
    
    Gameover.hidden = YES;
    
    Banner.hidden = YES;
    
    ScoreNumberPro = 0;
    
    [super viewDidLoad];
    
}

-(void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

-(void)TapSound {
    
    AudioServicesPlaySystemSound(Tap);
    
}


-(void)CrashSound {
    
    AudioServicesPlaySystemSound(Crash);
    
    
}

-(void)PointSound {
    
    AudioServicesPlaySystemSound(Point);
    
}


-(IBAction)StartGame:(id)sender {
    
    [self TapSound];
    
    StartGame.hidden = YES;
    
    LemonMovement = [NSTimer scheduledTimerWithTimeInterval:0.020 target:self selector:@selector(LemonMoving) userInfo:nil repeats:YES];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.004 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSURL *TapSound = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Tap Sound" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)TapSound, &Tap);
    
    [self TapSound];
    
    LemonflappingPro = 30;
    
}

-(void)LemonMoving{
    
    Lemon.center = CGPointMake(Lemon.center.x, Lemon.center.y - LemonflappingPro);
    
    LemonflappingPro = LemonflappingPro - 5;
    
    if (LemonflappingPro < -15) {
        LemonflappingPro = -15;
    }
    
    if (LemonflappingPro > 0) {
        Lemon.image = [UIImage imageNamed:@"Lemon up.png"];
    }
    
    if (LemonflappingPro == 0) {
        Lemon.image = [UIImage imageNamed:@"Lemon straight.png"];
    }
    
    if (LemonflappingPro
        < 0) {
        Lemon.image = [UIImage imageNamed:@"Lemon down.png"];
    }
    
    
}

-(void)PlaceTunnels{
    
    
    
    RandomUpperTunnelPositionPro = arc4random() %270;
    RandomUpperTunnelPositionPro = RandomUpperTunnelPositionPro - 280;
    RandomLowerTunnelPositionPro = RandomUpperTunnelPositionPro + 1300;
    
    TopTunnel.center = CGPointMake(900, RandomUpperTunnelPositionPro);
    BottomTunnel.center = CGPointMake(900, RandomLowerTunnelPositionPro);
    
}
-(void)TunnelMoving{
    
    TopTunnel.center = CGPointMake(TopTunnel.center.x - 1, TopTunnel.center.y);
    
    BottomTunnel.center = CGPointMake(BottomTunnel.center.x - 1, BottomTunnel.center.y);
    
    NSURL *PointSound = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Point Sound" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)PointSound, &Point);
    
    if (TopTunnel.center.x < -50) {
        
        [self PlaceTunnels];
        
    }
    
    if (TopTunnel.center.x == 100) {
        
        [self Score];
    }
    
    if (CGRectIntersectsRect(Lemon.frame, TopTunnel.frame)) {
        [self Gameover];
        [self CrashSound];
    }
    
    if (CGRectIntersectsRect(Lemon.frame, BottomTunnel.frame)) {
        [self Gameover];
        [self CrashSound];
    }
    
    if (CGRectIntersectsRect(Lemon.frame, Bottom.frame)) {
        [self Gameover];
        [self CrashSound];
    }
    
    if (CGRectIntersectsRect(Lemon.frame, Top.frame)) {
        [self Gameover];
        [self CrashSound];
    }
    
}

-(void)Gameover {
    
    if (ScoreNumberPro > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumberPro forKey:@"HighScoreSaved"];
    }
    
    NSURL *CrashSound = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Crash Sound" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)CrashSound, &Crash);
    
    [TunnelMovement invalidate];
    
    [LemonMovement invalidate];
    
    [self CrashSound];
    
    Replay.hidden = NO;
    
    Gameover.hidden = NO;
    
    Lemon.hidden = YES;
    
    Banner.hidden = NO;
    
    TopTunnel.hidden = YES;
    
    BottomTunnel.hidden = YES;
    
    
}

-(void)Score {
    
    ScoreNumberPro = ScoreNumberPro + 1;
    
    ScoreLabel.text = [NSString stringWithFormat:@"%i",ScoreNumberPro];
    
}

// iAd Method


-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
    
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
    
}

@end
