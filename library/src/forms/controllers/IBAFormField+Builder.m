//
// Created by Frank Blumenberg on 12.04.14.
// Copyright (c) 2014 Itty Bitty Apps Pty Ltd. All rights reserved.
//

#import "IBAFormField+Builder.h"


@implementation IBAFormField (Builder)

+ (instancetype) fieldWithBlock:(IBAFormFieldBuilderBlock)block {
    NSParameterAssert(block);
    
    IBAFormFieldBuilder *builder = [[IBAFormFieldBuilder alloc] init];
    builder.fieldClass = self.class;
    block(builder);
    return [builder build];
}

@end




@implementation IBAFormFieldBuilder

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fieldClass = IBAFormField.class;
        
        self.maximumValue=100;
        self.stepValue=1;
        self.autorepeat=YES;
        self.continuous=YES;
    }
    return self;
}

-(id) build {
    
    IBAFormField* field=[[self.fieldClass alloc] initWithKeyPath:self.keyPath title:self.title valueTransformer:self.valueTransformer];
    
    field.hidden=self.hidden;
    
    if(field.class == IBABooleanFormField.class){
        ((IBABooleanFormField*)field).booleanFormFieldType=self.booleanFormFieldType;
    }

    if(field.class == IBAStepperFormField .class){

        ((IBAStepperFormField*)field).displayValueTransformer=self.displayValueTransformer;
        ((IBAStepperFormField*)field).minimumValue=self.minimumValue;
        ((IBAStepperFormField*)field).maximumValue=self.maximumValue;
        ((IBAStepperFormField*)field).stepValue=self.stepValue;
        ((IBAStepperFormField*)field).autorepeat=self.autorepeat;
        ((IBAStepperFormField*)field).wraps=self.wraps;
        ((IBAStepperFormField*)field).continuous=self.continuous;
    }

    field.formFieldStyle = self.formFieldStyle;

    return field;
}

@end