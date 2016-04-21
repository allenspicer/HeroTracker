//
//  HeroDetailViewController.m
//  HeroTracker
//
//  Created by Allen Spicer on 4/21/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "HeroTableViewController.h"
#import "Hero.h"

@interface HeroDetailViewController ()

@property NSMutableArray *heros;

@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"S.H.I.E.L.D. Hero Tracker";
    // Do any additional setup after loading the view.
    
    self.heros = [[NSMutableArray alloc]init];
    [self loadHeros];
    
}
    
    - (void)loadHeros
    {
        // create a string with the filepath to the Hero List JSON file.
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"json"];
        
        // built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
        NSArray *heros = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];

        // iterate over array of dictionaries them and convert them into Agent objects.
        //    Use the heros array from above as the array to iterate over. Create an NSDictionary object on the left side
        //    of the for-in loop. Use this inside the for loop to create an Hero object.
        
        for (NSDictionary*anHeroDictionary in heros) {
            Hero*someHero = [Hero heroWithDictionary:anHeroDictionary];
            [self.heros addObject:someHero];
            
        }
        
//still need to sort hero array by alphabetical by hero name. Technically won't change mine.
                             
        // instruct the table to reload its data.
      //  [self. reloadData];
    
    
    
    }
    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
