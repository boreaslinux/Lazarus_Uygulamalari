unit unt_anaform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Menus, ExtCtrls, ShellCtrls, SynEdit, SynHighlighterPas;

type

  { TForm1 }

  TForm1 = class(TForm)
    ImageList1: TImageList;
    dlg_ac: TOpenDialog;
    dlg_kaydet: TSaveDialog;
    ImageList2: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    ShellListView1: TShellListView;
    ShellTreeView1: TShellTreeView;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    editor: TSynEdit;
    SynFreePascalSyn1: TSynFreePascalSyn;
    SynPasSyn1: TSynPasSyn;
    ToolBar1: TToolBar;
    btn_yeni: TToolButton;
    btn_ac: TToolButton;
    btn_kaydet: TToolButton;
    procedure btn_acClick(Sender: TObject);
    procedure btn_kaydetClick(Sender: TObject);
    procedure btn_yeniClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ShellListView1DblClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btn_yeniClick(Sender: TObject);
begin
  editor.Lines.Clear;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  {$IFDEF UNIX}
  ShellTreeView1.Root:='/home';
  {$ENDIF}

  {$IFDEF WINDOWS}
    ShellTreeView1.Root:='c:\';
  {$ENDIF}

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.ShellListView1DblClick(Sender: TObject);
begin
 if dlg_ac.Execute then
 editor.Lines.LoadFromFile((ShellListView1.GetPathFromItem(ShellListView1.Selected)));
end;

procedure TForm1.btn_acClick(Sender: TObject);
begin
  if dlg_ac.Execute then editor.Lines.LoadFromFile(dlg_ac.FileName);
end;

procedure TForm1.btn_kaydetClick(Sender: TObject);
begin
  if dlg_kaydet.Execute then editor.Lines.SaveToFile(dlg_kaydet.FileName);
end;

end.

