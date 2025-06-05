#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

@class MLKVisionPoint;

NS_ASSUME_NONNULL_BEGIN

/** The facial landmarks. */
typedef NSString *MLKFaceLandmarkType NS_TYPED_ENUM NS_SWIFT_NAME(FaceLandmarkType);

/** The center of the bottom lip. */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeMouthBottom;

/** The right corner of the mouth */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeMouthRight;

/** The left corner of the mouth */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeMouthLeft;

/** The midpoint of the left ear tip and left ear lobe. */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeLeftEar;

/** The midpoint of the right ear tip and right ear lobe. */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeRightEar;

/** The left eye. */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeLeftEye;

/** The right eye. */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeRightEye;

/** The left cheek. */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeLeftCheek;

/** The right cheek. */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeRightCheek;

/** The midpoint between the nostrils where the nose meets the face. */
extern MLKFaceLandmarkType const MLKFaceLandmarkTypeNoseBase;

/** A landmark on a human face detected in an image. */
NS_SWIFT_NAME(FaceLandmark)
@interface MLKFaceLandmark : NSObject

/** The type of the facial landmark. */
@property(nonatomic, readonly) MLKFaceLandmarkType type;

/** 2D position of the facial landmark. */
@property(nonatomic, readonly) MLKVisionPoint *position;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
