//
//  TipViewController.m
//  Tippy
//
//  Created by Sanjana Meduri on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self hideLabels];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:(true)];
}

- (IBAction)updateLabels:(id)sender {
    if (self.billField.text.length == 0)
        [self hideLabels];
    else
        [self showLabels];
    
    double tipPercentages[] = {0.15, 0.20, 0.25};
    double tipPercentage = tipPercentages[self.tipControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = tip + bill;
    
    self.tipLabel.text = [NSString stringWithFormat:@"Tip: $%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"Total: $%.2f", total];;
}

- (void) hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        CGRect labelsFrame = self.labelsContainerView.frame;
        
        billFrame.origin.y = 413;
        labelsFrame.origin.y = 555;
        
        self.billField.frame = billFrame;
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
    }];
};

- (void) showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        CGRect labelsFrame = self.labelsContainerView.frame;
        
        billFrame.origin.y = 213;
        labelsFrame.origin.y = 355;
        
        self.billField.frame = billFrame;
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 1;
    }];
};
/*
#pragma mark - Navigation 

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
