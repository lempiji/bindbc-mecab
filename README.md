# bindbc-mecab
This project provides dynamic and static bindings to the C API of [MeCab](http://taku910.github.io/mecab/). The bindings are `@nogc` and `nothrow` compatible and can be compiled for compatibility with `-betterC`.

## Usage
By default, `bindbc-mecab` is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the library, so the shared library must be manually loaded at runtime.

To use MeCab, add `bindbc-mecab` as a dependency to your project's package config file. For example, the following is configured to use MeCab as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
"dependencies": {
    "bindbc-mecab": "~>1.0.0",
}
```

__dub.sdl__
```
dependency "bindbc-mecab" version="~>1.0.0"
```

### Load Library

```
const support = loadMeCab();
if (support != MeCabSupport.mecab)
{
    writeln("Failed to load the library");
    return;
}
scope (exit)
    unloadMeCab();
```
