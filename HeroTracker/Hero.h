//
//  Hero.h
//  HeroTracker
//
//  Created by Allen Spicer on 4/21/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic) NSString *heroName;
@property (nonatomic) NSString *realName;
@property (assign)    NSInteger height;

+ (Hero *)heroWithDictionary:(NSDictionary *) heroDict;


@end
