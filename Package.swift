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
        .package(url: "https://github.com/devicekit/DeviceKit.git", exact: "5.7.0"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", exact: "4.2.2"),
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.0/TruvideoSdk.xcframework.zip",
            checksum: "c03f9bc0c002e42fd9d2cc91604c376ac2f3b7d364498223d25599c6ecc246d4"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.0/TruvideoSdkCamera.xcframework.zip",
            checksum: "37d5644aec58da4afd53096d76b4af3346125681463cd1f086e2318f51c2e587"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.0/TruvideoSdkMedia.xcframework.zip",
            checksum: "20631dedf1dc12d18d078402870e75634c0bc099843f4df2d85fc038dfbd2406"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.0/TruVideoApi.xcframework.zip",
            checksum: "ee856727dfd99b49b9e8a8de7af4ece1f3cf4ae92d791d8d47afd1466e62d159"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.0/TruVideoFoundation.xcframework.zip",
            checksum: "9adf855a6cdb8d4b7b32b8a07d81ae59757e8e9e36b7da9002a387cfa65760eb"
        ),
        .target(
            name: "TruVideoFoundationTarget",
            dependencies: [
                "TruVideoFoundation",
                .product(name: "DeviceKit", package: "DeviceKit"),
            ],
            path: "TruVideoFoundation"
        ),
    ]
    
    static var truVideoMediaUploadTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoMediaUpload",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.0/TruVideoMediaUpload.xcframework.zip",
            checksum: "a0ad5d9332bb871961c45e34b3544724ca844ff0c308d8b30ddbf59a28d359fc"
        ),
        .target(
            name: "TruVideoMediaUploadTarget",
            dependencies: [
                "TruVideoMediaUpload",
                "TruvideoSdkTarget",
                .product(name: "DeviceKit", package: "DeviceKit"),
                .product(name: "KeychainAccess", package: "KeychainAccess"),
            ],
            path: "TruVideoMediaUpload"
        ),
    ]
    
    static var truVideoRuntimeTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoRuntime",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.0/TruVideoRuntime.xcframework.zip",
            checksum: "35854f7d8cc4809102d2f46a367fb333328caba851831736de9c7dc87d702fbd"
        )
    ]
}
