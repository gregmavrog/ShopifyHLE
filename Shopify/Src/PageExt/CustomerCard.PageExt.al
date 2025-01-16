pageextension 70000 "Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(GLN)
        {
            field("HLE Chamber of Commerce number"; Rec."HLE Chamber of Commerce number")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE Chamber of Commerce number field.', Comment = '%';
            }
            field("HLE Chamber of Commerce in"; Rec."HLE Chamber of Commerce in")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE Chamber of Commerce in field.', Comment = '%';
            }
        }
        addafter("Disable Search by Name")
        {
            field("HLE Emailing No"; Rec."HLE Emailing No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE Emailing No field.', Comment = '%';
            }
        }
        addafter("Home Page")
        {
            field("HLE B2C Customer"; Rec."HLE B2C Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE B2C Customer field.', Comment = '%';
            }
        }
        addafter("Shipping Advice")
        {
            field("HLE No shipping costs"; Rec."HLE No shipping costs")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE No shipping costs field.', Comment = '%';
            }
            field("HLE Dealer Type";Rec."HLE Dealer Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE Dealer Type field.', Comment = '%';
            }
        }

        addbefore("Last Date Modified")
        {
            field("HLE Reason for blocked account";Rec."HLE Reason for blocked account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE Reason for blocked account field.', Comment = '%';
            }
            field("HLE Reasoncode blocked account";Rec."HLE Reasoncode blocked account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE Reasoncode blocked account field.', Comment = '%';
            }
        }
    }

}

