unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, fpexprpars, Graphics, Dialogs, StdCtrls,
  TAGraph, TASeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Edit1: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
var
  fparser:TFPExpressionParser;
  i:integer;
  formul: String;
begin
  if key = #13 then  begin
fparser:=TFPExpressionParser.Create(self);
fparser.BuiltIns:= [bcMath];
Chart1LineSeries1.Clear;
for i :=0 to 1000 do
begin
  formul:= StringReplace(edit1.text,'x',inttostr(i),[rfIgnoreCase,rfReplaceAll]);
  fparser.Expression := formul;
  Chart1LineSeries1.AddY(ArgToFloat(fparser.Evaluate));

end;
fparser.free;
  end;
end;

end.

