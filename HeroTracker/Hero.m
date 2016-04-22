//
//  Hero.m
//  HeroTracker
//
//  Created by Allen Spicer on 4/21/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "Hero.h"

@implementation Hero

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict
{
    Hero *aHero = nil;
    if (heroDict) {
        aHero = [[Hero alloc] init];
        aHero.heroName = [heroDict objectForKey:@"name"];
        NSString *realNameString = [NSString stringWithFormat:@"%@ %@ %@", [heroDict objectForKey:@"firstName"], [heroDict objectForKey:@"middleName"], [heroDict objectForKey:@"lastName"] ];
        aHero.realName = realNameString;
        aHero.height = [[heroDict objectForKey:@"height"] intValue];
        aHero.weight= [[heroDict objectForKey:@"weight"] intValue];
        aHero.powers = [heroDict objectForKey:@"powers"];
        
    }
    return aHero;
}

@end


