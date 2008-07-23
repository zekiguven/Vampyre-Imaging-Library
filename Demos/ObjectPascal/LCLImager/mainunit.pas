{
  Vampyre Imaging Library Demo
  LCL Imager (ObjectPascal, high level/component sets/canvas, Win32/Linux/BSD)
  tested in Lazarus 0.9.24
  written by Marek Mauder

  Simple image manipulator program which shows usage of Imaging VCL/CLX/LCL
  classes (TImagingGraphic and its descendants) to display images on form.
  It also uses high level image classes and some low level functions.
  Demo uses TMultiImage class to store images (loaded from one file - MNG, DDS)
  which can be modified by user. After each modification image
  is assigned to TImagingBitmap class which provides visualization
  on the app form (using standard TImage component). Demo also uses new
  TImagingCanvas class to do some effects.
  
  In File menu you can open new image and save the current one. Items in
  View menu provide information about the current image and controls
  how it is displayed. You can also select next and previous subimage if loaded file
  contains more than one image. Format menu allows you to convert image
  to different image data formats supported by Imaging. Manipulate
  menu allows you to enlarge/shrink/flip/mirror/swap channels/other
  of the current image. Effects menu allows you to apply various effects to the
  image (provided by TImagingCanvas).
}

unit MainUnit;

{$I ImagingOptions.inc}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  Menus, ExtCtrls, ExtDlgs, DemoUtils, AboutUnit, ActnList,
  ImagingTypes,
  Imaging,
  ImagingClasses,
  ImagingComponents,
  ImagingCanvases,
  ImagingUtility;

type

  TManipulationType = (mtFlip, mtMirror, mtRotate90CW, mtRotate90CCW,
    mtResize50Nearest, mtResize50Linear, mtResize50Cubic,
    mtResize200Nearest, mtResize200Linear, mtResize200Cubic,
    mtSwapRB, mtSwapRG, mtSwapGB, mtReduce1024,
    mtReduce256, mtReduce64, mtReduce16, mtReduce2);
  TPointTransform = (ptInvert, ptIncContrast, ptDecContrast, ptIncBrightness,
    ptDecBrightness, ptIncGamma, ptDecGamma, ptTreshold);
  TNonLinearFilter = (nfMedian, nfMin, nfMax);
    

  { TMainForm }
  TMainForm = class(TForm)
    ActViewInfo: TAction;
    ActViewFitToWindow: TAction;
    ActViewRealSize: TAction;
    ActionList1: TActionList;
    Image: TImage;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    FormatItem: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItemActSubImage: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenD: TOpenPictureDialog;
    PanelStatus: TPanel;
    SaveD: TSavePictureDialog;
    procedure ActViewFitToWindowExecute(Sender: TObject);
    procedure ActViewInfoExecute(Sender: TObject);
    procedure ActViewRealSizeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem45Click(Sender: TObject);
    procedure MenuItem46Click(Sender: TObject);
    procedure MenuItem47Click(Sender: TObject);
    procedure MenuItem48Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem50Click(Sender: TObject);
    procedure MenuItem51Click(Sender: TObject);
    procedure MenuItem53Click(Sender: TObject);
    procedure MenuItem54Click(Sender: TObject);
    procedure MenuItem56Click(Sender: TObject);
    procedure MenuItem57Click(Sender: TObject);
    procedure MenuItem58Click(Sender: TObject);
    procedure MenuItem59Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem60Click(Sender: TObject);
    procedure MenuItem61Click(Sender: TObject);
    procedure MenuItem62Click(Sender: TObject);
    procedure MenuItem64Click(Sender: TObject);
    procedure MenuItem65Click(Sender: TObject);
    procedure MenuItem66Click(Sender: TObject);
    procedure MenuItem67Click(Sender: TObject);
    procedure MenuItem68Click(Sender: TObject);
    procedure MenuItem69Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure FormatChangeClick(Sender: TObject);
  private
    FBitmap: TImagingBitmap;
    FImage: TMultiImage;
    FImageCanvas: TImagingCanvas;
    FFileName: string;
    procedure OpenFile(const FileName: string);
    procedure SaveFile(const FileName: string);
    procedure SelectSubimage(Index: LongInt);
    procedure UpdateView;
    function CheckCanvasFormat: Boolean;
    procedure ApplyConvolution(Kernel: Pointer; Size: LongInt; NeedsBlur: Boolean);
    procedure ApplyPointTransform(Transform: TPointTransform);
    procedure ApplyManipulation(ManipType: TManipulationType);
    procedure ApplyNonLinear(FilterType: TNonLinearFilter; FilterSize: Integer);
    procedure MeasureTime(const Msg: string; const OldTime: Int64);
  public

  end; 

const
  SWindowTitle = 'LCL Imager - Vampyre Imaging Library %s Demo';
  
var
  MainForm: TMainForm;

implementation

{ TMainForm }

procedure TMainForm.MenuItem10Click(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.MenuItem12Click(Sender: TObject);
begin
  ApplyManipulation(mtSwapRB);
end;

procedure TMainForm.MenuItem13Click(Sender: TObject);
begin
  ApplyManipulation(mtSwapRG);
end;

procedure TMainForm.MenuItem14Click(Sender: TObject);
begin
  ApplyManipulation(mtSwapGB);
end;

procedure TMainForm.MenuItem15Click(Sender: TObject);
begin
  ApplyManipulation(mtReduce1024);
end;

procedure TMainForm.MenuItem18Click(Sender: TObject);
begin
  ApplyManipulation(mtReduce256);
end;

procedure TMainForm.MenuItem19Click(Sender: TObject);
begin
  ApplyManipulation(mtReduce64);
end;

procedure TMainForm.MenuItem20Click(Sender: TObject);
begin
  ApplyManipulation(mtReduce16);
end;

procedure TMainForm.MenuItem4Click(Sender: TObject);
begin
  ApplyManipulation(mtMirror);
end;

procedure TMainForm.MenuItem23Click(Sender: TObject);
begin
  ApplyManipulation(mtRotate90CW);
end;

procedure TMainForm.MenuItem24Click(Sender: TObject);
begin
  ApplyManipulation(mtRotate90CCW);
end;

procedure TMainForm.MenuItem26Click(Sender: TObject);
begin
  ApplyManipulation(mtResize50Nearest);
end;

procedure TMainForm.MenuItem27Click(Sender: TObject);
begin
  ApplyManipulation(mtResize50Linear);
end;

procedure TMainForm.MenuItem28Click(Sender: TObject);
begin
  ApplyManipulation(mtResize50Cubic);
end;

procedure TMainForm.MenuItem29Click(Sender: TObject);
begin
  ApplyManipulation(mtResize200Nearest);
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  ApplyManipulation(mtFlip);
end;

procedure TMainForm.MenuItem30Click(Sender: TObject);
begin
  ApplyManipulation(mtResize200Linear);
end;

procedure TMainForm.MenuItem31Click(Sender: TObject);
begin
  ApplyManipulation(mtResize200Cubic);
end;

procedure TMainForm.MenuItem33Click(Sender: TObject);
begin
  ApplyManipulation(mtReduce2);
end;

procedure TMainForm.MenuItem37Click(Sender: TObject);
begin
  ApplyConvolution(@FilterGaussian3x3, 3, False);
end;

procedure TMainForm.MenuItem38Click(Sender: TObject);
begin
  ApplyConvolution(@FilterGaussian5x5, 5, False);
end;

procedure TMainForm.MenuItem39Click(Sender: TObject);
begin
  ApplyConvolution(@FilterSharpen3x3, 3, False);
end;

procedure TMainForm.MenuItem40Click(Sender: TObject);
begin
  ApplyConvolution(@FilterSharpen5x5, 5, False);
end;

procedure TMainForm.MenuItem41Click(Sender: TObject);
begin
  ApplyConvolution(@FilterLaplace5x5, 5, True);
end;

procedure TMainForm.MenuItem42Click(Sender: TObject);
begin
  ApplyConvolution(@FilterSobelHorz3x3, 3, True);
end;

procedure TMainForm.MenuItem43Click(Sender: TObject);
begin
  ApplyConvolution(@FilterSobelVert3x3, 3, True);
end;

procedure TMainForm.MenuItem44Click(Sender: TObject);
begin
  OpenFile(FFileName);
end;

procedure TMainForm.MenuItem45Click(Sender: TObject);
begin
  ApplyConvolution(@FilterGlow5x5, 5, False);
end;

procedure TMainForm.MenuItem46Click(Sender: TObject);
begin
  ApplyConvolution(@FilterEmboss3x3, 3, True);
end;

procedure TMainForm.MenuItem47Click(Sender: TObject);
begin
  ApplyPointTransform(ptIncContrast);
end;

procedure TMainForm.MenuItem48Click(Sender: TObject);
begin
  ApplyConvolution(@FilterEdgeEnhance3x3, 3, False);
end;

procedure TMainForm.MenuItem50Click(Sender: TObject);
begin
  ApplyConvolution(@FilterPrewittHorz3x3, 3, True);
end;

procedure TMainForm.MenuItem51Click(Sender: TObject);
begin
  ApplyConvolution(@FilterKirshHorz3x3, 3, True);
end;

procedure TMainForm.MenuItem53Click(Sender: TObject);
begin
  ApplyConvolution(@FilterPrewittVert3x3, 3, True);
end;

procedure TMainForm.MenuItem54Click(Sender: TObject);
begin
  ApplyConvolution(@FilterKirshVert3x3, 3, True);
end;

procedure TMainForm.MenuItem56Click(Sender: TObject);
begin
  ApplyPointTransform(ptInvert);
end;

procedure TMainForm.MenuItem57Click(Sender: TObject);
begin
  ApplyPointTransform(ptDecContrast);
end;

procedure TMainForm.MenuItem58Click(Sender: TObject);
begin
  ApplyPointTransform(ptIncBrightness);
end;

procedure TMainForm.MenuItem59Click(Sender: TObject);
begin
  ApplyPointTransform(ptDecBrightness);
end;

procedure TMainForm.MenuItem34Click(Sender: TObject);
begin
  SelectSubimage(FImage.ActiveImage + 1);
end;

procedure TMainForm.MenuItem35Click(Sender: TObject);
begin
  SelectSubimage(FImage.ActiveImage - 1);
end;

function TMainForm.CheckCanvasFormat: Boolean;
begin
  Result := FImage.Format in FImageCanvas.GetSupportedFormats;
  if not Result then
    MessageDlg('Image is in format that is not supported by TImagingCanvas.', mtError, [mbOK], 0);
end;

procedure TMainForm.ApplyConvolution(Kernel: Pointer; Size: LongInt; NeedsBlur: Boolean);
var
  T: Int64;
begin
  if CheckCanvasFormat then
  begin
    FImageCanvas.CreateForImage(FImage);
    T := GetTimeMicroseconds;
    
    if NeedsBlur then
      FImageCanvas.ApplyConvolution3x3(FilterGaussian3x3);
    if Size = 3 then
      FImageCanvas.ApplyConvolution3x3(TConvolutionFilter3x3(Kernel^))
    else
      FImageCanvas.ApplyConvolution5x5(TConvolutionFilter5x5(Kernel^));
      
    MeasureTime('Image convolved in:', T);
    UpdateView;
  end;
end;

procedure TMainForm.ApplyPointTransform(Transform: TPointTransform);
var
  T: Int64;
begin
  if CheckCanvasFormat then
  begin
    FImageCanvas.CreateForImage(FImage);
    T := GetTimeMicroseconds;

    case Transform of
      ptInvert:        FImageCanvas.InvertColors;
      ptIncContrast:   FImageCanvas.ModifyContrastBrightness(20, 0);
      ptDecContrast:   FImageCanvas.ModifyContrastBrightness(-20, 0);
      ptIncBrightness: FImageCanvas.ModifyContrastBrightness(0, 20);
      ptDecBrightness: FImageCanvas.ModifyContrastBrightness(0, -20);
      ptIncGamma:      FImageCanvas.GammaCorection(1.2, 1.2, 1.2);
      ptDecGamma:      FImageCanvas.GammaCorection(0.8, 0.8, 0.8);
      ptTreshold:      FImageCanvas.Treshold(0.5, 0.5, 0.5);
    end;

    MeasureTime('Point transform done in:', T);
    UpdateView;
  end;
end;

procedure TMainForm.ApplyNonLinear(FilterType: TNonLinearFilter; FilterSize: Integer);
var
  T: Int64;
begin
  if CheckCanvasFormat then
  begin
    FImageCanvas.CreateForImage(FImage);
    T := GetTimeMicroseconds;

    case FilterType of
      nfMedian: FImageCanvas.ApplyMedianFilter(FilterSize);
      nfMin:    FImageCanvas.ApplyMinFilter(FilterSize);
      nfMax:    FImageCanvas.ApplyMaxFilter(FilterSize);
    end;

    MeasureTime('Point transform done in:', T);
    UpdateView;
  end;
end;

procedure TMainForm.ApplyManipulation(ManipType: TManipulationType);
var
  T: Int64;
begin
  T := GetTimeMicroseconds;
  case ManipType of
    mtFlip:             FImage.Flip;
    mtMirror:           FImage.Mirror;
    mtRotate90CW:       FImage.Rotate(-90);
    mtRotate90CCW:      FImage.Rotate(90);
    mtResize50Nearest:  FImage.Resize(FImage.Width div 2, FImage.Height div 2, rfNearest);
    mtResize50Linear:   FImage.Resize(FImage.Width div 2, FImage.Height div 2, rfBilinear);
    mtResize50Cubic:    FImage.Resize(FImage.Width div 2, FImage.Height div 2, rfBicubic);
    mtResize200Nearest: FImage.Resize(FImage.Width * 2, FImage.Height * 2, rfNearest);
    mtResize200Linear:  FImage.Resize(FImage.Width * 2, FImage.Height * 2, rfBilinear);
    mtResize200Cubic:   FImage.Resize(FImage.Width * 2, FImage.Height * 2, rfBicubic);
    mtSwapRB:           FImage.SwapChannels(ChannelRed, ChannelBlue);
    mtSwapRG:           FImage.SwapChannels(ChannelRed, ChannelGreen);
    mtSwapGB:           FImage.SwapChannels(ChannelGreen, ChannelBlue);
    mtReduce1024:       ReduceColors(FImage.ImageDataPointer^, 1024);
    mtReduce256:        ReduceColors(FImage.ImageDataPointer^, 256);
    mtReduce64:         ReduceColors(FImage.ImageDataPointer^, 64);
    mtReduce16:         ReduceColors(FImage.ImageDataPointer^, 16);
    mtReduce2:          ReduceColors(FImage.ImageDataPointer^, 2);
  end;
  MeasureTime('Image manipulated in:', T);
  UpdateView;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  Item: TMenuItem;
  Fmt: TImageFormat;
  Info: TImageFormatInfo;
begin
  Caption := Format(SWindowTitle, [Imaging.GetVersionStr]);

  { Source image and Image's graphic are created and
    default image is opened.}
  FImage := TMultiImage.Create;
  FBitmap := TImagingBitmap.Create;
  Image.Picture.Graphic := FBitmap;
  FImageCanvas := TImagingCanvas.Create;

  { This builds Format submenu containing all possible
    image data formats (it dos not start at Low(TImageFormat)
    because there are some helper formats). Format for each item
    is stored in its Tag for later use in OnClick event.}
  for Fmt := ifIndex8 to High(TImageFormat) do
  begin
    GetImageFormatInfo(Fmt, Info);
    if Info.Name <> '' then
    begin
      Item := TMenuItem.Create(MainMenu);
      Item.Caption := Info.Name;
      Item.Tag := Ord(Fmt);
      Item.OnClick := FormatChangeClick;
      FormatItem.Add(Item);
    end;
  end;
  
  // Set 'Fit to window' mode
  ActViewFitToWindowExecute(Self);
  
  if (ParamCount > 0) and FileExists(ParamStr(1)) then
    OpenFile(ParamStr(1))
  else
    OpenFile(GetDataDir + PathDelim + 'Tigers.jpg');
end;

procedure TMainForm.FormatChangeClick(Sender: TObject);
var
  T: Int64;
begin
  with Sender as TMenuItem do
  begin
    T := GetTimeMicroseconds;
    FImage.Format := TImageFormat(Tag);
    MeasureTime('Image converted in:', T);
    UpdateView;
  end;
end;

procedure TMainForm.ActViewRealSizeExecute(Sender: TObject);
begin
  ActViewRealSize.Checked := True;
  ActViewFitToWindow.Checked := False;
  Image.Proportional := False;
  Image.Stretch := False;
end;

procedure TMainForm.ActViewFitToWindowExecute(Sender: TObject);
begin
  ActViewFitToWindow.Checked := True;
  ActViewRealSize.Checked := False;
  Image.Proportional := True;
  Image.Stretch := True;
end;

procedure TMainForm.ActViewInfoExecute(Sender: TObject);
begin
  MessageDlg('Image Info: ' + ImageToStr(FImage.ImageDataPointer^), mtInformation, [mbOK], 0);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FImageCanvas.Free;
  FBitmap.Free;
  FImage.Free;
end;

procedure TMainForm.ImageClick(Sender: TObject);
begin
  ActViewInfo.Execute;
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
  OpenD.Filter := GetImageFileFormatsFilter(True);
  if OpenD.Execute then
    OpenFile(OpenD.FileName);
end;

procedure TMainForm.MenuItem5Click(Sender: TObject);
begin
  SaveD.Filter := GetImageFileFormatsFilter(False);
  SaveD.FileName := ChangeFileExt(ExtractFileName(FFileName), '');
  SaveD.FilterIndex := GetFileNameFilterIndex(FFileName, False);
  if SaveD.Execute then
  begin
    FFileName := ChangeFileExt(SaveD.FileName, '.' + GetFilterIndexExtension(SaveD.FilterIndex, False));
    SaveFile(FFileName);
  end;
end;

procedure TMainForm.MenuItem60Click(Sender: TObject);
begin
  ApplyPointTransform(ptIncGamma);
end;

procedure TMainForm.MenuItem61Click(Sender: TObject);
begin
  ApplyPointTransform(ptDecGamma);
end;

procedure TMainForm.MenuItem62Click(Sender: TObject);
begin
  ApplyPointTransform(ptTreshold);
end;

procedure TMainForm.MenuItem64Click(Sender: TObject);
begin
  ApplyNonLinear(nfMedian, 3);
end;

procedure TMainForm.MenuItem65Click(Sender: TObject);
begin
  ApplyNonLinear(nfMedian, 5);
end;

procedure TMainForm.MenuItem66Click(Sender: TObject);
begin
  ApplyNonLinear(nfMin, 3);
end;

procedure TMainForm.MenuItem67Click(Sender: TObject);
begin
  ApplyNonLinear(nfMin, 5);
end;

procedure TMainForm.MenuItem68Click(Sender: TObject);
begin
  ApplyNonLinear(nfMax, 3);
end;

procedure TMainForm.MenuItem69Click(Sender: TObject);
begin
  ApplyNonLinear(nfMax, 5);
end;

procedure TMainForm.MenuItem7Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.OpenFile(const FileName: string);
var
  T: Int64;
begin
  FFileName := FileName;
  try
    T := GetTimeMicroseconds;
    FImage.LoadMultiFromFile(FileName);
    MeasureTime(Format('File %s opened in:', [ExtractFileName(FileName)]), T);
  except
    FImage.CreateFromParams(32, 32, ifA8R8G8B8, 1);
    MessageDlg('Error when loading file: ' + FileName, mtError, [mbOK], 0);
  end;
  SelectSubimage(0);
end;

procedure TMainForm.SaveFile(const FileName: string);
var
  T: Int64;
begin
  try
    T := GetTimeMicroseconds;
    FImage.SaveMultiToFile(FileName);
    MeasureTime(Format('File %s saved in:', [ExtractFileName(FileName)]), T);
  except
    MessageDlg('Error when saving file: ' + FileName, mtError, [mbOK], 0);
  end;
end;

procedure TMainForm.SelectSubimage(Index: LongInt);
begin
  FImage.ActiveImage := Index;
  MenuItemActSubImage.Caption := Format('Active Subimage: %d/%d', [FImage.ActiveImage + 1, FImage.ImageCount]);
  UpdateView;
end;

procedure TMainForm.UpdateView;
begin
  Image.Picture.Graphic.Assign(FImage);
end;

procedure TMainForm.MeasureTime(const Msg: string; const OldTime: Int64);
begin
  PanelStatus.Caption := Format('  %s %.0n ms', [Msg, (GetTimeMicroseconds - OldTime) / 1000.0]);
end;

initialization
  {$I mainunit.lrs}

{
  File Notes:

  -- TODOS ----------------------------------------------------
    - add more canvas stuff when it will be avaiable

  -- 0.25.0 Changes/Bug Fixes ---------------------------------
    - Added point transforms and non-linear filters.

  -- 0.24.1 Changes/Bug Fixes ---------------------------------
    - Added status bar which shows times taken by some oprations.
    - Reworked manipulation commands to get rid of UpdateView calls
      everywhere.
    - With Lazarus 0.9.24 images are now displayed with
      proper transparency (those with alpha). Also it doesn't
      screw up some images with 'Fit to window' so that is now
      default.

  -- 0.23 Changes/Bug Fixes -----------------------------------
    - Catches exceptions during file load/save.

  -- 0.21 Changes/Bug Fixes -----------------------------------
    - Save As... now saves all images levels instead of just current one.
    - Added XP controls manifest to resource file.
    - Added new filters to Effects menu.

  -- 0.19 Changes/Bug Fixes -----------------------------------
    - you can now open image in Imager from shell by passing
      path to image as parameter: 'LCLImager /home/myimage.jpg'
    - added Reload from File menu to reload image from disk
      (poor man's Undo)
    - added Effects menu with some convolution filters
    - added support for displaying of multi images

  -- 0.17 Changes/Bug Fixes -----------------------------------
    - added Nearest, Bilinear, and Bicubic filter options to
      Resize To 50/200% menu items
    - better handling of file exts when using save dialog
    - added rotations to Manipulate menu
    - now works well in Linux too

  -- 0.15 Changes/Bug Fixes -----------------------------------
    - created
}

end.

