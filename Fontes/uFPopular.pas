unit uFPopular;

interface
Type
    TFPopular = class
    private
       FCNPJEmpresa : string;
       FLoginEmpresa: string;
       FSenhaEmpresa: string;
       FHambiente: string;
       FID_Prevenda : Integer;
       FID_Venda : Integer;
    public
       property CNPJEmpresa: string read FCNPJEmpresa write FCNPJEmpresa;
       property LoginEmpresa: String read FLoginEmpresa write FLoginEmpresa;
       property SenhaEmpresa: String read FSenhaEmpresa write FSenhaEmpresa;
       property Hambiente: String read FHambiente write FHambiente;
       property ID_Prevenda: Integer read FID_Prevenda write FID_Prevenda;
       property ID_Venda :Integer read FID_Venda write FID_Venda;
    End;

implementation

end.
