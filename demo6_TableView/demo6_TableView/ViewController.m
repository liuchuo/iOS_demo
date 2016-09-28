//
//  ViewController.m
//  demo6_TableView
//
//  Created by ChenXin on 16/9/21.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

#import "ViewController.h"
#import "DetailedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -- table data source --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 5;
    }else {
        return 6;
    }
}

//an example for header view

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * header = [[UIView alloc] init];
    header.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:212.0/255.0 blue:217.0/255.0 alpha:1.0];
    return header;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.rowHeight = 60;
    NSString *cellID = [NSString stringWithFormat:@"cell_sec_%ld", (long)indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Hi, this is section %ld, row %ld", (long)indexPath.section, (long)indexPath.row];
    
    if( indexPath.section == 0 ) {
        cell.imageView.image = [UIImage imageNamed:@"milkicon"];
    } else if( indexPath.section == 1) {
        cell.imageView.image = [UIImage imageNamed:@"cherryicon"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"umbrellaicon"];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

#pragma mark -- table events --
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetail" sender:indexPath];
}



#pragma mark -- ViewController lifecycle --
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- view controller data passing --
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [segue.identifier isEqualToString:@"showDetail"] ) {
        DetailedViewController *dvc = segue.destinationViewController;
        dvc.indexPath = sender;
    }
}


@end
