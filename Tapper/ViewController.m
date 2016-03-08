//
//  ViewController.m
//  Tapper
//
//  Created by Lalit on 2016-03-08.
//  Copyright © 2016 Bagga. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int numberOfTapsToWin;
    int currentTap;
}
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong,nonatomic) IBOutlet UIButton *tapper;
@property (strong,nonatomic) IBOutlet UITextField *textField;
@property (strong,nonatomic) IBOutlet UILabel *label;
@property(strong,nonatomic) IBOutlet UIImageView *TapperImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onPlayPressed:(id)sender {
    if (![self.textField.text isEqual:@""]){
        self.TapperImage.hidden = true;
        self.playButton.hidden = true;
        self.textField.hidden = true;
        self.tapper.hidden = false;
        self.label.hidden = false;
        numberOfTapsToWin = [self.textField.text intValue];
        currentTap = 0;
        self.label.text = @"0";
        [self.textField resignFirstResponder];
        
    }
    
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.textField resignFirstResponder];
    }
}
-(IBAction)onTap:(id)sender {
    currentTap ++;
    self.label.text = [NSString stringWithFormat:@"%d",currentTap];
    if (currentTap == numberOfTapsToWin) {
        [self AlertController];
        currentTap = 0;
        self.TapperImage.hidden = false;
        self.playButton.hidden = false;
        self.textField.hidden = false;
        self.tapper.hidden = true;
        self.label.hidden = true;
        self.textField.text = @"";
        
    }
}
-(void)AlertController{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Win" message:@"You Win" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertViewStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:true completion:nil];
}

@end
