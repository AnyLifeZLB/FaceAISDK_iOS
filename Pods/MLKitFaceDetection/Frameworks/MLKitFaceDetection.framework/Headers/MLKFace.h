#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

#import "MLKFaceContour.h"
#import "MLKFaceLandmark.h"

NS_ASSUME_NONNULL_BEGIN

/** A human face detected in an image. */
NS_SWIFT_NAME(Face)
@interface MLKFace : NSObject

/** The rectangle containing the detected face relative to the image in the view coordinate system.
 */
@property(nonatomic, readonly) CGRect frame;

/** An array of all the landmarks in the detected face. */
@property(nonatomic, readonly) NSArray<MLKFaceLandmark *> *landmarks;

/** An array of all the contours in the detected face. */
@property(nonatomic, readonly) NSArray<MLKFaceContour *> *contours;

/** Indicates whether the face has a tracking ID. */
@property(nonatomic, readonly) BOOL hasTrackingID;

/** The tracking identifier of the face. */
@property(nonatomic, readonly) NSInteger trackingID;

/** Indicates whether the detector found the head x euler angle. */
@property(nonatomic, readonly) BOOL hasHeadEulerAngleX;

/**
 * Indicates the rotation of the face about the horizontal axis of the image. Positive x euler angle
 * is when the face is turned upward in the image that is being processed.
 */
@property(nonatomic, readonly) CGFloat headEulerAngleX;

/** Indicates whether the detector found the head y euler angle. */
@property(nonatomic, readonly) BOOL hasHeadEulerAngleY;

/**
 * Indicates the rotation of the face about the vertical axis of the image. Positive y euler angle
 * is when the face is turned towards the right side of the image that is being processed.
 */
@property(nonatomic, readonly) CGFloat headEulerAngleY;

/** Indicates whether the detector found the head z euler angle. */
@property(nonatomic, readonly) BOOL hasHeadEulerAngleZ;

/**
 * Indicates the rotation of the face about the axis pointing out of the image. Positive z euler
 * angle is a counter-clockwise rotation within the image plane.
 */
@property(nonatomic, readonly) CGFloat headEulerAngleZ;

/** Indicates whether a smiling probability is available. */
@property(nonatomic, readonly) BOOL hasSmilingProbability;

/** Probability that the face is smiling. */
@property(nonatomic, readonly) CGFloat smilingProbability;

/** Indicates whether a left eye open probability is available. */
@property(nonatomic, readonly) BOOL hasLeftEyeOpenProbability;

/** Probability that the face's left eye is open. */
@property(nonatomic, readonly) CGFloat leftEyeOpenProbability;

/** Indicates whether a right eye open probability is available. */
@property(nonatomic, readonly) BOOL hasRightEyeOpenProbability;

/** Probability that the face's right eye is open. */
@property(nonatomic, readonly) CGFloat rightEyeOpenProbability;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

/**
 * Returns the landmark, if any, of the given type in this detected face.
 *
 * @param type The type of the facial landmark.
 * @return The landmark of the given type in this face. `nil` if there isn't one.
 */
- (nullable MLKFaceLandmark *)landmarkOfType:(MLKFaceLandmarkType)type;

/**
 * Returns the contour, if any, of the given type in this detected face.
 *
 * @param type The type of the facial contour.
 * @return The contour of the given type in this face. `nil` if there isn't one.
 */
- (nullable MLKFaceContour *)contourOfType:(MLKFaceContourType)type;

@end

NS_ASSUME_NONNULL_END
