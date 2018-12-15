unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }
 Tislem = (bos,toplama,cikarma,bolme,carpma);
  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    bolme: TButton;
    Button13: TButton;
    esit: TButton;
    carpma: TButton;
    Button2: TButton;
    Button3: TButton;
    toplama: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    cikarma: TButton;
    Button9: TButton;
    sonuc_ekran: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure toplamaClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  ekran_temizle:boolean = false;
  temp_sayi : real = 0;
  islem : Tislem = bos;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (strtofloat(sonuc_ekran.Text) = 0 ) or (ekran_temizle = true) then
  begin
    sonuc_ekran.Text:=tbutton(sender).Caption ;
    ekran_temizle:=false;
  end
  else  begin
  sonuc_ekran.Text:=sonuc_ekran.Text+ tbutton(sender).Caption;
  end;
end;

procedure TForm1.toplamaClick(Sender: TObject);
begin
  if islem = tislem.toplama then
    sonuc_ekran.Text:=floattostr(temp_sayi+ strtofloat(sonuc_ekran.Text));

  if islem = tislem.cikarma then
    sonuc_ekran.Text:=floattostr(temp_sayi- strtofloat(sonuc_ekran.Text));

  if islem = tislem.carpma then
    sonuc_ekran.Text:=floattostr(temp_sayi* strtofloat(sonuc_ekran.Text));

  if islem = tislem.bolme then
    sonuc_ekran.Text:=floattostr(temp_sayi/ strtofloat(sonuc_ekran.Text));

  temp_sayi:=strtofloat(sonuc_ekran.text);
  ekran_temizle := true;
  if TButton(sender).Name = 'toplama' then   islem := tislem.toplama;
  if TButton(sender).Name = 'cikarma' then   islem := tislem.cikarma;
  if TButton(sender).Name = 'carpma' then   islem := tislem.carpma;
  if TButton(sender).Name = 'bolme' then   islem := tislem.bolme;
  if TButton(sender).Name = 'esit' then   islem := bos;

end;

end.

