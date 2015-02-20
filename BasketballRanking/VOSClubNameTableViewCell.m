//
//  VOSClubNameTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSClubNameTableViewCell.h"
#import "VOSClub.h"

@implementation VOSClubNameTableViewCell

#pragma mark - Properties
// creamos un setter personalizado
-(void) setClub:(VOSClub *)club{
    // guardamos la nota
    _club = club;
    
    // sincronizamos la vista con la nota
    self.nameField.text = club.name;
}

#pragma mark - Class methods
+(CGFloat) height{
    return 50.0f;
}

+(NSString *) cellId{
    return [self description];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    // validamos el texto si tenemos que hacer alguna validación.
    if ( [textField.text isEqualToString:@""] ){
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle: @"Warning !!!"
                                                          message: @"Este campo no se puede dejar vacío"
                                                         delegate: nil
                                                cancelButtonTitle: @"I Know"
                                                otherButtonTitles: nil];
        [message show];
        
        [textField becomeFirstResponder];
        
        return NO;
    }
    
    // Si está bien quitamos el foco para que desaparezca el teclado ( o podemos mandarlo al siguiente campo si nos interesase.
    // Si queremos controlar en que campo estamos en el caso de que haya más de un campo TextField, podríamos hacerlo preguntando
    
    
    [textField resignFirstResponder];
    
    return YES;
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
    // Si está bien quitamos el foco para que desaparezca el teclado ( o podemos mandarlo al siguiente campo si nos interesase.
    // Si queremos controlar en que campo estamos en el caso de que haya más de un campo TextField, podríamos hacerlo preguntando
    // por
    
    if ( [textField.text isEqualToString:@""] ){
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle: @"Warning !!!"
                                                          message: @"Este campo no se puede dejar vacío"
                                                         delegate: nil
                                                cancelButtonTitle: @"I Know"
                                                otherButtonTitles: nil];
        [message show];
        [textField becomeFirstResponder];
        
    }else{
        if ( ![textField.text isEqual: self.club.name  ] ) {
            self.club.name = textField.text;
        }
        [textField resignFirstResponder];
        
    }
}


#pragma mark - Misc
-(void) prepareForReuse{
    [super prepareForReuse];
    // es muy importante para celdas personalizadas.
    // te manda la tabla cuando te saca del caché y te va a reutilizar
    // es buen momento para resetear la lista antes de que te metan datos nuevos
    // y darse de baja de las notificaciones de KVO
    
    // cuando desaparezco me mandan este mensaje para que me resetee y me prepare para ser reutilizado
    //  Esto es algo así como el viewWillDissappear para celdas
    
    // Sincroniza la vista con la nota por si hubo cambios
    self.club.name = self.nameField.text;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end;
