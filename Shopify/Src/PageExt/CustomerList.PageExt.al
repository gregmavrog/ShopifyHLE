pageextension 70003 "Customer List" extends "Customer List"
{
    actions
    {
        addafter("C&ontact")
        {
            action("Import Customers")
            {
                Caption = 'Import Customers';
                ApplicationArea = Basic, Suite;
                Image = Import;
                ToolTip = 'Import Customers from NAV';
                trigger OnAction()
                var
                    ImportCustomers: Codeunit "Import NAV Customers";
                begin
                    ImportCustomers.ImportCustomersFromNAV();
                end;
            }
        }
    }
}
