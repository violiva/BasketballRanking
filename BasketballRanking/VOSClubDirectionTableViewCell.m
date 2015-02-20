//
//  VOSClubDirectionTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSClubDirectionTableViewCell.h"
#import "VOSClub.h"

@implementation VOSClubDirectionTableViewCell

#pragma mark - Properties
// creamos un setter personalizado
-(void) setClub:(VOSClub *)club{
    // guardamos la dirección
    _club = club;
    
    // sincronizamos la vista con la nota
    self.addressField.text = club.address;
}

#pragma mark - Class methods
+(CGFloat) height{
    return 85.0f;
}

+(NSString *) cellId{
    return [self description];
}


#pragma mark - UITextViewDelegate
-(void)textViewDidEndEditing:(UITextView *)textView{
    // Si está bien quitamos el foco para que desaparezca el teclado ( o podemos mandarlo al siguiente campo si nos interesase.
    // Si queremos controlar en que campo estamos en el caso de que haya más de un campo TextField, podríamos hacerlo preguntando
    // por
    
    if ( ![textView.text isEqual: self.club.address  ] ) {
         self.club.address = textView.text;
    }
    [textView resignFirstResponder];
    NSLog(@"Dirección en el objeto: %@", _club.address);
    NSLog(@"Dirección en el campo de texto: %@", textView.text);
}


#pragma mark - Misc
-(void) prepareForReuse{
    [super prepareForReuse];
    // es muy importante para celdas personalizadas.
    // te manda la tabla cuando te saca del caché y te va a reutilizar
    // es buen momento para resetear la lista antes de que te metan datos nuevos
    // y darse de baja de las notificaciones de KVO
    
    // cuando desaparezco mem mandan este mensaje para que me resetee y me prepare para ser reutilizado
    //  Esto es algo así como el viewWillDissappear para celdas
    
    // Sincroniza la vista con la nota por si hubo cambios
    self.club.address = self.addressField.text;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
