# XrayCore.Proto

XrayCore.Proto is a NuGet package that provides automatically generated
C# gRPC client code based on the official Xray-core `.proto`
definitions.

This project does not modify or extend the protocol. It simply compiles
the original `.proto` files into .NET client classes and distributes
them as a convenient NuGet package.

## Purpose

The package is intended for developers who want to:

-   Integrate with Xray-core via gRPC from .NET applications
-   Build management panels or backend services around Xray
-   Use official protocol definitions without manually generating code

## Installation

### Using .NET CLI

``` bash
dotnet add package XrayCore.Proto
```

### Using NuGet Package Manager

``` powershell
Install-Package XrayCore.Proto
```

## Basic Usage

Make sure Xray-core is running with the gRPC API enabled.

Example:

``` csharp
using Grpc.Net.Client;
using Xray.App.Proxyman.Command;

var channel = GrpcChannel.ForAddress("http://127.0.0.1:10085");
var client = new HandlerService.HandlerServiceClient(channel);

var response = await client.GetInboundUsersAsync(new GetInboundUsersRequest
{
    Tag = "example"
});
```

## Upstream Project

This package is based entirely on the official Xray-core repository:

https://github.com/XTLS/Xray-core

All protocol definitions and API behavior belong to the Xray-core
project and its authors.

## License

The `.proto` definitions are licensed according to the upstream
Xray-core project (MPL-2.0).\
This package is distributed under the same license.
