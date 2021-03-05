unit teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrDFe, ACBrNF3e,
  Vcl.StdCtrls, CAPICOM_TLB;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ACBrNF3e1: TACBrNF3e;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
  i : integer;
  Store : IStore3;
  Cert : ICertificate2;
  Certs : ICertificates2;
begin
     Store := CoStore.Create;

     if OpenDialog1.Execute then Begin
        Store.Open(CAPICOM_CURRENT_USER_STORE, 'My', CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED);
        Edit1.Text := Cert.SerialNumber;
     End;





//    Edit1.Text := ACBrNF3e1.SSL.SelecionarCertificado;
end;

end.
