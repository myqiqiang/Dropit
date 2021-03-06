//
//  Dropitehavior.m
//  Dropit
//
//  Created by myqiqiang on 14-6-15.
//  Copyright (c) 2014年 myqiqiang. All rights reserved.
//

#import "Dropitehavior.h"

@interface Dropitehavior ()
@property (strong,nonatomic) UIGravityBehavior *gravity;
@property (strong,nonatomic) UICollisionBehavior *collider;
@property (strong,nonatomic) UIDynamicItemBehavior *animatiorOptions;
@end

@implementation Dropitehavior


-(UIGravityBehavior *)gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
    }
    
    return _gravity;
}

-(UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collider;
}

-(UIDynamicItemBehavior *)animatiorOptions
{
    if(!_animatiorOptions){
        _animatiorOptions = [[UIDynamicItemBehavior alloc] init];
        _animatiorOptions.allowsRotation = NO;
    }
    return _animatiorOptions;
}

-(void)addItem:(id<UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collider addItem:item];
    [self.animatiorOptions addItem:item];
}

-(void)removeItem:(id<UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.animatiorOptions removeItem:item];
}

-(instancetype)init
{
    self = [super init];
    
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    [self addChildBehavior:self.animatiorOptions];
    
    return self;
}
@end
