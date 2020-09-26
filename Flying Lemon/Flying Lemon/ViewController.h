//
//  ViewController.h
//  Flying Lemon
//
//  Created by dddiehard10 on 23/05/15.
//  Copyright (c) 2015 dddiehard10. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <iAd/iAd.h>


@interface ViewController : UIViewController <ADBannerViewDelegate> {
    
    IBOutlet UIImageView *dddiehard10;
        
    SystemSoundID Loadingsound;
    
}

-(void)Loadingsound;


@end

