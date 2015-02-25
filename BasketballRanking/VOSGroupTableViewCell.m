//
//  VOSGroupTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSGroupTableViewCell.h"
#import "VOSGroup.h"


@implementation VOSGroupTableViewCell

#pragma mark - Properties
// creamos un setter personalizado
-(void) setGroup:(VOSGroup *)group{
    // guardamos el grupo
    _group = group;
    
    // sincronizamos la vista con el grupo
    self.groupNameView.text = group.name;
    
    [self setEditing:YES];
    
    //    [self.categoryName setDelegate:self];
    
}

#pragma mark - Class methods
+(CGFloat)height{
    return 45.0f;
}

+(NSString *)cellId{
    return [self description];
}


/*
#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    // validamos el texto si tenemos que hacer alguna validación.
    NSLog(@"texto que tenemos que validar: %@", textField.text);
    
    // Si está bien quitamos el foco para que desaparezca el teclado ( o podemos mandarlo al siguiente campo si nos interesase.
    // Si queremos controlar en que campo estamos en el caso de que haya más de un campo TextField, podríamos hacerlo preguntando
    
    if ( textField == _groupNameView ) {
        NSLog( @"efectivamente estamos en el campo : %@", textField);
    }
    [textField resignFirstResponder];
    return YES;
}
*/


-(void)textFieldDidEndEditing:(UITextField *)textField{
    // Si está bien quitamos el foco para que desaparezca el teclado ( o podemos mandarlo al siguiente campo si nos interesase.
    // Si queremos controlar en que campo estamos en el caso de que haya más de un campo TextField, podríamos hacerlo preguntando
    // por
    
    NSLog(@"Comienza a editar el campo");

    if ( [textField.text isEqualToString:@""] ){
 
        UIAlertView *message = [[UIAlertView alloc] initWithTitle: @"Warning !!!"
                                                          message: @"Este campo no se puede dejar vacío"
                                                         delegate: nil
                                                cancelButtonTitle: @"I Know"
                                                otherButtonTitles: nil];
        [message show];
        [textField becomeFirstResponder];
 
    }else{
        if ( ![textField.text isEqual: self.group.name  ] ) {
            self.group.name = textField.text;
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
    self.group.name = self.groupNameView.text;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
