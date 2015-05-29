//
//  BTSecondViewController.m
//  BalloonExample
//
//  Created by Cameron Cooke on 05/02/2015.
//  Copyright (c) 2015 Brightec Ltd. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


#import "BTSecondViewController.h"
#import "BTAppTutorial.h"


@interface BTSecondViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *cars;
@end


@implementation BTSecondViewController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _cars = [@[@"Abarth", @"AC", @"Acura", @"Alfa Romeo", @"Allard", @"Alpina", @"Alpine", @"Alvis", @"AMC", @"Ariel", @"Armstrong Siddeley", @"Ascari", @"Aston Martin", @"Audi", @"Austin", @"Austin-Healey", @"Autobianchi", @"Auverland", @"Avanti", @"Beijing", @"Bentley", @"Berkeley", @"Bitter", @"Bizzarrini", @"BMW", @"Brilliance", @"Bristol", @"Bugatti", @"Buick", @"Cadillac", @"Caterham", @"Checker", @"Chevrolet", @"Chrysler", @"Citroen", @"Dacia", @"Daewoo", @"DAF", @"Daihatsu", @"Daimler", @"Datsun", @"De Tomaso", @"DKW", @"Dodge", @"Donkervoort", @"Eagle", @"Fairthorpe", @"Ferrari", @"Fiat", @"Fisker", @"Ford", @"GAZ", @"Geely", @"Ginetta", @"GMC", @"Holden", @"Honda", @"Hudson", @"Humber", @"Hummer", @"Hyundai", @"Infiniti", @"Innocenti", @"Isuzu", @"Italdesign", @"Jaguar", @"Jeep", @"Jensen", @"Kia", @"Koenigsegg", @"Lada", @"Lamborghini", @"Lancia", @"Land Rover", @"Lexus", @"Lincoln", @"Lotec", @"Lotus", @"Luxgen", @"Mahindra", @"Marcos", @"Maserati", @"Matra-Simca", @"Maybach", @"Mazda", @"MCC", @"McLaren", @"Mercedes-Benz", @"Mercury", @"MG", @"Mini", @"Mitsubishi", @"Monteverdi", @"Moretti", @"Morgan", @"Morris", @"Nissan", @"Noble", @"NSU", @"Oldsmobile", @"Opel", @"Packard", @"Pagani", @"Panoz", @"Peugeot", @"Pininfarina", @"Plymouth", @"Pontiac", @"Porsche", @"Proton", @"Reliant", @"Renault", @"Riley", @"Rolls-Royce", @"Rover", @"Saab", @"Saleen", @"Samsung", @"Saturn", @"Scion", @"Seat", @"Simca", @"Singer", @"Skoda", @"Smart", @"Spyker", @"SsangYong", @"SSC", @"Steyr", @"Studebaker", @"Subaru", @"Sunbeam", @"Suzuki", @"Talbot", @"Tata", @"Tatra", @"Tesla", @"Toyota", @"Trabant", @"Triumph", @"TVR", @"Vauxhall", @"Vector", @"Venturi", @"Volkswagen", @"Volvo", @"Wartburg", @"Westfield", @"Willys-Overland", @"Xedos", @"Zagato", @"Zastava", @"ZAZ", @"Zenvo", @"ZIL"] mutableCopy];
    }
    return self;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.tableView.indexPathForSelectedRow) {
        [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
    }
    
    // make sure we're appearing in response to just being presented by previous tutorial step and not
    // another reason.
    if ([BTAppTutorial sharedInstance].currentStep == 1) {
        
        self.tableView.scrollEnabled = NO;
        
        [[BTAppTutorial sharedInstance] showNextStepWithAnchorView:nil targetView:nil completionCallback:^(NSInteger currentStep) {

            // get the cell
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
            [[BTAppTutorial sharedInstance] showNextStepWithAnchorView:cell targetView:cell completionCallback:^(NSInteger currentStep) {
                self.tableView.scrollEnabled = YES;
            }];
        }];
    } else if ([BTAppTutorial sharedInstance].currentStep == 5) {
        
        // show final step as the 
        [[BTAppTutorial sharedInstance] showNextStepWithAnchorView:nil targetView:nil completionCallback:^(NSInteger currentStep) {
            [[BTAppTutorial sharedInstance] endTutorial];
        }];
    }
}


- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
    
}


# pragma mark -
# pragma mark TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    cell.textLabel.text = self.cars[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


@end
