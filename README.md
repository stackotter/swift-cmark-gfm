# CMarkGFM

This package just provides an easy way to import the cmark-gfm library into Swift. It does not wrap the C API with a nice Swift API. For that, see [Parsley](https://github.com/loopwerk/Parsley).

## Usage

Just include this package as a dependency in your `Package.swift`. Here's an example of how to do that:

```swift
let package = Package(
    name: "Example",
    dependencies: [
        .package(url: "https://github.com/stackotter/swift-cmark-gfm", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Example",
            dependencies: [
                .product(name: "CMarkGFM", package: "swift-cmark-gfm")
            ]
        ),
    ]
)
```

## Automatic updater script

The main goal of this package is to be extremely easy to maintain. That's why I made the `update_cmark_gfm.sh` script. Running the script will automatically update this package to the latest version of `cmark-gfm`.

```sh
# Update the package to the latest version of cmark-gfm
./update_cmark_gfm.sh
```

Alternatively, it can be used to update the package to a specific commit of `cmark-gfm`. Just provide a commit hash when running the script:

```sh
# Update the package to a specific version of cmark-gfm
./update_cmark_gfm.sh [commit]
```

This means that if you have a project that requires a specific version of `cmark-gfm` for some reason. You can easily fork this repository and automatically tailor the package to your needs.
