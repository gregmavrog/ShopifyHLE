page 70004 "HLE Azure Storage Setup"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Azure Storage Setup';
    PageType = Card;
    SourceTable = "HLE Azure Storage Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Container Name"; Rec."Container Name")
                {
                    ToolTip = 'Specifies the value of the Container Name field.', Comment = '%';
                }
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.', Comment = '%';
                }
                field("Shared Acces Key ID"; Rec."Shared Acces Key ID")
                {
                    ToolTip = 'Specifies the value of the Shared Acces Key ID field.', Comment = '%';
                }
                field("Storage Account Name"; Rec."Storage Account Name")
                {
                    ToolTip = 'Specifies the value of the Storage Account Name field.', Comment = '%';
                }
                field("Shared Access Key"; SharedAccessKey)
                {
                    ToolTip = 'Specifies the value of the Shared Access Key field.', Comment = '%';

                    trigger OnValidate()
                    var
                        NewGuid: Guid;
                    begin
                        NewGuid := CreateGuid();
                        rec."Shared Acces Key ID" := NewGuid;
                        rec.Modify(true);
                        SaveSharedAccessKeyInIsolatedStorage(NewGuid, SharedAccessKey)
                    end;
                }
            }
        }
    }
    var
        SharedAccessKey: Text[100];

    trigger OnOpenPage()
    begin
        if rec.isEmpty() then begin
            rec.init();
            rec."Primary Key" := ' ';
            rec.Insert(true);
        end;

        Rec.Get();
        if IsolatedStorage.Get(rec."Shared Acces Key ID", DataScope::Company, SharedAccessKey) then
            SharedAccessKey := SharedAccessKey;
        CurrPage.UPDATE(true);

    end;

    local procedure SaveSharedAccessKeyInIsolatedStorage(NewGuid: Guid; SharedAccessKey: Text[100]): Guid;
    begin
        IsolatedStorage.Set(NewGuid, SharedAccessKey, DataScope::Company);
    end;
}
