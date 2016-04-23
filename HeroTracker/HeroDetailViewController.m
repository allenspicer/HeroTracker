//
//  HeroDetailViewController.m
//  HeroTracker
//
//  Created by Allen Spicer on 4/21/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "HeroDetailViewController.h"
//#import "HeroTableViewController.h"
//#import "Hero.h"

@interface HeroDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *heroNameLabel;
@property (weak, nonatomic) IBOutlet UILabel* realNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *powersLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel* weightLabel;


- (void)configureView;

@end

@implementation HeroDetailViewController

#pragma mark - Managing the detail view

- (void)setHero:(Hero *)newHero
{
    if (_hero != newHero) {
        _hero = newHero;
        [self configureView];
    }
}

- (void)configureView
{
    if (self.hero)
    {
//        NSString *heroName = self.hero.heroName;
//        NSArray *heroNameArray = [heroName componentsSeparatedByString:@" "];
//        
//        self.title = [NSString stringWithFormat:@"%@", [heroNameArray lastObject]];
        
        self.title = self.hero.heroName;
        self.realNameLabel.text = self.hero.realName;
        self.powersLabel.text = self.hero.powers;
        //self.heightLabel.text = self.hero.height;
        //self.weightLabel.text = self.hero.weight;

        
        //self.height.text = [NSString stringWithFormat:@"Level # %i", (int)self.hero.height];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.

    [self configureView];
}
        
//still need to sort hero array by alphabetical by hero name. Technically won't change mine.
        // then instruct the table to reload its data.
      //  [self. reloadData];


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
