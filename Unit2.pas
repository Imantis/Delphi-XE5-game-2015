unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unit1, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.MPlayer;

type
  TForm2 = class(TForm)
    Logo: TImage;
    MoonMove: TTimer;
    SettingsPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    CheatEdit: TEdit;
    Button5: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    InfoPanel: TPanel;
    Label4: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    MediaPlayer1: TMediaPlayer;
    Image1: TImage;
    sound_icon: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure MoonMoveTimer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  zcheat: boolean;
  Form2: TForm2;
  Backgr: tbitmap;
  path: string;
  moonspeed: shortint;
  wtext:textfile;
implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form1:=TForm1.Create(self);
  Unit1.Form1.Show;
  Form2.Visible:=false;
  Form1.Top:=form2.Top;
  Form1.Left:=form2.left;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if SettingsPanel.Visible then SettingsPanel.Visible:=false
  else SettingsPanel.Visible:=true;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  if InfoPanel.Visible then InfoPanel.Visible:=false
  else InfoPanel.Visible:=true;
//read(wtext, t);
    //   form2.Label7.Caption:=t;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  closefile(wtext);
  application.Terminate;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  if CheatEdit.Text = '1337' then begin
    zcheat:=true;
    cheatedit.Text:= 'Z cheat activated!';
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var t: string;
begin
  MediaPlayer1.VisibleButtons:= [btPlay, btStop];
  AssignFile(wtext, 'Score.info');
  {$IOCHECKS OFF}
  reset(wtext);
  {$IOCHECKS ON}
  if ioresult<>0 then begin
    rewrite(wtext);
    write(wtext, inttostr(228));
  end
  else begin
    read(wtext, t);
    form2.Label7.Caption:=t;
  end;
  form2.Show;
  path:=ExtractFiledir(Application.ExeName);
  Backgr:=tbitmap.create;
  Backgr.LoadFromFile(path+'\img\fon.bmp');
  moonspeed:=-1;
  self.Logo.Parent.DoubleBuffered:=true;
end;

procedure TForm2.FormPaint(Sender: TObject);
begin
  Form2.Canvas.Draw(0, 0, Backgr);
end;



procedure TForm2.MoonMoveTimer(Sender: TObject);
begin
  if (form2.logo.Top < 77) or (form2.logo.Top> 83)  then moonspeed:=-moonspeed;
  form2.logo.Top:=form2.logo.Top+moonspeed;
end;

end.
