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
            diTargets,
            networkingTargets,
            storageKitTargets,
            truVideoRuntimeTargets,
            truVideoFoundationTargets,
            truVideoApiTargets,
            truvideoSdkTargets,
            truVideoMediaUploadTargets,
            truvideoSdkCameraTargets,
            truvideoSdkMediaTargets,
        ]
            .flatMap(\.self)
    }
    
    static var truvideoSdkTargets: [Target] = [
        .binaryTarget(
            name: "TruvideoSdk",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/TruvideoSdk.xcframework.zip",
            checksum: "beb480d2284ac35b2df955b4fd701b11c80b19263ed5320533e23d26df24eccf"
        ),
        .target(
            name: "TruvideoSdkTarget",
            dependencies: [
                "DI",
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/TruvideoSdkCamera.xcframework.zip",
            checksum: "9556a6a874775e7c801a5d6e36cfcb37ed3bd80dce31e59dc80c722f6997f077"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/TruvideoSdkMedia.xcframework.zip",
            checksum: "5a82d09418b17e81140bda1e2f4c8a28df3fbb33c29f262b8cdd22b44bb75cc4"
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
    
    static var diTargets: [Target] = [
        .binaryTarget(
            name: "DI",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/DI.xcframework.zip",
            checksum: "1dd954d46898a6c88e4dbf8ae5162aca31c7be91a0391c2dfccedc4a17ae7260"
        )
    ]
    
    static var networkingTargets: [Target] = [
        .binaryTarget(
            name: "Networking",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/Networking.xcframework.zip",
            checksum: "7f053b9a37d6641db453183d0af7b16ee87e7d7648baced3e92847f2828ee2a4"
        ),
        .target(
            name: "NetworkingTarget",
            dependencies: [
                "DI",
                "Networking"
            ],
            path: "Networking"
        ),
    ]
    
    static var storageKitTargets: [Target] = [
        .binaryTarget(
            name: "StorageKit",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/StorageKit.xcframework.zip",
            checksum: "9ca143c5626f170d56ea41b3d911e260d76d0329bf5acb4fdd064e1093277c35"
        )
    ]
    
    static var truVideoApiTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoApi",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/TruVideoApi.xcframework.zip",
            checksum: "9510bc14efd0746d174c32f206e6fb1f9966c35ea2a514502ef5079c38cd0358"
        ),
        .target(
            name: "TruVideoApiTarget",
            dependencies: [
                "DI",
                "NetworkingTarget",
                "StorageKit",
                "TruVideoApi",
                "TruVideoFoundationTarget",
            ],
            path: "TruVideoApi"
        ),
    ]
    
    static var truVideoFoundationTargets: [Target] = [
        .binaryTarget(
            name: "TruVideoFoundation",
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/TruVideoFoundation.xcframework.zip",
            checksum: "b76897cdf5f5136d6b2f0d58273fcdd7ea60e4a6e1799b6666d7e88c5b213044"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/TruVideoMediaUpload.xcframework.zip",
            checksum: "0e9f5e361ccbae7344c59f1f5158ecd1c4d01b0b4c4d722ad0730ce0e6c7cf63"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.10/TruVideoRuntime.xcframework.zip",
            checksum: "287e74f2ad7320b1dd2507604a7e2624afb55e850a4b40fd8c6daa108db1ce92"
        )
    ]
}
