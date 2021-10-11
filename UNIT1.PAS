unit Unit1;
// Use of a personal .RES to put cursors, sounds,
// strings, pictures in the EXE
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, MMSystem, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    BitBtn1: TBitBtn;
    Button3: TButton;
    Button4: TButton;
    Button9: TButton;
    Label1: TLabel;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Déclarations private }
  public
    { Déclarations public }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{$R Test.res}

Var  icons : Array[0..2] of Ticon;
// Plays a sound (.wav) stocked in the .RES
procedure joue(le_son : pchar);
var
  h: THandle;
  p: pointer;
begin
  h := FindResource(hInstance,
                    le_son,
                    'WAV');
  h := LoadResource(hInstance, h);
  p := LockResource(h);
  sndPlaySound(p,
               SND_MEMORY or SND_SYNC);
  UnLockResource(h);
  FreeResource(h);
 end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  joue('S1');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  joue('S2');
end;

 // direct play
procedure TForm1.Button5Click(Sender: TObject);
Const le_son = 'son1.wav';
begin
  if not sndPlaySound(le_son,SND_SYNC) then
  ShowMessage('Problem with '+le_son);
end;
// Displays a first picture stocked in the .RES
procedure TForm1.Button6Click(Sender: TObject);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  Bmp.Handle := LoadBitmap(HInstance,'vache');
  Refresh;
  Canvas.Draw(width-bmp.width-30, 60, Bmp);
  Bmp.Free;
end;
// Displays a second picture stocked in the .RES
procedure TForm1.Button7Click(Sender: TObject);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  Bmp.Handle := LoadBitmap(HInstance,'perroquet');
  Refresh;
  Canvas.Draw(width-bmp.width-30, 60, Bmp);
  Bmp.Free;
end;
// Displays a third picture stocked in the .RES
procedure TForm1.Button8Click(Sender: TObject);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  Bmp.Handle := LoadBitmap(HInstance,'rat');
  Refresh;
  Canvas.Draw(width-bmp.width-30, 60, Bmp);
  Bmp.Free;
end;
// Loads a first cursor stocked in the .RES
procedure TForm1.Button3Click(Sender: TObject);
begin
  Screen.Cursors[1] := LoadCursor(hinstance,'baton');
  Cursor := 1;
end;

// Loads a second cursor stocked in the .RES
procedure TForm1.Button4Click(Sender: TObject);
begin
  Screen.Cursors[2] := LoadCursor(hinstance,'seau');
  Cursor := 2;
end;
// Restores the default cursor
procedure TForm1.Button9Click(Sender: TObject);
begin
 Screen.Cursors[0] := crDefault;
 Cursor := 0;
end;
// Displays a first string stocked in the .RES
procedure TForm1.Button10Click(Sender: TObject);
Var Ch : array[0..255] of char;
begin
  label1.caption := '';
  if LoadString(hInstance,1,@Ch,sizeof(Ch)) <> 0 then
  Label1.Caption := StrPas(Ch);
end;
// Displays a second string stocked in the .RES
procedure TForm1.Button11Click(Sender: TObject);
Var Ch : array[0..255] of char;
begin
  label1.caption := '';
  if LoadString(hInstance,2,@Ch,sizeof(Ch)) <> 0 then
  Label1.Caption := StrPas(Ch);
end;
// Displays a third string stocked in the .RES
procedure TForm1.Button12Click(Sender: TObject);
Var Ch : array[0..255] of char;
begin
  label1.caption := '';
  if LoadString(hInstance,3,@Ch,sizeof(Ch)) <> 0 then
  Label1.Caption := StrPas(Ch);
end;

// icons creation
procedure TForm1.FormCreate(Sender: TObject);
begin
  icons[0] := TICon.Create;
  icons[0].Handle := LoadIcon(HInstance,'I1');
  icons[1] := TICon.Create;
  icons[1].Handle := LoadIcon(HInstance,'I2');
  icons[2] := TICon.Create;
  icons[2].Handle := LoadIcon(HInstance,'I3');

  Icon := Icons[0];
  Application.Icon := Icon
end;
// Little animation
procedure TForm1.Timer1Timer(Sender: TObject);
Const numero : integer = 1;
begin
  Icon := icons[numero];
  Application.Icon := Icon;
  numero := succ(numero) mod 3;
  SELF.Perform(WM_SETICON,1,Icon.Handle);
  SendMessage(Application.Handle,WM_SETICON,1,Icon.Handle);
end;
// icons destruction
procedure TForm1.FormDestroy(Sender: TObject);
begin
  icons[0].Free;
  icons[1].Free;
  icons[2].Free;
end;

end.




