//
//  MainMenu.m
//  Flying Lemon
//
//  Created by dddiehard10 on 25/05/15.
//  Copyright (c) 2015 dddiehard10. All rights reserved.
//

#import "MainMenu.h"

@interface MainMenu ()

@end

@implementation MainMenu

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    Highscore.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL)prefersStatusBarHidden {
    
    return YES;
}

//Admob Methods



//iAd Methods

#pragma iAd Delegate Methods

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



