//
//  VOSDetailPlayerViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 1/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSDetailPlayerViewController.h"
#import "VOSPlayer.h"
#import "VOSTeam.h"
#import "VOSPhotoContainer.h"
#import "VOSPhotoViewController.h"


@interface VOSDetailPlayerViewController ()

@property (nonatomic, strong) VOSPlayer *model;
@property (nonatomic) BOOL new;
@property (nonatomic) BOOL deletePlayer;
@property (strong, nonatomic) NSMutableArray *arrayDorsal;

@end

@implementation VOSDetailPlayerViewController

#pragma mark - Init
-(id) initWithModel:(id) model{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    return self;
}

-(id) initForNewPlayerInTeam: (VOSTeam *) team{
    VOSPlayer *player = [VOSPlayer playerWithName:@"New Player"
                                             team:team
                                          context:team.managedObjectContext ];

    _new = YES;
    return [self initWithModel:player];
}

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    self.arrayDorsal = [[NSMutableArray alloc] initWithCapacity:100];
    for (int ind = 0; ind <= 99; ind++){
        [self.arrayDorsal addObject:[NSString stringWithFormat:@"%d", ind]];
    }
    UIPickerView *picker = [UIPickerView new];
    
    picker.delegate = self;
    picker.dataSource = self;
    self.dorsalView.inputView = picker;

}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // modelo -> vista
   
    self.playerNameView.text = self.model.name;
    self.dorsalView.text = [NSString stringWithFormat:@"%@", self.model.dorsal];
    
    UIImage *img = self.model.photo.image;
    if (!img) {
        img = [UIImage imageNamed:@"Player_Jumping.png"];
    }
    
    self.photoView.image = img;
    
    [self startObservingKeyboard];
    
    [self setupInputAccessoryView];

    // Añadimos botones a la barra de navegación
    UIBarButtonItem *edit = nil;
    if (self.new) {
        // Add the cancel button
        edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                             target:self
                                                             action:@selector(delete:)];
    }else{
        // Add the delete button
        edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                             target:self
                                                             action:@selector(delete:)];
    }
    // Botón de compartir
    UIBarButtonItem *share = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(displayActions:)];
    self.navigationItem.rightBarButtonItems = @[share, edit];
    
    // delegados
    self.playerNameView.delegate = self;
    self.dorsalView.delegate = self;
    
    // Añadimos un gesture recognizer a la foto
    self.photoView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(displayDetailPhoto:)];
    [self.photoView addGestureRecognizer:tap];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (self.deletePlayer) {
        [self.model.managedObjectContext deleteObject:self.model];
    }else{
        // vista -> modelo
        self.model.dorsal = @([self.dorsalView.text intValue]);
        self.model.name = self.playerNameView.text;
        self.model.photo.image = self.photoView.image;
    }
    [self stopObservingKeyboard];
}

#pragma mark -  TextView
-(void) setupInputAccessoryView{
    
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 44)];
    
    // Buttons
    UIBarButtonItem *sep = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                         target:nil
                                                                         action:nil];
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                         target:self
                                                                         action:@selector(hideKeyboard:)];

    // añadimos los botones a la barra de navegación creada
    [bar setItems:@[sep, done]];
    
    // asignamos la barra de navegación al campo de texto
    self.playerNameView.inputAccessoryView = bar;
    self.dorsalView.inputAccessoryView = bar;
}

#pragma mark - Keyboard
-(void) startObservingKeyboard{

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillDisappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
}

-(void) stopObservingKeyboard{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

-(void)notifyThatKeyboardWillAppear:(NSNotification *)notification{
    
    // extraer el userInfo con la información auxiliar de la notificación.
    NSDictionary *dict = notification.userInfo;
    
    // Extraer la duración de la animación
    double duration = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Cambiar las propiedades de la caja de texto
/*
    [UIView animateWithDuration:duration
                          delay:0
                        options:0
                     animations:^{
                         // Cambiar el CGFrame moviendo la caja de texto para arriba
                         self.dorsalView.frame = CGRectMake(self.playerNameView.frame.origin.x,
                                                            self.playerNameView.frame.origin.y,
                                                            self.dorsalView.frame.size.width,
                                                            self.dorsalView.frame.size.height );
                         
                     } completion:nil];
*/
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.9
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         // Cambiar el CGFrame moviendo la caja de texto para arriba
                         self.dorsalView.frame = CGRectMake(self.playerNameView.frame.origin.x,
                                                            self.playerNameView.frame.origin.y,
                                                            self.dorsalView.frame.size.width,
                                                            self.dorsalView.frame.size.height );
                     }
                     completion:nil];

    [UIView animateWithDuration:duration
                     animations:^{
                         self.dorsalView.alpha = 0.8;
                     }];

}

-(void)notifyThatKeyboardWillDisappear:(NSNotification *)notification{
    // extraer el userInfo con la información auxiliar de la notificación.
    NSDictionary *dict = notification.userInfo;
    
    // Extraer la duración de la animación
    double duration = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Cambiar las propiedades de la caja de texto
    [UIView animateWithDuration:duration
                          delay:0
                        options:0
                     animations:^{
                         // Cambiar el CGFrame moviendo la caja de texto para arriba
                         self.dorsalView.frame = CGRectMake(166,
                                                            219,
                                                            self.dorsalView.frame.size.width,
                                                            self.dorsalView.frame.size.height );
                         
                     } completion:nil];

    [UIView animateWithDuration:duration
                     animations:^{
                         self.dorsalView.alpha = 1;
                     }];
    
}

-(void)hideKeyboard:(id) sender{
    [self.view endEditing:YES];
}

#pragma mark - Utils
-(void)delete:(id)sender{
    self.deletePlayer = YES;
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    // Podríamos comprobar el texto
    [textField resignFirstResponder];
    return YES;
}


-(void) textFieldDidEndEditing:(UITextField *)textField{
    // guardamos
    // Primero tendremos que comprobar cual es el campo que tiene el foco para mover ese dato al modelo
    NSLog( @"finaliza la introducción de datos para el campo: %@", textField );
//    self.model.name = self.playerNameView.text;
}

#pragma mark - PickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   
    return [self.arrayDorsal count];
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.arrayDorsal objectAtIndex:row];
}

#pragma mark - PickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.dorsalView.text = [self.arrayDorsal objectAtIndex:row];
}

#pragma mark - Actions
-(void)displayDetailPhoto:(id) sender{
    
    // Mostramos el controlador de Fotos
    if ( self.model.photo == nil ){
            self.model.photo = [[VOSPhotoContainer alloc] photoWithImage:nil
                                                                  context:self.model.managedObjectContext];
        
    }
    VOSPhotoViewController *pVC = [[VOSPhotoViewController alloc] initWithModel:self.model];
    
    [self.navigationController pushViewController:pVC
                                             animated:YES];
}

-(void) displayActions:(id) sender{
    
    UIActivityViewController *aVC = [[UIActivityViewController alloc] initWithActivityItems:[self arrayOfNoteItems] applicationActivities:nil];
    
    [self presentViewController:aVC
                       animated:YES
                     completion:nil];
}

-(NSArray *) arrayOfNoteItems{
    
    NSMutableArray *items = [NSMutableArray array];
    if (self.model.name) {
        [items addObject:self.model.name];
    }
    if (self.model.dorsal) {
        [items addObject:self.model.dorsal];
    }
    if (self.model.photo.image) {
        [items addObject:self.model.photo.image];
    }
    
    return items;
    
}

@end
