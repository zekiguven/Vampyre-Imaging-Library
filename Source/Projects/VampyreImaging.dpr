{
  $Id: VampyreImaging.dpr,v 1.13 2006/09/21 19:44:36 galfar Exp $
  Vampyre Imaging Library
  by Marek Mauder (pentar@seznam.cz)
  http://imaginglib.sourceforge.net

  The contents of this file are used with permission, subject to the Mozilla
  Public License Version 1.1 (the "License"); you may not use this file except
  in compliance with the License. You may obtain a copy of the License at
  http://www.mozilla.org/MPL/MPL-1.1.html

  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
  the specific language governing rights and limitations under the License.

  Alternatively, the contents of this file may be used under the terms of the
  GNU Lesser General Public License (the  "LGPL License"), in which case the
  provisions of the LGPL License are applicable instead of those above.
  If you wish to allow use of your version of this file only under the terms
  of the LGPL License and not to allow others to use your version of this file
  under the MPL, indicate your decision by deleting  the provisions above and
  replace  them with the notice and other provisions required by the LGPL
  License.  If you do not delete the provisions above, a recipient may use
  your version of this file under either the MPL or the LGPL License.

  For more information about the LGPL: http://www.gnu.org/copyleft/lesser.html
}

{ This is main file for Imaging dynamic link library. It exports
  some low level functions operating on TImageData record. All string are
  exported as PChars.}
library VampyreImaging;

{$DEFINE DYN_LIBRARY}
{$I ImagingOptions.inc}

uses
  ImagingTypes,
  ImagingExport;

{$IFDEF MSWINDOWS}
  {$R *.res}
{$ENDIF}

exports
  ImGetVersion,
  ImInitImage,
  ImNewImage,
  ImTestImage,
  ImFreeImage,
  ImDetermineFileFormat,
  ImDetermineMemoryFormat,
  ImIsFileFormatSupported,

  ImInitImageList,
  ImGetImageListSize,
  ImGetImageListElement,
  ImSetImageListSize,
  ImSetImageListElement,
  ImTestImagesInList,
  ImFreeImageList,

  ImLoadImageFromFile,
  ImLoadMultiImageFromFile,
  ImLoadImageFromMemory,
  ImLoadMultiImageFromMemory,

  ImSaveImageToFile,
  ImSaveImageToMemory,
  ImSaveMultiImageToFile,
  ImSaveMultiImageToMemory,

  ImCloneImage,
  ImConvertImage,
  ImFlipImage,
  ImMirrorImage,
  ImResizeImage,
  ImSwapChannels,
  ImReduceColors,
  ImGenerateMipMaps,
  ImMapImageToPalette,
  ImSplitImage,
  ImMakePaletteForImages,
  ImRotateImage,

  ImCopyRect,
  ImFillRect,
  ImReplaceColor,
  ImStretchRect,
  ImGetPixelDirect,
  ImSetPixelDirect,
  ImGetPixel32,
  ImSetPixel32,
  ImGetPixelFP,
  ImSetPixelFP,

  ImNewPalette,
  ImFreePalette,
  ImCopyPalette,
  ImFindColor,
  ImFillGrayscalePalette,
  ImFillCustomPalette,
  ImSwapChannelsOfPalette,

  ImSetOption,
  ImGetOption,
  ImPushOptions,
  ImPopOptions,

  ImGetImageFormatInfo,
  ImGetPixelsSize,

  ImSetUserFileIO,
  ImResetFileIO;

begin
{
  Changes/Bug Fixes:

  -- 0.19 -----------------------------------------------------
    - updated to reflect changes in ImagingExport

  -- 0.13 -----------------------------------------------------
    - Free Pascal's smartlinking was turned off when building library
      because nothing got exported from it when it was on

}
end.
