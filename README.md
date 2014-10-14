Description
===========

Simple, no dependency, [node.js][2] package manager LWRP

Requirements
============

1. [node.js][2] to already be installed.

[Voxer][3] runs on [SmartOS][0] so node is already installed on every machine
we have.  Because of this, this cookbook does not depend on it directly.

Attributes
==========

None

Usage
=====

Installing Packages
-------------------

To install a package you can use

``` ruby
npm_package 'http-host-proxy@0.0.10'
```

which will install the npm package [HTTP Host Proxy][4] at version `0.0.10`.
If the package is installed already at a different version, it will be reinstalled
to the version specified.

This is equivalent to running

    npm install -g http-host-proxy@0.0.10

The version number is optional, and if omitted, will instruct this cookbook to just
ensure the package is installed at any version

``` ruby
npm_package 'http-host-proxy'
```

This is equivalent to running

    npm install -g http-host-proxy

Uninstalling Packages
---------------------

``` ruby
npm_package 'http-host-proxy' do
  action :uninstall
end
```

Ensure that the `http-host-proxy` package is not installed globally.  This is equivalent to
running

    npm uninstall -g http-host-proxy

License
=======

MIT License

```
Copyright: 2007-2014, Voxer, Inc

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

[0]: http://smartos.org
[1]: http://npmjs.org
[2]: http://nodejs.org
[3]: http://voxer.com
[4]: https://github.com/bahamas10/node-http-host-proxy
