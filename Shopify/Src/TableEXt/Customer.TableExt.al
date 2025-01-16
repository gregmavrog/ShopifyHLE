tableextension 70000 Customer extends Customer
{
    fields
    {
        field(70000; "HLE B2C Customer"; Boolean)
        {
            Caption = 'B2C Customer';
            DataClassification = ToBeClassified;
        }
        field(70001; "HLE Chamber of Commerce number"; Code[20])
        {
            Caption = 'Chamber of Commerce number';
            DataClassification = ToBeClassified;
        }
        field(70002; "HLE Chamber of Commerce in"; Text[100])
        {
            Caption = 'Chamber of Commerce in';
            DataClassification = ToBeClassified;
        }
        field(70003; "HLE Dealer Type"; Code[20])
        {
            Caption = 'Dealer Type';
            DataClassification = ToBeClassified;
            TableRelation = "HLE Dealer Type"."Code";
        }
        field(70004; "HLE Emailing No"; Boolean)
        {
            Caption = 'Emailing No';
            FieldClass = FlowField;
            CalcFormula = lookup(Contact."HLE Emailing No" where("No." = field("No.")));
            Editable =  false;
        }
        field(70005; "HLE Last Order Date"; Date)
        {
            Caption = 'Last Order Date';
            DataClassification = ToBeClassified;
        }
        field(70007; "HLE No shipping costs"; Boolean)
        {
            Caption = 'No shipping costs';
            DataClassification = ToBeClassified;
        }
        field(70008; "HLE Reason for blocked account"; Enum "Customer Block")
        {
            Caption = 'Reason for blocked account';
            DataClassification = ToBeClassified;
        }
        field(70009; "HLE Reasoncode blocked account"; Code[20])
        {
            Caption = 'Reasoncode blocked account';
            DataClassification = ToBeClassified;
            TableRelation = "HLE Blocked Customer"."Code";
        }
    }
}
