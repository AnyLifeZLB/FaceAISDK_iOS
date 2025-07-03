#import <Foundation/Foundation.h>

@class MLKVisionPoint;

NS_ASSUME_NONNULL_BEGIN

/** The facial contours. */
typedef NSString *MLKFaceContourType NS_TYPED_ENUM NS_SWIFT_NAME(FaceContourType);

/** A set of points that outline the face oval. */
extern MLKFaceContourType const MLKFaceContourTypeFace;

/** A set of points that outline the top of the left eyebrow. */
extern MLKFaceContourType const MLKFaceContourTypeLeftEyebrowTop;

/** A set of points that outline the bottom of the left eyebrow. */
extern MLKFaceContourType const MLKFaceContourTypeLeftEyebrowBottom;

/** A set of points that outline the top of the right eyebrow. */
extern MLKFaceContourType const MLKFaceContourTypeRightEyebrowTop;

/** A set of points that outline the bottom of the right eyebrow. */
extern MLKFaceContourType const MLKFaceContourTypeRightEyebrowBottom;

/** A set of points that outline the left eye. */
extern MLKFaceContourType const MLKFaceContourTypeLeftEye;

/** A set of points that outline the right eye. */
extern MLKFaceContourType const MLKFaceContourTypeRightEye;

/** A set of points that outline the top of the upper lip. */
extern MLKFaceContourType const MLKFaceContourTypeUpperLipTop;

/** A set of points that outline the bottom of the upper lip. */
extern MLKFaceContourType const MLKFaceContourTypeUpperLipBottom;

/** A set of points that outline the top of the lower lip. */
extern MLKFaceContourType const MLKFaceContourTypeLowerLipTop;

/** A set of points that outline the bottom of the lower lip. */
extern MLKFaceContourType const MLKFaceContourTypeLowerLipBottom;

/** A set of points that outline the nose bridge. */
extern MLKFaceContourType const MLKFaceContourTypeNoseBridge;

/** A set of points that outline the bottom of the nose. */
extern MLKFaceContourType const MLKFaceContourTypeNoseBottom;

/** A center point on the left cheek. */
extern MLKFaceContourType const MLKFaceContourTypeLeftCheek;

/** A center point on the right cheek. */
extern MLKFaceContourType const MLKFaceContourTypeRightCheek;

/** A contour on a human face detected in an image. */
NS_SWIFT_NAME(FaceContour)
@interface MLKFaceContour : NSObject

/** The facial contour type. */
@property(nonatomic, readonly) MLKFaceContourType type;

/** An array of 2D points that make up the facial contour. */
@property(nonatomic, readonly) NSArray<MLKVisionPoint *> *points;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
