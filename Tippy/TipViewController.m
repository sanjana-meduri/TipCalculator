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
@property (weak, nonatomic) IBOutlet UILabel *labelsContainerView;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *tipAmt;

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
    if (self.billField.text.length == 0) [self hideLabels];
    else [self showLabels];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * (self.tipSlider.value) / 100;
    double total = tip + bill;
    
    self.tipLabel.text = [NSString stringWithFormat:@"Tip: $%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"Total: $%.2f", total];;
    self.tipAmt.text = [NSString stringWithFormat:@"Tip Percent: %.0f", self.tipSlider.value];
}

- (void) hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        CGRect labelsFrame = self.labelsContainerView.frame;
        CGRect sliderFrame = self.tipSlider.frame;
        CGRect amtFrame = self.tipAmt.frame;
        
        billFrame.origin.y = 230;
        labelsFrame.origin.y = 429;
        sliderFrame.origin.y = 581;
        amtFrame.origin.y = 552;
        
        self.billField.frame = billFrame;
        self.labelsContainerView.frame = labelsFrame;
        self.tipSlider.frame = sliderFrame;
        self.tipAmt.frame = amtFrame;
        
        self.labelsContainerView.alpha = 0;
        self.tipSlider.alpha = 0;
        self.tipAmt.alpha = 0;
    }];
};

- (void) showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        CGRect labelsFrame = self.labelsContainerView.frame;
        CGRect sliderFrame = self.tipSlider.frame;
        CGRect amtFrame = self.tipAmt.frame;

        billFrame.origin.y = 130;
        labelsFrame.origin.y = 229;
        sliderFrame.origin.y = 381;
        amtFrame.origin.y = 352;

        self.billField.frame = billFrame;
        self.labelsContainerView.frame = labelsFrame;
        self.tipSlider.frame = sliderFrame;
        self.tipAmt.frame = amtFrame;

        self.labelsContainerView.alpha = 1;
        self.tipSlider.alpha = 1;
        self.tipAmt.alpha = 1;
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
