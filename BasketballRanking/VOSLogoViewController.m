//
//  VOSLogoViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//
@import CoreImage;

#import "VOSLogoViewController.h"
#import "VOSClub.h"
#import "VOSLogo.h"

#import "UIImage+Resize.h"

@interface VOSLogoViewController ()

@property (strong,nonatomic) VOSClub * model;

@end

@implementation VOSLogoViewController

#pragma mark - Init
-(id)initWithModel:(VOSClub *) model{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _model = model;
    }
    return self;
}

#pragma mark - View Lifecycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Desactivamos la opción por defecto de ocupar toda la pantalla ( iOS 7 )
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Añadimos un borde
    self.logoView.layer.borderWidth = 3;
    self.logoView.layer.cornerRadius = 18;
    self.logoView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.logoView.clipsToBounds = YES;
    
    // sincronizamos modelo y vista
    self.logoView.image = self.model.logo.image;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // sincronizamos vista -> modelo
    self.model.logo.image = self.logoView.image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)takePhoto:(id)sender {
    // Utilizaremos un Picker. UIImagePickerController
    
    // creamos un Picker
    UIImagePickerController * picker = [UIImagePickerController new];
    
    // configurar
    // como averiguar si hay cámara
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        // tenemos cámara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }else{
        // nos conformamos con el carrete
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    // Asignamos delegado
    picker.delegate = self;
    
    // ponemos transiciones para mostrar el carrete.
    //    picker.modalTransitionStyle = UIModalTransitionStylePartialCurl;  // no funciona bien ya que no se produce un viewWillAppear y
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    
    // presentar
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                         NSLog(@"Finish");
                     }];
}

- (IBAction)deletePhoto:(id)sender {
    
    CGRect oldRect = self.logoView.bounds;
    
    // Animación
    [UIView animateWithDuration:0.8
                          delay:0
                        options:0
                     animations:^{
                         // estado final ( se va a animar )
                         self.logoView.bounds = CGRectZero;
                         self.logoView.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         // Quitar la foto del modelo
                         self.model.logo.image = nil;
                         
                         // Quitarla de la vista
                         self.logoView.image = nil;
                         
                         // dejamos la vista como estaba para cuando vuelvan a seleccionar nueva imagen
                         self.logoView.bounds = oldRect;
                         self.logoView.alpha = 1.0;
                     }];
    
    [UIView animateWithDuration: 0.8
                          delay: 0
         usingSpringWithDamping: 0.2 // factor resistencia del muelle. Si es 1 el muelle rebota pocas veces al ser muy duro
          initialSpringVelocity: 0.2
                        options: 0
                     animations:^{
                         // transformada afin
                         self.logoView.transform = CGAffineTransformMakeRotation(M_PI_2);
                     }
                     completion:^(BOOL finished) {
                         //
                         self.logoView.transform = CGAffineTransformIdentity;
                     }];
}

#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    // OJO !!! Pico de memoria
//    UIImage * img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // reducimos la imagen para que tenga la mitad del tamaño original.
    // Lo correcto sería que coincida con el tamaño de la pantalla, pero habría que calcular
    // la escala correcta. Deberes.
//    CGSize newSize = CGSizeMake(img.size.width * 0.5, img.size.height * 0.5);
    
    // Este métodp con imágenes grandes y máxima calidad
    // va a tardar un poco. Lo ideal sería pasarlo a segundo plano. Más deberes.
//    img = [img resizedImage:newSize interpolationQuality:kCGInterpolationHigh];
    
//     self.model.logo.image = img;
    
    self.model.logo.image = [info objectForKey:UIImagePickerControllerOriginalImage];   // --> Sustituido por el nuevo método de Trevor
    
    
    // Ocultar el picker
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    

    // mostramos la imagen seleccionada
    self.logoView.image = self.model.logo.image;
}

@end
