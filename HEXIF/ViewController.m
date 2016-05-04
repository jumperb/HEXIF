//
//  ViewController.m
//  HEXIF
//
//  Created by zhangchutian on 16/2/24.
//  Copyright © 2016年 zhangchutian. All rights reserved.
//

#import "ViewController.h"
#import <HCommon.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CTAssetsPickerController.h>
#import "HEXIF.h"

@interface ViewController () <CTAssetsPickerControllerDelegate>
@property (nonatomic, strong) simple_callback finish;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    @weakify(self);
    [self addMenu:@"Read exif" callback:^(id sender, id data) {
        @strongify(self);
        [self pickPhotoExifDict:^(NSDictionary *exifDict) {
            HEXIF *hexif = [HEXIF hExifWithDictionary:exifDict];
            NSLog(@"%@", [hexif outputDictionary]);
        }];
    }];
    [self addMenu:@"read exif then write a photo" callback:^(id sender, id data) {
        @strongify(self);
        [self pickPhotoExifDict:^(NSDictionary *exifDict) {
            HEXIF *hexif = [HEXIF hExifWithDictionary:exifDict];
            NSString *dateString = [self getExifTimeStringFromDate:[NSDate date]];
            hexif._Exif_.DateTimeOriginal = dateString;
            hexif._Exif_.DateTimeDigitized = dateString;
            hexif._TIFF_.DateTime = dateString;
            NSLog(@"after change time:%@", [hexif outputDictionary]);
            
            //write another photo to album with this exif
            UIImage *image = [UIImage imageNamed:@"photo.jpg"];
            ALAssetsLibrary *lib = [ALAssetsLibrary new];
            [lib writeImageDataToSavedPhotosAlbum:UIImageJPEGRepresentation(image, 0.9) metadata:[hexif outputDictionary] completionBlock:^(NSURL *assetURL, NSError *error) {
                NSLog(@"write finish %@", assetURL);
            }];
        }];
    }];
}
- (NSString *)getExifTimeStringFromDate:(NSDate *)date
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    NSString *format = @"yyyy:MM:dd HH:mm:ss";
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale systemLocale]];
    return [formatter stringFromDate:date];
}
- (void)pickPhotoExifDict:(simple_callback)finish
{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
        dispatch_async(dispatch_get_main_queue(), ^{
            CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
            picker.delegate = self;
            PHFetchOptions *fetchOptions = [PHFetchOptions new];
            fetchOptions.predicate = [NSPredicate predicateWithFormat:@"mediaType == %d", PHAssetMediaTypeImage];
            picker.assetsFetchOptions = fetchOptions;
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                picker.modalPresentationStyle = UIModalPresentationFormSheet;
            [self presentViewController:picker animated:YES completion:nil];
            self.finish = finish;
        });
    }];
}
- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    if (assets.count > 0)
    {
        PHAsset *asset = assets[0];
        PHContentEditingInputRequestOptions *options = [[PHContentEditingInputRequestOptions alloc] init];
        [asset requestContentEditingInputWithOptions:options completionHandler:^(PHContentEditingInput * _Nullable contentEditingInput, NSDictionary * _Nonnull info) {
            CIImage *fullImage = [CIImage imageWithContentsOfURL:contentEditingInput.fullSizeImageURL];
            NSDictionary *exifDict = fullImage.properties;
            if (self.finish)
            {
                self.finish(exifDict);
                self.finish = nil;
            }
        }];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
        
    
}
@end
