unit teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrDFe, Vcl.StdCtrls, CAPICOM_TLB;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
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
  Store : IStore3;
  Cert : ICertificate2;
  Certs : ICertificates2;
begin

     Store := CoStore.Create;

     Store.Open(CAPICOM_CURRENT_USER_STORE, 'MY', CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED);

     Try
        Certs := Store.Certificates as ICertificates2;
        Certs := Certs.Select('Selecione um Certificado','Selecione o Certificado que deseja utilizar:', false);

        If Not (Certs.Count = 0)  then Begin
           Cert := IInterface(Certs.Item[1]) as ICertificate2;
           Edit1.Text := Cert.SerialNumber;
        End;

        Except On E:Exception Do Begin
           //Quando o Usu?rio Cancela a Sele??o do Certificado, estava exibindo
           //mensagem da CAPICOM informando que n?o teve certificado selecionado
        End;
     End;



end;

end.
