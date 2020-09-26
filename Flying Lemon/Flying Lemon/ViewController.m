//
//  ViewController.m
//  Flying Lemon
//
//  Created by dddiehard10 on 23/05/15.
//  Copyright (c) 2015 dddiehard10. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)Loadingsound {
    
    AudioServicesPlaySystemSound(Loadingsound);
}

-(BOOL)prefersStatusBarHidden {
    
    return YES;
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
        
    dddiehard10.animationImages = [NSArray arrayWithObjects:
                                   
                                   [UIImage imageNamed:@"01.png"],
                                   [UIImage imageNamed:@"02.png"],
                                   [UIImage imageNamed:@"03.png"],
                                   [UIImage imageNamed:@"04.png"],
                                   [UIImage imageNamed:@"05.png"],
                                   [UIImage imageNamed:@"06.png"],
                                   [UIImage imageNamed:@"07.png"],
                                   [UIImage imageNamed:@"08.png"],
                                   [UIImage imageNamed:@"09.png"],
                                   [UIImage imageNamed:@"10.png"],
                                   [UIImage imageNamed:@"11.png"],
                                   [UIImage imageNamed:@"12.png"],
                                   [UIImage imageNamed:@"14.png"],
                                   [UIImage imageNamed:@"15.png"],
                                   [UIImage imageNamed:@"16.png"],
                                   [UIImage imageNamed:@"17.png"],
                                   [UIImage imageNamed:@"18.png"],
                                   [UIImage imageNamed:@"19.png"],
                                   [UIImage imageNamed:@"20.png"],
                                   [UIImage imageNamed:@"21.png"],
                                   [UIImage imageNamed:@"22.png"],
                                   [UIImage imageNamed:@"23.png"],
                                   [UIImage imageNamed:@"24.png"],
                                   [UIImage imageNamed:@"25.png"],
                                   [UIImage imageNamed:@"26.png"], nil];
    
    [dddiehard10 setAnimationRepeatCount:1];
    
    dddiehard10.animationDuration = 3.5;
    
    [dddiehard10 startAnimating];
    
    NSURL *LoadingSound = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Tap Sound" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)LoadingSound, &Loadingsound);
    
    [self Loadingsound];
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:(BOOL)animated];
    
        double delayInSeconds = 3.7;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self performSegueWithIdentifier:@"Main Menu" sender:self];
        });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
