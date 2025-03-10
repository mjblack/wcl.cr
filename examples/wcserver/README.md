# BBS Info Example

## Running
1. Ensure you have the `wcSDK` downloaded
2. Setup Crystal Library Path to include the path to `wcSDK` CPP library.
```
PS > $env:CRYSTAL_LIBRARY_PATH="$env:CRYSTAL_LIBRARY_PATH;C:\path\to\wcSDK\wcserver\cpp\lib64"
```
3. Run by executing the following command
```
PS > crystal run .\bbs_info.cr
```