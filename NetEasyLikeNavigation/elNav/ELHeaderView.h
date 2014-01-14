//
//  ELHeaderView.h
//  NetEasyLikeNavigation
//
//  Created by ZhouQuan on 14-1-13.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELHeaderView : UIView
@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) UIScrollView *scrollView;
/**
 *  initialization
 *
 *  @param frame          frame
 *  @param backImageURL   Background Image‘s URL
 *  @param headerImageURL the Image in the Center
 *  @param title          The Header Tiltle
 *  @param subTitle       The Subtitle
 *
 *  @return A Animated Header View
 */
- (id)initWithFrame:(CGRect)frame backGroudImageURL:(NSString *)backImageURL headerImageURL:(NSString *)headerImageURL title:(NSString *)title subTitle:(NSString *)subTitle;
-(void)updateSubViewsWithScrollOffset:(CGPoint)newOffset;
@end
