{ $Id: ImagingOptions.inc 100 2007-06-28 21:09:52Z galfar $ }

{ Include compiler options }
{$I CompilerOptions.inc}

{
  User Options
  Following defines and options can be changed by user.
  ----------------------------------------------------------------------------
}

{ File format support options. Undefine formats which you don't want
  to be registred automatically (they won't be linked to your binaries
  making them smaller).}

{$DEFINE FILEFORMAT_NATIVE}      // support for Imaging's native file format
{$DEFINE FILEFORMAT_JPEG}        // support for Jpeg images
{$DEFINE FILEFORMAT_PNG}         // support for PNG images
{$DEFINE FILEFORMAT_TARGA}       // support for Targa images
{$DEFINE FILEFORMAT_BITMAP}      // support for Windows Bitmap images
{$DEFINE FILEFORMAT_DDS}         // support for DDS images
{$DEFINE FILEFORMAT_GIF}         // support for GIF images
{$DEFINE FILEFORMAT_MNG}         // support for MNG images
{$DEFINE FILEFORMAT_JNG}         // support for JNG images
{$DEFINE FILEFORMAT_PNM}         // support for PortableMap images (PBM, PGM, PPM, PAM, PFM)

{ Data format support options. Undefine formats which you don't want
  to be registred automatically (they won't be linked to your binaries
  making them smaller). Only groups of some formats can be undefined.}
{$DEFINE DATAFORMAT_INDEX}       // support for indexed formats (using palettes)
{$DEFINE DATAFORMAT_CMYK}        // support for CMYK formats
{$DEFINE DATAFORMAT_FLOAT}       // support for floating point formats
{$DEFINE DATAFORMAT_BC}          // support for block compressed formats (DXTc, BTC, etc.)

{
  Auto Options
  Following options and defines are set automatically and some
  are required for Imaging to compile successfully. Do not change
  anything here if you don't know what you are doing.
  -----------------------------------------------------------------------------
}

{ Extension dependencies check }

{$IFDEF LINK_MNG}          // MNG uses internaly both PNG and JNG
  {$DEFINE LINK_JNG}
  {$DEFINE LINK_PNG}
{$ENDIF}

{$IFDEF LINK_JNG}          // JNG uses internaly both PNG and JPEG
  {$DEFINE LINK_PNG}
  {$DEFINE LINK_JPEG}
{$ENDIF}


