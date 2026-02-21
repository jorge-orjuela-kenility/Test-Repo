// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "TruvideoSdk",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "TruvideoSdk",
            targets: ["TruvideoSdk", "TruvideoSdkTarget"]
        ),
        .library(
            name: "TruvideoSdkCamera",
            targets: ["TruvideoSdkCamera", "TruvideoSdkCameraTarget"]
        ),
        .library(
            name: "TruvideoSdkMedia",
            targets: ["TruvideoSdkMedia", "TruvideoSdkMediaTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/aws-amplify/aws-sdk-ios-spm", exact: "2.33.4"),
        .package(url: "https://github.com/Truvideo/truvideo-sdk-ios-common", exact: "0.0.78"),
        .package(url: "https://github.com/Truvideo/truvideo-sdk-ios-video-utils", exact: "0.0.3")
    ],
    targets: Target.allTargets
)

extension Target {
    
    static var allTargets: [Target] {
        [
            truvideoSdkTargets,
            truvideoSdkCameraTargets,
            truvideoSdkMediaTargets,
            truVideoApiTargets,
            truVideoFoundationTargets,
            truVideoMediaUploadTargets,
            truVideoRuntimeTargets
        ]
            .flatMap(\.self)
    }
    
    static var truvideoSdkTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.6/TruvideoSdk.xcframework.zip",
            checksum: "c11fa0391c6158e617ad5a0718fd5ded2800a516b0c5e7dfb9aeaa0a88212696"
        ),
        .target(
            name: "TruvideoSdkTarget",
            dependencies: [
                "TruvideoSdk",
                "TruVideoApiTarget",
                "TruVideoRuntime",
                .product(name: "Common", package: "truvideo-sdk-ios-common"),
                .product(name: "AWSS3", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCore", package: "aws-sdk-ios-spm")
            ],
            path: "TruvideoSdk"
        ),
    ]
    
    static var truvideoSdkCameraTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkCamera",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.6/TruvideoSdkCamera.xcframework.zip",
            checksum: "9bc37bebb8c1c4a95d019466be45089c55cbdb8f0564615f25ae5f7c1780ac7f"
        ),
        .target(
            name: "TruvideoSdkCameraTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaUploadTarget",
                .product(name: "TruvideoSdkVideoUtils", package: "truvideo-sdk-ios-video-utils")
            ],
            path: "TruvideoSdkCamera"
        ),
    ]
    
    static var truvideoSdkMediaTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdkMedia",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.6/TruvideoSdkMedia.xcframework.zip",
            checksum: "9175b06d7436385550ef621db7d402a224c50ffbf6009061f94b89f13b38913d"
        ),
        .target(
            name: "TruvideoSdkMediaTarget",
            dependencies: [
                "TruvideoSdkTarget",
                "TruVideoMediaUploadTarget"
            ],
            path: "TruvideoSdkMedia"
        ),
    ]
    
    static var truVideoApiTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoApi",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.6/TruVideoApi.xcframework.zip",
            checksum: "3916b0d1eb564b6661d90df30e59b371b8affaaf8aae1f27d48c865badd9e899"
        ),
        .target(
            name: "TruVideoApiTarget",
            dependencies: [
                "TruVideoApi",
                "TruVideoFoundationTarget",
            ],
            path: "TruVideoApi"
        ),
    ]
    
    static var truVideoFoundationTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoFoundation",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.6/TruVideoFoundation.xcframework.zip",
            checksum: "fd4e9561db3f632ad5c549d391b874608d9a3cc2fb53e08452eb334cc151359a"
        ),
        .target(
            name: "TruVideoFoundationTarget",
            dependencies: [
                "TruVideoFoundation",
            ],
            path: "TruVideoFoundation"
        ),
    ]
    
    static var truVideoMediaUploadTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaUpload",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.6/TruVideoMediaUpload.xcframework.zip",
            checksum: "2076bd7af3f4a5face7a38f365d06b2261e82e8dc920bd41aed4a7d32d48adb1"
        ),
        .target(
            name: "TruVideoMediaUploadTarget",
            dependencies: [
                "TruVideoMediaUpload",
                "TruvideoSdkTarget",
            ],
            path: "TruVideoMediaUpload"
        ),
    ]
    
    static var truVideoRuntimeTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoRuntime",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.6/TruVideoRuntime.xcframework.zip",
            checksum: "afb0226f2e9bc0f9c700c3f38cb6315263ab036173b6d6f0505c6d801eea2e4c"
        )
    ]
}
