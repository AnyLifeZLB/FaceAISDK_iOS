#import <Foundation/Foundation.h>

@class MLKFace;
@class MLKFaceDetectorOptions;

@protocol MLKCompatibleImage;

NS_ASSUME_NONNULL_BEGIN

/**
 * A block containing an array of faces or `nil` if there's an error.
 *
 * @param faces Array of faces detected in the image or `nil` if there was an error.
 * @param error The error or `nil`.
 */
typedef void (^MLKFaceDetectionCallback)(NSArray<MLKFace *> *_Nullable faces,
                                         NSError *_Nullable error)
    NS_SWIFT_NAME(FaceDetectionCallback);

/** A face detector that detects faces in an image. */
NS_SWIFT_NAME(FaceDetector)
@interface MLKFaceDetector : NSObject

/**
 * Returns a face detector with the given options.
 *
 * @param options Options for configuring the face detector.
 * @return A face detector configured with the given options.
 */
+ (instancetype)faceDetectorWithOptions:(MLKFaceDetectorOptions *)options
    NS_SWIFT_NAME(faceDetector(options:));

/**
 * Returns a face detector with default options.
 *
 * @return A face detector configured with default options.
 */
+ (instancetype)faceDetector NS_SWIFT_NAME(faceDetector());

/** Unavailable. Use the class methods. */
- (instancetype)init NS_UNAVAILABLE;

/**
 * Processes the given image for face detection.
 *
 * @param image The image to process.
 * @param completion Handler to call back on the main thread with faces detected or error.
 */

- (void)processImage:(id<MLKCompatibleImage>)image
          completion:(MLKFaceDetectionCallback)completion NS_SWIFT_NAME(process(_:completion:));

/**
 * Returns face results in the given image or `nil` if there was an error. The face detection is
 * performed synchronously on the calling thread.
 *
 * @discussion It is advised to call this method off the main thread to avoid blocking the UI. As a
 *     result, an `NSException` is raised if this method is called on the main thread.
 * @param image The image to get results in.
 * @param error An optional error parameter populated when there is an error getting results.
 * @return Array of face results in the given image or `nil` if there was an error.
 */

- (nullable NSArray<MLKFace *> *)resultsInImage:(id<MLKCompatibleImage>)image
                                          error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
