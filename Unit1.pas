unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Ship: TImage;
    enemy1: TImage;
    Bullet1: TImage;
    Bullet2: TImage;
    Bullet4: TImage;
    Bullet3: TImage;
    Image7: TImage;
    BulletTimer: TTimer;
    enemy2: TImage;
    PointsScreen: TLabel;
    Boss: TImage;
    EnemyBullet1: TImage;
    EnemyBullet2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LevelNumber: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    BossBullet: TImage;
    ShipMove: TTimer;
    SmartBullet: TTimer;
    SmartBullet1: TImage;
    SmartBullet2: TImage;
    BoomTimerE1: TTimer;
    boom1: TImage;
    BoomTimerE2: TTimer;
    Boom2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BulletTimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ShipMoveTimer(Sender: TObject);
    procedure SmartBulletTimer(Sender: TObject);
    procedure BoomTimerE1Timer(Sender: TObject);
    procedure BoomTimerE2Timer(Sender: TObject);
//    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   Form1: TForm1;
   path:string;
   Bullet_speed : array [1..4] of integer;
   level: array[1..3] of bool;
   points:integer;
   EnemySpeed: array[1..2] of integer;
   EnemyHP1:integer;
   EnemyHP2:integer;
   EnemyBulletSpeed1:integer;
   EnemyBulletSpeed2:integer;
   ShipHP:integer;
   shipspeed: shortint;
   BossBulletSpeed:integer;
   SmartBulletSpeed1:integer;
   SmartBulletSpeed2:integer;
   time:cardinal;
   st, et: cardinal;
   t: string;
   boomtimeE1, boomtimeE2: byte;
implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.BoomTimerE1Timer(Sender: TObject);
begin
  if boomtimeE1>=35 then begin
    boom1.Visible:=false;
    boomTimerE1.Enabled:=false;
  end
  else inc(boomtimeE1);
end;

procedure TForm1.BoomTimerE2Timer(Sender: TObject);
begin
  if boomtimeE2>=35 then begin
    boom2.Visible:=false;
    boom2.Visible:=false;
    boom2.Visible:=false;
    boomTimerE2.Enabled:=false;
  end
  else   begin
  boom2.Visible:=false; inc(boomtimeE2);  end;
end;

procedure TForm1.BulletTimerTimer(Sender: TObject);
var i: byte;
    temppic: TPicture;
////////////////////////////////////////////////////////////////////////////////
procedure pico;
begin
  {1 пуля в 1 врага}
  if (Bullet1.Top + Bullet1.Height >= enemy1.Top) and
  (Bullet1.Top <= enemy1.Top + enemy1.Height) and
  (Bullet1.Left +  Bullet1.Width >= enemy1.Left) and
  (Bullet1.Left <= enemy1.Left + enemy1.Width) then
  begin
    Bullet1.Top := round(ship.Top+(ship.Width/2));
    Bullet1.Left := round(ship.Left+40);
    Bullet_Speed[1]:=0;
    Dec(EnemyHP1);
  end;

  {1 пуля во 2 врага}
  if (Bullet1.Top + Bullet1.Height >= enemy2.Top) and
  (Bullet1.Top <= enemy2.Top + enemy2.Height) and
  (Bullet1.Left +  Bullet1.Width >= enemy2.Left) and
  (Bullet1.Left <= enemy2.Left + enemy2.Width) then
  begin
    Bullet1.Top := round(ship.Top+(ship.Width/2));
    Bullet1.Left := round(ship.Left+40);
    Bullet_Speed[1]:=0;
    Dec(EnemyHP2);
  end;

  {2 пуля в 1 врага}
  if (Bullet2.Top + Bullet2.Height >= enemy1.Top) and
  (Bullet2.Top <= enemy1.Top + enemy1.Height) and
  (Bullet2.Left +  Bullet2.Width >= enemy1.Left) and
  (Bullet2.Left <= enemy1.Left + enemy1.Width) then
  begin
    Bullet2.Top := round(ship.Top+(ship.Width/2));
    Bullet2.Left := round(ship.Left+40);
    Bullet_Speed[2]:=0;
    Dec(EnemyHP1);
  end;

  {2 пуля во 2 врага}
  if (Bullet2.Top + Bullet2.Height >= enemy2.Top) and
  (Bullet2.Top <= enemy2.Top + enemy2.Height) and
  (Bullet2.Left +  Bullet2.Width >= enemy2.Left) and
  (Bullet2.Left <= enemy2.Left + enemy2.Width) then
  begin
    Bullet2.Top := round(ship.Top+(ship.Width/2));
    Bullet2.Left := round(ship.Left+40);
    Bullet_Speed[2]:=0;
    Dec(EnemyHP2);
  end;

  {3 пуля в 1 врага}
  if (Bullet3.Top + Bullet3.Height >= enemy1.Top) and
  (Bullet3.Top <= enemy1.Top + enemy1.Height) and
  (Bullet3.Left +  Bullet3.Width >= enemy1.Left) and
  (Bullet3.Left <= enemy1.Left + enemy1.Width) then
  begin
    Bullet3.Top := round(ship.Top+(ship.Width/2));
    Bullet3.Left := round(ship.Left+40);
    Bullet_Speed[3]:=0;
    Dec(EnemyHP1);
  end;

  {3 пуля во 2 врага}
  if (Bullet3.Top + Bullet3.Height >= enemy2.Top) and
  (Bullet3.Top <= enemy2.Top + enemy2.Height) and
  (Bullet3.Left +  Bullet3.Width >= enemy2.Left) and
  (Bullet3.Left <= enemy2.Left + enemy2.Width) then
  begin
    Bullet3.Top := round(ship.Top+(ship.Width/2));
    Bullet3.Left := round(ship.Left+40);
    Bullet_Speed[3]:=0;
    Dec(EnemyHP2);
  end;

  {4 пуля в 1 врага}
  if (Bullet4.Top + Bullet4.Height >= enemy1.Top) and
  (Bullet4.Top <= enemy1.Top + enemy1.Height) and
  (Bullet4.Left +  Bullet4.Width >= enemy1.Left) and
  (Bullet4.Left <= enemy1.Left + enemy1.Width) then
  begin
    Bullet4.Top := round(ship.Top+(ship.Width/2));
    Bullet4.Left := round(ship.Left+40);
    Bullet_Speed[4]:=0;
    Dec(EnemyHP1);
  end;

  {4 пуля во 2 врага}
  if (Bullet4.Top + Bullet4.Height >= enemy2.Top) and
  (Bullet4.Top <= enemy2.Top + enemy2.Height) and
  (Bullet4.Left +  Bullet4.Width >= enemy2.Left) and
  (Bullet4.Left <= enemy2.Left + enemy2.Width) then
  begin
    Bullet4.Top := round(ship.Top+(ship.Width/2));
    Bullet4.Left := round(ship.Left+40);
    Bullet_Speed[4]:=0;
    Dec(EnemyHP2);
  end;

end;
 ///////////////////////////////////////////////////////////////////////////////
procedure boku;
begin

  {Движение врагов}
  if (enemy1.Left<=0) or (enemy1.Left>=form1.ClientWidth-enemy1.Width) then EnemySpeed[1]:=-EnemySpeed[1];
  if (enemy2.Left<=0) or (enemy2.Left>=form1.ClientWidth-enemy2.Width) then EnemySpeed[2]:=-EnemySpeed[2];
  enemy1.Left:= enemy1.Left + EnemySpeed[1];
  enemy2.Left:= enemy2.Left + EnemySpeed[2];

  {Настройка скорости/сбрасываем}
  if (EnemyBulletSpeed1=0) and (round(enemy1.Left/10) *10=round(ship.Left/10) *10)  then EnemyBulletSpeed1:=5;
  if (EnemyBulletSpeed2=0) and (round(enemy2.Left/10) *10=round(ship.Left/10) *10)  then EnemyBulletSpeed2:=5;

  {Бессмысленное таскание пуль врагов за врагами}
  if EnemyBulletSpeed1=0 then
  begin
    EnemyBullet1.Top := round(enemy1.Top+35);
    EnemyBullet1.Left := round(enemy1.Left+40);
  end
  else EnemyBullet1.Top := EnemyBullet1.Top + EnemyBulletSpeed1;

  if enemyBulletSpeed2=0 then
  begin
    EnemyBullet2.Top := round(enemy2.Top+35);
    EnemyBullet2.Left := round(enemy2.Left+40);
  end
  else EnemyBullet2.Top := EnemyBullet2.Top + EnemyBulletSpeed2;

  {Проверка на вылет пуль за карту}
  if EnemyBullet1.Top>=ClientHeight+200 then EnemyBulletSpeed1:=0;
  if EnemyBullet2.Top>=ClientHeight+200 then EnemyBulletSpeed2:=0;

  {Проверка попадания вражеских пуль в наш корабль}
  if (EnemyBullet1.Top + EnemyBullet1.Height >= Ship.Top) and
  (EnemyBullet1.Top<=ship.Top + ship.Height) and
  (EnemyBullet1.Left + EnemyBullet1.Width >= ship.Left) and
  (EnemyBullet1.Left<=ship.Left+ship.Width) then
  begin
    EnemyBulletSpeed1:=0;
    dec(shipHP);
  end;

  if (EnemyBullet2.Top + EnemyBullet2.Height >= Ship.Top) and
  (EnemyBullet2.Top<=ship.Top + ship.Height) and
  (EnemyBullet2.Left + EnemyBullet2.Width >= ship.Left) and
  (EnemyBullet2.Left<=ship.Left+ship.Width) then
  begin
    EnemyBulletSpeed2:=0;
    dec(shipHP);
  end;

  {Живы ли мы?}
  if shipHP<=0 then
  begin
    BulletTimer.Enabled:=false;
    ShipMove.Enabled:=false;
    ShowMessage('YOU LOSE!!!');
    form1.Close;
    form2.visible:=true;
  end;

end;
////////////////////////////////////////////////////////////////////////////////
begin {BulletTimerTimer}
  if form1.Visible then begin

    {Отображение наших жизней}
    label3.Caption:=IntToStr(shipHP);

    {Бессмысленное таскание наших пуль за нашим кораблём}
    if Bullet_Speed[1]=0 then
    begin
      Bullet1.Top := round(ship.Top+(ship.Width/2));
      Bullet1.Left := round(ship.Left+40);
    end
    else Bullet1.Top := Bullet1.Top - Bullet_Speed[1];

    if Bullet_Speed[2]=0 then
    begin
      Bullet2.Top := round(ship.Top+(ship.Width/2));
      Bullet2.Left := round(ship.Left+40);
    end
    else Bullet2.Top := Bullet2.Top - Bullet_Speed[2];

    if Bullet_Speed[3]=0 then
    begin
      Bullet3.Top := round(ship.Top+(ship.Width/2));
      Bullet3.Left := round(ship.Left+40);
    end
    else Bullet3.Top := Bullet3.Top - Bullet_Speed[3];

    if Bullet_Speed[4]=0 then
    begin
      Bullet4.Top := round(ship.Top+(ship.Width/2));
      Bullet4.Left := round(ship.Left+40);
    end
    else Bullet4.Top := Bullet4.Top - Bullet_Speed[4];

    {Проверка на вылет нашей пули за экран}
    if Bullet1.Top < -100 then Bullet_Speed[1] := 0;
    if Bullet2.Top < -100 then Bullet_Speed[2] := 0;
    if Bullet3.Top < -100 then Bullet_Speed[3] := 0;
    if Bullet4.Top < -100 then Bullet_Speed[4] := 0;

    {Отображение количества оставшихся врагов}
    PointsScreen.Caption:= IntToStr(points);

////////////////////////////////Первый уровень//////////////////////////////////
    if level[1] then begin

      LevelNumber.Caption:='1';  {Без комментариев!}
      pico;                      {Проверка попаданий во вражеские корабли}

      {Создание новых мобов после убийства старых}
      if EnemyHP1<=0 then
      begin
        boomtimeE1:=1;
        boom1.Left:=enemy1.Left;
        boom1.Top:=enemy1.top;
        boom1.visible:=true;
        boomtimerE1.Enabled:=true;
        enemy1.Left:= 920;
        enemy1.Top:= 183;
        EnemyHP1:=3;
        Dec(points);
      end;

      if EnemyHP2<=0 then
      begin
        boomtimeE2:=1;
        boom2.Left:=enemy2.Left;
        boom2.Top:=enemy2.top;
        boom2.visible:=true;
        boomtimerE2.Enabled:=true;
        enemy2.Left:= 8;
        enemy2.Top:= 71;
        EnemyHP2:=3;
        Dec(points);
      end;

      boku; {Обновление врагов}

///////////////////Проверка и подготовка к следующему уровню////////////////////
      if points<=0 then
      begin
        level[1]:= false;  level[2]:=true;
        points:=25;
        enemy1.Picture.LoadFromFile(path+'\img\enemy1.png');
        enemy2.Picture.LoadFromFile(path+'\img\enemy1.png');
        image7.Picture.LoadFromFile(path+'\img\cosmos2.jpeg');
        label2.Font.Color := clLime;
        LevelNumber.Font.Color := clLime;
        label4.Font.Color := clLime;
        label3.Font.Color := clLime;
        label1.Font.Color := clLime;
        PointsScreen.Font.Color := clLime;
        if not Form2.CheckBox1.Checked then ShipHP:=3;
        LevelNumber.Caption:='2';
        enemyHP1:=5;
        EnemyHP2:=5;
      end;
    end; {First level}
/////////////////////////////////Второй уровень/////////////////////////////////
    if level[2] then begin

      pico; {Проверка попаданий во вражеские корабли}

      {Создание новых мобов после убийства старых}
      if EnemyHP1<=0 then
      begin
        boomtimeE1:=1;
        boom1.Left:=enemy1.Left;
        boom1.Top:=enemy1.top;
        boom1.visible:=true;
        boomtimerE1.Enabled:=true;
        enemy1.Left:= 920;
        enemy1.Top:= 183;
        EnemyHP1:=5;
        Dec(points);
      end;

      if EnemyHP2<=0 then
      begin
        boomtimeE2:=1;
        boom2.Left:=enemy2.Left;
        boom2.Top:=enemy2.top;
        boom2.visible:=true;
        boomtimerE2.Enabled:=true;
        enemy2.Left:= 8;
        enemy2.Top:= 71;
        EnemyHP2:=5;
        Dec(points);
      end;

      boku; {Обновление врагов}

///////////////////Проверка и подготовка к следующему уровню////////////////////
      if points<=0 then
      begin
        level[2]:= false;  level[3]:=true;
        points:=100;         /////////////3 уровень поинты это хп противника
        image7.Picture.LoadFromFile(path+'\img\cosmos3.jpg');
        label2.Font.Color := clRed;
        LevelNumber.Font.Color := clRed;
        label4.Font.Color := clRed;
        label3.Font.Color := clRed;
        label1.Font.Color := clRed;
        PointsScreen.Font.Color := clRed;
        Label1.Caption:='Boss HP : ';
        if not Form2.CheckBox1.Checked then ShipHP:=3;
        LevelNumber.Caption:='3';
        enemy1.Visible:=false;
        enemy2.Visible:=false;
        Boss.Visible:=true;
        enemybullet1.Visible:=false;
        enemybullet2.Visible:=false;
        BossBullet.Visible:=true;
        SmartBullet.Enabled:=true;
        SmartBullet1.Visible:=true;
        SmartBullet2.Visible:=true;
        SmartBulletSpeed1:=2;
        SmartBulletSpeed2:=2;
      end;
    end;{Second level}
/////////////////////////////////Третий уровень/////////////////////////////////
    if level[3] then begin

    {Проверка на попадание в босса}
    if (Bullet1.Top + Bullet1.Height >= boss.Top) and
    (Bullet1.Top <= boss.Top + boss.Height) and
    (Bullet1.Left +  Bullet1.Width >= boss.Left) and
    (Bullet1.Left <= boss.Left + boss.Width) then
    begin
      Bullet1.Top := round(ship.Top+(ship.Width/2));
      Bullet1.Left := round(ship.Left+40);
      Bullet_Speed[1]:=0;
      Dec(Points);
    end;

   if (Bullet2.Top + Bullet2.Height >= boss.Top) and
   (Bullet2.Top <= boss.Top + boss.Height) and
   (Bullet2.Left +  Bullet2.Width >= boss.Left) and
   (Bullet2.Left <= boss.Left + boss.Width) then
   begin
     Bullet2.Top := round(ship.Top+(ship.Width/2));
     Bullet2.Left := round(ship.Left+40);
     Bullet_Speed[2]:=0;
     Dec(Points);
   end;

   if (Bullet3.Top + Bullet3.Height >= boss.Top) and
   (Bullet3.Top <= boss.Top + boss.Height) and
   (Bullet3.Left +  Bullet3.Width >= boss.Left) and
   (Bullet3.Left <= boss.Left + boss.Width) then
   begin
     Bullet3.Top := round(ship.Top+(ship.Width/2));
     Bullet3.Left := round(ship.Left+40);
     Bullet_Speed[3]:=0;
     Dec(Points);
   end;

   if (Bullet4.Top + Bullet4.Height >= boss.Top) and
   (Bullet4.Top <= boss.Top + boss.Height) and
   (Bullet4.Left +  Bullet1.Width >= boss.Left) and
   (Bullet4.Left <= boss.Left + boss.Width) then
   begin
     Bullet4.Top := round(ship.Top+(ship.Width/2));
     Bullet4.Left := round(ship.Left+40);
     Bullet_Speed[4]:=0;
     Dec(Points);
   end;

   {Запихиваем в босса его мега луч}
   if BossBulletSpeed=0 then
   begin
     BossBullet.Top := round(Boss.Top);
     BossBullet.Left := round(Boss.Left);
   end
   else bossbullet.Top := bossbullet.Top + BossBulletSpeed;

   {Проверка на вылет мега луча за экран}
   if BossBullet.Top>=ClientHeight+200 then BossBulletSpeed:=0;

   {Проверка на попадание мега луча в нас}
   if (BossBullet.Top + BossBullet.Height >= Ship.Top) and
   (BossBullet.Top<=ship.Top + ship.Height) and
   (BossBullet.Left + BossBullet.Width >= ship.Left) and
   (BossBullet.Left<=ship.Left+ship.Width)    then
   begin
     dec(shipHP);
     ship.Left:= 20; {Что делает эта строчка?}
   end;

   {Стрелять ли боссу мега лучом?}
   if (BossBulletSpeed=0) and (Boss.Left<ship.Left) and (Boss.Left + Boss.Width>ship.Left+ship.Width) then BossBulletSpeed:=4;

   {Живы ли мы?}
   if shipHP<=0 then
   begin
     BulletTimer.Enabled:=false;
     SmartBullet.Enabled:=false;
     ShipMove.Enabled:=false;
     ShowMessage('YOU LOSE!!!');
     form1.Visible:=false;
     form2.Visible:=true;
   end;
//////////////////////Проверка и подготовка к концу игры////////////////////////
   if points<=0 then
   begin
     level[3]:=false;
     boss.Visible:=false;
     label5.Visible:=true;
     SmartBullet.Enabled:=false;
     SmartBullet1.Visible:=false;
     SmartBullet2.Visible:=false;
     bossbullet.Visible:=false;
     et:=GetTickCount;
     time:=et-st;
     ShipMove.Enabled:=false;
     BulletTimer.Enabled:=false;
     SmartBullet.Enabled:=false;
     if strtoint(form2.Label7.Caption)>ROUND(time/1000) then begin
       rewrite(wtext);
       write(wtext,inttostr(ROUND(time/1000)));
       reset(wtext);
       read(wtext, t);
       form2.Label7.Caption:=t;
     end;
     Showmessage('You WIN!!! Your time '+IntTOStr(ROUND(time/1000))+' sek');
     Form1.Visible:=false;
     form2.Visible:=true;
   end;
 end;
end;    {Я не знаю от чего это))}
end;
///////////////////////////////Конец игры///////////////////////////////////////




procedure TForm1.FormCreate(Sender: TObject);
begin
  path:=ExtractFileDir(Application.ExeName);
  Self.Ship.Parent.DoubleBuffered := true;
  Self.enemy1.Parent.DoubleBuffered := true;
  Self.enemy2.Parent.DoubleBuffered := true;
//  Self.enemy3.Parent.DoubleBuffered := true;
//  Self.enemy4.Parent.DoubleBuffered := true;
  Self.Bullet1.Parent.DoubleBuffered := true;
  Self.Bullet2.Parent.DoubleBuffered := true;
  Self.Bullet3.Parent.DoubleBuffered := true;
  Self.Bullet4.Parent.DoubleBuffered := true;
  Self.BossBullet.Parent.DoubleBuffered := true;
  EnemyBulletSpeed1:=0;
  EnemyBulletSpeed2:=0;
  st:=GetTickCount;
  ShipHP:=3;
  EnemyHP1:=3;
  EnemyHP2:=3;
  level[1]:=true;
  level[2]:=false;
  level[3]:=false;
  points:=15;
  EnemySpeed[1]:=-3;
  EnemySpeed[2]:=3;
  BossBulletSpeed:=0;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    39: begin
      if 20+ship.left+ship.width<clientwidth then shipspeed:=20;
    end;
    37: begin
     if -20+ship.left>0 then shipspeed:=-20;
    end;
  end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (key = 'z') and zcheat then points:= points - 10;  {Чит}

  if key = ' '  then
  begin
   if Bullet_Speed[1]=0 then Bullet_Speed[1]:=10
   else if Bullet_Speed[2]=0 then Bullet_Speed[2]:=10
   else if Bullet_Speed[3]=0 then Bullet_Speed[3]:=10
   else if Bullet_Speed[4]=0 then Bullet_Speed[4]:=10;
  end;

  if key = #27 then begin
     BulletTimer.Enabled:=false;
     SmartBullet.Enabled:=false;
     ShipMove.Enabled:=false;
     form1.Visible:=false;
     form2.Visible:=true;
  end;
end;

procedure TForm1.ShipMoveTimer(Sender: TObject);
begin
  if shipspeed <> 0 then
    if shipspeed>0 then dec(shipspeed)
    else if shipspeed<0 then inc(shipspeed);
  {Проверка не вылитет ли наш корабль за экран?}
  if (ship.Left+shipspeed<=form1.ClientWidth-ship.Width) and (ship.Left+shipspeed>=1)then form1.Ship.left:=form1.Ship.left+shipspeed;
end;

procedure TForm1.SmartBulletTimer(Sender: TObject);
begin
  if form1.Visible then begin
///////////////////////////////Первая умная ракета//////////////////////////////
    {Прилепляем умную ракету к боссу}
    if (SmartBullet1.Top>=Clientheight+100) then
    begin
      SmartBullet1.Top:=boss.top;
      SmartBullet1.Left:= boss.Left+boss.Width-SmartBullet1.Width;
    end;

    {Нацеливание}
    if SmartBulletSpeed1 <> 0 then
    begin
      SmartBullet1.Top:= SmartBullet1.Top+SmartBulletSpeed1;
      if SmartBullet1.Left+SmartBullet1.Width/2>ship.left+ ship.Width/2 then SmartBullet1.Left:= SmartBullet1.Left -1;
      if SmartBullet1.Left+SmartBullet1.Width/2<ship.left+ ship.Width/2 then SmartBullet1.Left:= SmartBullet1.Left +1;
     end;

    {Проверка на попадание в наш корабль}
    if (SmartBullet1.Top + SmartBullet1.Height >= ship.Top) and
    (SmartBullet1.Top <= ship.Top + ship.Height) and
    (SmartBullet1.Left +  SmartBullet1.Width >= ship.Left) and
    (SmartBullet1.Left <= ship.Left + ship.Width)  then
    begin
      Dec(ShipHP);
      SmartBullet1.Top:=boss.top;
      SmartBullet1.Left:= boss.Left+boss.Width-SmartBullet1.Width;
    end;
///////////////////////////////Первая умная ракета//////////////////////////////

    {Прилепляем умную ракету к боссу}
    if (SmartBullet2.Top>=Clientheight+100) then
    begin
      SmartBullet2.Top:=boss.top;
      SmartBullet2.Left:= boss.Left;
    end;

    {Нацеливание}
    if SmartBulletSpeed2 <> 0 then
    begin
      SmartBullet2.Top:= SmartBullet2.Top+SmartBulletSpeed2;
      if SmartBullet2.Left+SmartBullet2.Width/2>ship.left+ ship.Width/2 then SmartBullet2.Left:= SmartBullet2.Left -1;
      if SmartBullet2.Left+SmartBullet2.Width/2<ship.left+ ship.Width/2 then SmartBullet2.Left:= SmartBullet2.Left +1;
    end;

    {Проверка на попадание в наш корабль}
    if (SmartBullet2.Top + SmartBullet2.Height >= ship.Top) and
    (SmartBullet2.Top <= ship.Top + ship.Height) and
    (SmartBullet2.Left +  SmartBullet2.Width >= ship.Left) and
    (SmartBullet2.Left <= ship.Left + ship.Width)  then
    begin
      Dec(ShipHP);
      SmartBullet2.Top:=boss.top;
      SmartBullet2.Left:= boss.Left;
    end;
  end;
end;

end.
