//
// Created by Frank Blumenberg on 12.04.14.
// Copyright (c) 2014 Itty Bitty Apps Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBAFormField.h"

#import "IBABooleanFormField.h"
#import "IBAButtonFormField.h"
#import "IBADateFormField.h"
#import "IBAStepperFormField.h"

@interface IBAFormFieldBuilder : NSObject

@property(nonatomic,strong) Class fieldClass;

@property(nonatomic, copy) NSString *keyPath;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) IBAFormFieldStyle *formFieldStyle;
@property(nonatomic, assign, getter=isNullable) BOOL nullable;
@property(nonatomic, strong) NSValueTransformer *valueTransformer;
@property(nonatomic) BOOL hidden;



//@interface IBAFormFieldStepperBuilder : IBAFormFieldBuilder

@property(nonatomic, strong) NSValueTransformer *displayValueTransformer;

@property(nonatomic) double value;                        // default is 0. sends UIControlEventValueChanged. clamped to min/max
@property(nonatomic) double minimumValue;                 // default 0. must be less than maximumValue
@property(nonatomic) double maximumValue;                 // default 100. must be greater than minimumValue
@property(nonatomic) double stepValue;                    // default 1. must be greater than 0
@property(nonatomic) BOOL autorepeat;                     // if YES, press & hold repeatedly alters value. default = YES
@property(nonatomic) BOOL wraps;                          // if YES, value wraps from min <-> max. default = NO
@property(nonatomic, getter=isContinuous) BOOL continuous; // if YES, value change events are sent any time the value changes during interaction. default = YES


//@interface IBABooleanFormFieldBuilder : IBAFormFieldBuilder

@property(nonatomic, assign) IBABooleanFormFieldType booleanFormFieldType;

//@interface IBAButtonFormFieldBuilder : IBAFormFieldBuilder

@property(nonatomic, strong) UIImage *iconImage;
@property(nonatomic, strong) IBAButtonFormFieldBlock executionBlock;
@property(nonatomic, strong) UIViewController *detailViewController;


//@interface IBADateFormFieldBuilder : IBAFormFieldBuilder

@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, assign) IBADateFormFieldType dateFormFieldType;
@property(nonatomic, strong) NSDate *defaultValue;


-(id) build;

@end

typedef void (^IBAFormFieldBuilderBlock)(IBAFormFieldBuilder*);


@interface IBAFormField (Builder)

+ (instancetype) fieldWithBlock:(IBAFormFieldBuilderBlock)block;

@end