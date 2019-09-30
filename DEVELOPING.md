# Contributing to the Mapbox Annotations Extension

This document explains how to build the Mapbox Annotations Extension from source. It is intended for advanced developers who wish to contribute to the development of this project.

## Building the framework extension

Generate the .xcworkspace for the framework extension by running `pod install`.

## Generating documentation

This project is documented with [Jazzy](https://github.com/realm/jazzy) (v0.10.0). To generate documentation from code comments, run the following command from the root directory of this project:

```
./documentation/generate_docs.sh
```

## Testing

Tests can be found in the `MapboxAnnotationsExtensionTests` group within the `MapboxAnnotationsExtension` target.

## Sample project

A sample project for demo and debugging purposes can be found by running the `annotationapp` target.