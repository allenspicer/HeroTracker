//
//  HeroTableViewController.m
//  HeroTracker
//
//  Created by Allen Spicer on 4/21/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "HeroTableViewController.h"
#import "Hero.h"
#import "HeroDetailViewController.h"

@interface HeroTableViewController ()

@property NSMutableArray *heros;

@end

@implementation HeroTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //alternative version:     [self setTitle:@"Test"];
   self.title = @"S.H.I.E.L.D. Hero Tracker";

    self.heros = [[NSMutableArray alloc]init];
    [self loadHeros];
    
}

- (void)loadHeros
{
    // create a string with the filepath to the Hero List JSON file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"json"];
    
    // built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *heros = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    // iterate over array of dictionaries them and convert them into Hero objects.
    //    Use the heros array from above as the array to iterate over. Create an NSDictionary object on the left side
    //    of the for-in loop. Use this inside the for loop to create an Hero object.
    
    for (NSDictionary*anHeroDictionary in heros) {
        Hero*someHero = [Hero heroWithDictionary:anHeroDictionary];
        [self.heros addObject:someHero];
        
}
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    //
//    // 8. We need to set the segue identifier to the same one we used in the segue on the storyboard
//    //
   if ([[segue identifier] isEqualToString:@"DetailIdentifier"])
    {
//        //
//        // 9. We need to get an NSIndexPath for the selected cell
//        //
        NSIndexPath *indexPath = [self.tableView indexPathForCell:(sender)];
//        
//        //
//        // 10. Now we're going to use the "row" property of the indexPath from above to pull out the associated Agent object
//        //     from the agents array.
//        //
        Hero *selectedHero = self.heros[indexPath.row];
//        

//        
        HeroDetailViewController *destinationViewController =  [segue destinationViewController];
//        
       destinationViewController.hero = selectedHero;
//        
   }
}

#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.heros.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"heroIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Hero *aHero = self.heros[indexPath.row];
    cell.textLabel.text = aHero.heroName;
    cell.detailTextLabel.text = aHero.realName;

    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
