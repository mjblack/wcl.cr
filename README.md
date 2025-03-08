# wcl

WINServer 8.x (Wildcat! BBS) Library bindings. 

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     wcl:
       github: mjblack/wcl.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "wcl"
```

You will need to download or clone the [wcSDK](https://github.com/hlsantos/wcSDK).

You will need to append to your `CRYSTAL_LIBRARY_PATH` environment variable the directory where `wcSDK` CPP directory (`C:/path/to/wcSDK/wcserver/cpp/lib64`). 

## Development

Please refer to the `wcSDK` documentation under the CPP side for reference.

## Contributing

1. Fork it (<https://github.com/mjblack/wcl.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Matthew J. Black](https://github.com/mjblack) - creator and maintainer
