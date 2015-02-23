//
//  VOSYearOfGroupTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 23/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSYearOfGroupTableViewCell.h"
#import "VOSGroup.h"
#import "VOSYearSelectionViewController.h"

@interface VOSYearOfGroupTableViewCell ()

@end

@implementation VOSYearOfGroupTableViewCell

#pragma mark - Properties
// creamos un setter personalizado
-(void) setGroup:(VOSGroup *)group{
    // guardamos el grupo
    _group = group;
    
    // sincronizamos la vista con el año del Grupo
    self.yearView.text = [NSString stringWithFormat:@"%@",group.year];

    [self setEditing:YES];
    NSLog(@"pasa por aquí inicializacion setGroup Año del Grupo");
}


#pragma mark - Class methods
+(CGFloat) height{
    return 44.0f;
}

+(NSString *) cellId{
    return [self description];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}


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
            NSNumberFormatter * myNumFormatter = [[NSNumberFormatter alloc] init];
            [myNumFormatter setLocale:[NSLocale currentLocale]]; // happen by default?
            [myNumFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
            // next line is very important!
            [myNumFormatter setNumberStyle:NSNumberFormatterDecimalStyle]; // crucial
            
            NSNumber *tempNum = [myNumFormatter numberFromString:self.yearView.text];
            self.group.year = tempNum;
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
    
    // Sincroniza la vista con el grupo por si hubo cambios
    
    
    NSNumberFormatter * myNumFormatter = [[NSNumberFormatter alloc] init];
    [myNumFormatter setLocale:[NSLocale currentLocale]]; // happen by default?
    [myNumFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    // next line is very important!
    [myNumFormatter setNumberStyle:NSNumberFormatterDecimalStyle]; // crucial
    
    NSNumber *tempNum = [myNumFormatter numberFromString:self.yearView.text];
    self.group.year = tempNum;
}


@end
