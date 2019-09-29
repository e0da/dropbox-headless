# dropbox-headless

Easily set up headless Dropbox on Linux (tested on Ubuntu).

## How it works

1. It follows Dropbox's [Dropbox Headless Install via command line][] guide
2. It uses cron to start the daemon after each boot
3. It installs the convenient [Dropbox Python script][] to `$HOME/bin`

[dropbox headless install via command line]: https://www.dropbox.com/install-linux#linux-install-content
[dropbox python script]: https://www.dropbox.com/download?dl=packages/dropbox.py

## Install

```sh
make
```

## Uninstall

```sh
make uninstall
```

## License and copyright

Copyright Justin Force and licensed under the [ISC License][].

[isc license]: http://www.opensource.org/licenses/ISC
