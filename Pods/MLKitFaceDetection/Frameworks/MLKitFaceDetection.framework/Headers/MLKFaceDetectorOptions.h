#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum FaceDetectorClassificationMode
 * Classification mode for face detection.
 */
typedef NSInteger MLKFaceDetectorClassificationMode NS_TYPED_ENUM
    NS_SWIFT_NAME(FaceDetectorClassificationMode);
/** Face classification mode indicating that the detector performs no classification. */
static const MLKFaceDetectorClassificationMode MLKFaceDetectorClassificationModeNone = 1;
/** Face classification mode indicating that the detector performs all classifications. */
static const MLKFaceDetectorClassificationMode MLKFaceDetectorClassificationModeAll = 2;

/**
 * @enum FaceDetectorPerformanceMode
 * Performance preference for accuracy or speed of face detection.
 */
typedef NSInteger MLKFaceDetectorPerformanceMode NS_TYPED_ENUM
    NS_SWIFT_NAME(FaceDetectorPerformanceMode);
/**
 * Face detection performance mode that runs faster, but may detect fewer faces and/or return
 * results with lower accuracy.
 */
static const MLKFaceDetectorPerformanceMode MLKFaceDetectorPerformanceModeFast = 1;
/**
 * Face detection performance mode that runs slower, but may detect more faces and/or return
 * results with higher accuracy.
 */
static const MLKFaceDetectorPerformanceMode MLKFaceDetectorPerformanceModeAccurate = 2;

/**
 * @enum FaceDetectorLandmarkMode
 * Landmark detection mode for face detection.
 */
typedef NSInteger MLKFaceDetectorLandmarkMode NS_TYPED_ENUM NS_SWIFT_NAME(FaceDetectorLandmarkMode);
/** Face landmark mode indicating that the detector performs no landmark detection. */
static const MLKFaceDetectorLandmarkMode MLKFaceDetectorLandmarkModeNone = 1;
/** Face landmark mode indicating that the detector performs landmark detection. */
static const MLKFaceDetectorLandmarkMode MLKFaceDetectorLandmarkModeAll = 2;

/**
 * @enum FaceDetectorContourMode
 * Contour detection mode for face detection.
 */
typedef NSInteger MLKFaceDetectorContourMode NS_TYPED_ENUM NS_SWIFT_NAME(FaceDetectorContourMode);
/** Face contour mode indicating that the detector performs no contour detection. */
static const MLKFaceDetectorContourMode MLKFaceDetectorContourModeNone = 1;
/** Face contour mode indicating that the detector performs contour detection. */
static const MLKFaceDetectorContourMode MLKFaceDetectorContourModeAll = 2;

/** Options for specifying a face detector. */
NS_SWIFT_NAME(FaceDetectorOptions)
@interface MLKFaceDetectorOptions : NSObject

/**
 * The face detector classification mode for characterizing attributes such as smiling. The default
 * is `.none`.
 */
@property(nonatomic) MLKFaceDetectorClassificationMode classificationMode;

/**
 * The face detector performance mode that determines the accuracy of the results and the speed of
 * the detection. The default is `.fast`.
 */
@property(nonatomic) MLKFaceDetectorPerformanceMode performanceMode;

/**
 * The face detector landmark mode that determines the type of landmark results returned by
 * detection. The default is `.none`.
 */
@property(nonatomic) MLKFaceDetectorLandmarkMode landmarkMode;

/**
 * The face detector contour mode that determines the type of contour results returned by detection.
 * The default is `.none`.
 *
 * <p>The following detection results are returned when setting this mode to `.all`:
 *
 * <p>`performanceMode` set to `.fast`, and both `classificationMode` and `landmarkMode` set to
 * `.none`, then only the prominent face will be returned with detected contours.
 *
 * <p>`performanceMode` set to `.accurate`, or if `classificationMode` or `landmarkMode` is set to
 * `.all`, then all detected faces will be returned, but only the prominent face will have
 * detecteted contours.
 */
@property(nonatomic) MLKFaceDetectorContourMode contourMode;

/**
 * The smallest desired face size. The size is expressed as a proportion of the width of the head to
 * the image width. For example, if a value of 0.1 is specified, then the smallest face to search
 * for is roughly 10% of the width of the image being searched. The default is 0.1. This option does
 * not apply to contour detection.
 */
@property(nonatomic) CGFloat minFaceSize;

/**
 * Whether the face tracking feature is enabled for face detection. The default is NO. When
 * `performanceMode` is set to `.fast`, and both `classificationMode` and `landmarkMode` set to
 * `.none`, this option will be ignored and tracking will be disabled.
 */
@property(nonatomic, getter=isTrackingEnabled) BOOL trackingEnabled;

@end

NS_ASSUME_NONNULL_END
