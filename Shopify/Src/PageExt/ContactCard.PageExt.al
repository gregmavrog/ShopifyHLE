pageextension 70001 "HLE Contact Card" extends "Contact Card"
{
    layout
    {
        addafter(Communication)
        {
            group(Financial)
            {
                Caption = 'Financial';
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
        }
        addafter("Registration Number")
        {
            field("HLE Emailing No"; Rec."HLE Emailing No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HLE Emailing No field.', Comment = '%';
            }
        }

    }
}
