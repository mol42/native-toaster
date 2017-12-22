//
//  RNNativeToaster
//
#import <UIKit/UIKit.h>
#import "RCTBridgeModule.h"
#import "UIView+Toast.h"

NSInteger const RNNativeToasterBottomOffset = 40;
double const RNNativeToasterShortDuration = 3.0;
double const RNNativeToasterLongDuration = 5.0;
NSInteger const RNNativeToasterGravityBottom = 1;
NSInteger const RNNativeToasterGravityCenter = 2;
NSInteger const RNNativeToasterGravityTop = 3;

@interface RNNativeToaster : NSObject <RCTBridgeModule>
@end

@implementation RNNativeToaster {
}

/*
 * Objective C sınıfı init ediliyor.
 *
 *
 */
- (instancetype)init {
    self = [super init]
    return self;
}


RCT_EXPORT_MODULE()

/**
 * Native taraftaki constant değerlerini React Native tarafında
 * kullanabilmek için export ederiz.
 *
 */
- (NSDictionary *)constantsToExport {
    return @{
             @"SHORT": [NSNumber numberWithDouble:RNNativeToasterShortDuration],
             @"LONG": [NSNumber numberWithDouble:RNNativeToasterLongDuration],
             @"BOTTOM": [NSNumber numberWithInteger:RNNativeToasterGravityBottom],
             @"CENTER": [NSNumber numberWithInteger:RNNativeToasterGravityCenter],
             @"TOP": [NSNumber numberWithInteger:RNNativeToasterGravityTop]
             };
}

RCT_EXPORT_METHOD(show:(NSString *)msg duration:(double)duration  gravity:(nonnull NSNumber *)gravity customStyle:(NSDictionary *)customStyle {
    [self _show:msg duration:duration gravity:gravity.intValue customStyle:customStyle];
});

RCT_EXPORT_METHOD(showWithGravity:(NSString *)msg duration:(double)duration gravity:(nonnull NSNumber *)gravity customStyle:(NSDictionary *)customStyle {
    [self _show:msg duration:duration gravity:gravity.intValue customStyle:customStyle];
});

- (UIViewController *)visibleViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil)
    {
        return rootViewController;
    }
    if ([rootViewController.presentedViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        
        return [self visibleViewController:lastViewController];
    }
    if ([rootViewController.presentedViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController.presentedViewController;
        UIViewController *selectedViewController = tabBarController.selectedViewController;
        
        return [self visibleViewController:selectedViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    
    return [self visibleViewController:presentedViewController];
}

- (void)_show:(NSString *)msg duration:(NSTimeInterval)duration gravity:(NSInteger)gravity customStyle:(NSDictionary *)customStyle {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *ctrl = [self visibleViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
        UIView *root = [ctrl view];
        CGRect bound = root.bounds;
        
        if (bound.size.height > RNNativeToasterBottomOffset*2) {
            bound.origin.y += RNNativeToasterBottomOffset;
            bound.size.height -= RNNativeToasterBottomOffset*2;
        }
        
        UIView *view = [[UIView alloc] initWithFrame:bound];
        view.userInteractionEnabled = NO;
        [root addSubview:view];
        UIView __weak *blockView = view;
        id position;
        if (gravity == RNNativeToasterGravityTop) {
            position = CSToastPositionTop;
        } else if (gravity == RNNativeToasterGravityCenter) {
            position = CSToastPositionCenter;
        } else {
            position = CSToastPositionBottom;
        }
        [view makeToast:msg
               duration:duration
               position:position
            customStyle:customStyle
                  title:nil
                  image:nil
                  style:nil
             completion:^(BOOL didTap) {
                 [blockView removeFromSuperview];
             }];
    });
}

@end
