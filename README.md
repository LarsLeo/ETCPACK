# ETCPACK

## Setup
To compile a Linux binary, simply run the script `./build-linux-bin.sh`. This will create a binary called `etcpack` in the current directory.<br>
It uses a Docker container to build the binary, so you need to have Docker installed.

## Introduction
Ericsson has developed a texture compression system called "Ericsson Texture Compression". The software for compressing images and textures to that format is called ETCPACK.

The latest version of this software includes the possibility to compress images to the new formats introduced as mandatory in the Khronos standards OpenGL ES 3.0 and OpenGL 4.3. We call this package the ETC2-package of codecs, where ETC stands for Ericsson Texture Compression. For instance the new RGB8 ETC2 codec allows higher-quality compression than ETC1. It is also backward compatible; an old ETC1 texture can be decoded using ETC2-capable handsets. There are also new formats for RGBA textures and single-channel (R) and double-channel (RG) textures. For a complete list of codecs, see Appendix C in the OpenGL ES 3.0 standard. The new software also compresses old ETC1 textures. The software can be used by independent hardware vendors who want to include ETC2-package-compression in the tool chains that they give or sell to game developers. It can also be used directly by game developers who want to create games for OpenGL ES 3.0 capable handsets. The software includes source code for the command-line-program etcpack.