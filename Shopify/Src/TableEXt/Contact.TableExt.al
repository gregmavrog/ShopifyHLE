tableextension 70001 Contact extends Contact
{
    fields
    {
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
       field(70004; "HLE Emailing No"; Boolean)
        {
            Caption = 'Emailing No';
            DataClassification = CustomerContent;
        }
    }
}
