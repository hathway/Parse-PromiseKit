//
//  PMKPFMacros.h
//
//  Created by DJ Tarazona on 9/16/14.
//  Copyright (c) 2014 Hathway Inc.
//

#ifndef PMKPFBooleanResultBlock
#define PMKPFBooleanResultBlock \
^(BOOL succeeded, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(@(succeeded)); \
    } \
}
#endif

#ifndef PMKPFBooleanResultBlockSelf
#define PMKPFBooleanResultBlockSelf \
^(BOOL succeeded, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(self); \
    } \
}
#endif

#ifndef PMKPFBooleanResultBlockArray
#define PMKPFBooleanResultBlockArray \
^(BOOL succeeded, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(objects); \
    } \
}
#endif

#ifndef PMKPFIntegerResultBlock
#define PMKPFIntegerResultBlock \
^(int number, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(@(number)); \
    } \
}
#endif

#ifndef PMKPFArrayResultBlock
#define PMKPFArrayResultBlock \
^(NSArray *objects, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(objects); \
    } \
}
#endif

#ifndef PMKPFObjectResultBlock
#define PMKPFObjectResultBlock \
^(PFObject *object, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(object); \
    } \
}
#endif

#ifndef PMKPFSetResultBlock
#define PMKPFSetResultBlock \
^(NSSet *channels, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(channels); \
    } \
}
#endif

#ifndef PMKPFUserResultBlock
#define PMKPFUserResultBlock \
^(PFUser *user, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(user); \
    } \
}
#endif

#ifndef PMKPFDataResultBlock
#define PMKPFDataResultBlock \
^(NSData *data, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(data); \
    } \
}
#endif

#ifndef PMKPFDataStreamResultBlock
#define PMKPFDataStreamResultBlock \
^(NSInputStream *stream, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(stream); \
    } \
}
#endif

#ifndef PMKPFStringResultBlock
#define PMKPFStringResultBlock \
^(NSString *string, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(string); \
    } \
}
#endif

#ifndef PMKPFIdResultBlock
#define PMKPFIdResultBlock \
^(id object, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(object); \
    } \
}
#endif