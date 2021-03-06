unit view.item;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Effects, FMX.Ani, commons.types, FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  Tview_item = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout3: TLayout;
    Path1: TPath;
    Path2: TPath;
    Layout6: TLayout;
    Text1: TText;
    Text2: TText;
    Layout7: TLayout;
    laySize: TLayout;
    Text3: TText;
    Layout10: TLayout;
    layBoard: TLayout;
    Image1: TImage;
    Image2: TImage;
    Layout12: TLayout;
    imgBoard: TImage;
    Text4: TText;
    laySizeItem: TLayout;
    Layout13: TLayout;
    rectSizeS: TRectangle;
    rectSizeL: TRectangle;
    rectSizeM: TRectangle;
    sheTamanhoCentro: TShadowEffect;
    rectSizeSelected: TRectangle;
    laySizeItemBack: TLayout;
    txtSizeS: TText;
    txtSizeL: TText;
    txtSizeM: TText;
    txtSizeSelected: TText;
    aniSizeSelected: TFloatAnimation;
    imgBoardItem: TImage;
    Path3: TPath;
    rctBotaoAddCart: TRectangle;
    lblBotaoAddCart: TLabel;
    patIconAddCart: TPath;
    sheBotaoAddCart: TShadowEffect;
    HorzScrollBox1: THorzScrollBox;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure rectSizeMClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure SetSizeBoard(aSize: TCommons_types_size);
  public
    { Public declarations }
  end;

var
  view_item: Tview_item;

implementation

{$R *.fmx}

procedure Tview_item.FormCreate(Sender: TObject);
begin
  rectSizeM.OnClick(rectSizeM);
end;

procedure Tview_item.rectSizeMClick(Sender: TObject);
begin

  var iIntType  := TRectangle(Sender).Tag;

  if not(iIntType in [1..3]) then
    exit;

  var iIntPosition := 0.0;
  var iStrText     := '';

  case TCommons_types_size(iIntType) of
    ts_small:
      begin
        iIntPosition := 0;
        iStrText     := txtSizeS.text;
      end;

    ts_medium:
      begin
        iIntPosition := rectSizeM.Position.x;
        iStrText     := txtSizeM.text;
      end;

    ts_larger:
      begin
        iIntPosition := (rectSizeL.Position.x + rectSizeL.width) - rectSizeSelected.Width;
        iStrText     := txtSizeL.text;
      end;
  end;

  rectSizeSelected.AnimateFloat('position.x', iIntPosition,0.3, TAnimationType.InOut);
  txtSizeSelected.Text := iStrText;
  SetSizeBoard(TCommons_types_size(iIntType));
end;

procedure Tview_item.SetSizeBoard(aSize: TCommons_types_size);
begin
  var iSglWidth := 0.0;

  case aSize of
    ts_small  : iSglWidth := layBoard.Width * 0.55;
    ts_medium : iSglWidth := layBoard.Width * 0.70;
    ts_larger : iSglWidth := layBoard.Width * 0.85;
    else
      exit;
  end;

  imgBoardItem.AnimateFloat('width', iSglWidth * 0.9, 0.5, TAnimationType.Out, TInterpolationType.Bounce);
  imgBoard.AnimateFloat('width', iSglWidth, 1.0, TAnimationType.Out, TInterpolationType.Bounce);
end;

end.
