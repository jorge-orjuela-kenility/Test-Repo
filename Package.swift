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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.9/TruvideoSdk.xcframework.zip",
            checksum: "b920bbc15ee4deeb9b2f316e58b95379ed03a6cf30e88d4171af3b5097c48469"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.9/TruvideoSdkCamera.xcframework.zip",
            checksum: "a6dd79be4594e8a765a6733d3c53fa72e370ae4cfc5ede6010d83c3e52b0bdce"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.9/TruvideoSdkMedia.xcframework.zip",
            checksum: "1a6115881e70d46aa6005bda762be233341ed532605489d46a9b9630c30141b3"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.9/TruVideoApi.xcframework.zip",
            checksum: "a5ae421a36c515fd39f2e42a1e612dfd1bc5fe48aa6bca379c3d13afc0e44d45"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.9/TruVideoFoundation.xcframework.zip",
            checksum: "963ac9fbfa4bb59e6f440923a7a43788c7c8ea5df558bf690227c3208b2f00d5"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.9/TruVideoMediaUpload.xcframework.zip",
            checksum: "2a1fb27d6ba04015fec57fcfd8ab81d2201f9923ddff0c029b817225ea2f1edb"
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
            url: "https://github.com/jorge-orjuela-kenility/Test-Repo/releases/download/1.0.9/TruVideoRuntime.xcframework.zip",
            checksum: "6fffa308cad76594f7e44fcb9a4757ad9411fb4f173c5c5f3befe45f65e32913"
        )
    ]
}
