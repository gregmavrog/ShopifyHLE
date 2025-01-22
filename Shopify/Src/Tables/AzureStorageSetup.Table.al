table 70002 "HLE Azure Storage Setup"
{
    Caption = 'Azure Storage Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Storage Account Name"; Text[50])
        {
            Caption = 'Storage Account Name';
        }
        field(3; "Shared Acces Key ID"; Guid)
        {
            Caption = 'Shared Acces Key ID';
        }
        field(4; "Container Name"; Text[50])
        {
            Caption = 'Container Name';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
