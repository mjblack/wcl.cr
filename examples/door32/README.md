# DoorTest64

An example WINServer 8.x Native Door.

## Build Instructions

1. If there is no `wcdoor32x64.lib` file in the `wcSDK` CPP library then you will need to create it. If you have it then skip to `Step 2`
* Open `Developer PowerShell for VS 2022` (or the version that came with your Visual Studio)
* Change directory to the `wcSDK` CPP lib directory.
```
PS > cd \path\to\wcSDK\wcserver\cpp\lib64
```
* Create a file named `wcdoor32x64.def` with the following contents
```
EXPORTS
wcDoorCharReady
wcDoorEvent
wcDoorGetAvailableEventHandle
wcDoorGetOfflineEventHandle
wcDoorHangUp
wcDoorInitialize
wcDoorRead
wcDoorReadPeek
wcDoorShutdown
wcDoorWrite
```
* Run the lib tool to generate a `wcdoor32x64.lib`
```
PS > lib /def:wcdoor32x64.def /out:wcdoor32x64.lib /machine:x64
```


2. Setup Crystal Library Path to include the path to `wcSDK` CPP library.
```
PS > $env:CRYSTAL_LIBRARY_PATH="$env:CRYSTAL_LIBRARY_PATH;C:\path\to\wcSDK\wcserver\cpp\lib64"
```

3. Build the source
```
PS > crystal build --static --single-module .\doortest64.cr
```

4. Copy the EXE to your WINServer directory
5. Create a new Door in `wcconfig` as a `Wildcat! Door32 (uses wcDOOR32.DLL)` and in the batch file call the generated EXE.
