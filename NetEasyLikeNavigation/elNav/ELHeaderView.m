//
//  ELHeaderView.m
//  NetEasyLikeNavigation
//
//  Created by ZhouQuan on 14-1-13.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "ELHeaderView.h"
#import "UIImageView+WebCache.h"


@interface ELHeaderView()
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;
@property (nonatomic, assign) CGPoint prePoint;
@end



@implementation ELHeaderView


- (id)initWithFrame:(CGRect)frame backGroudImageURL:(NSString *)backImageURL headerImageURL:(NSString *)headerImageURL title:(NSString *)title subTitle:(NSString *)subTitle{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -0.5*frame.size.height, frame.size.width, frame.size.height*1.5)];
        
        [_backImageView setImageWithURL:[NSURL URLWithString:backImageURL]];
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*0.5-0.125*frame.size.height, 0.25*frame.size.height, 0.25*frame.size.height, 0.25*frame.size.height)];
        [_headerImageView setImageWithURL:[NSURL URLWithString:headerImageURL]];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.6*frame.size.height, frame.size.width, frame.size.height*0.2)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.text = title;
        
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.85*frame.size.height, frame.size.width, frame.size.height*0.1)];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.text = subTitle;
        _titleLabel.textColor = [UIColor whiteColor];
        _subTitleLabel.textColor = [UIColor whiteColor];
        
        
        [self addSubview:_backImageView];
        [self addSubview:_headerImageView];
        [self addSubview:_titleLabel];
        [self addSubview:_subTitleLabel];
        self.clipsToBounds = YES;
        
    }
    return self;
}



-(void)willMoveToSuperview:(UIView *)newSuperview{
    [[self.viewController navigationController] setNavigationBarHidden:YES];
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew) context:Nil];
    self.scrollView.contentInset = UIEdgeInsetsMake(self.frame.size.height, 0 ,0, 0);
}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    CGPoint newOffset = [change[@"new"] CGPointValue];
    [self updateSubViewsWithScrollOffset:newOffset];
}

-(void)updateSubViewsWithScrollOffset:(CGPoint)newOffset{
    
    
    
    float destinaOffset = -60;
    float startChangeOffset = -self.scrollView.contentInset.top;
    
    newOffset = CGPointMake(newOffset.x, newOffset.y<startChangeOffset?startChangeOffset:(newOffset.y>destinaOffset?destinaOffset:newOffset.y));
    
    float titleDestinateOffset = self.frame.size.height-40;
    float newY = -newOffset.y-self.scrollView.contentInset.top;
    float d = destinaOffset-startChangeOffset;
    float alpha = 1-(newOffset.y-startChangeOffset)/d;
    self.subTitleLabel.alpha = alpha;
    self.frame = CGRectMake(0, newY, self.frame.size.width, self.frame.size.height);
    self.backImageView.frame = CGRectMake(0, -0.5*self.frame.size.height+(1.5*self.frame.size.height-60)*(1-alpha), self.backImageView.frame.size.width, self.backImageView.frame.size.height);
    
    self.titleLabel.frame = CGRectMake(0, 0.6*self.frame.size.height+(titleDestinateOffset-0.6*self.frame.size.height)*(1-alpha), self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16+(alpha)*4];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
