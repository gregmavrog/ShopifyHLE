 page 70003 "HLE Customer API"
{
    PageType = API;
    APIPublisher = 'GMSOFT';
    APIGroup = 'Shopify';
    APIVersion = 'v1.0';
    EntityName = 'Customer';
    EntitySetName = 'Customers';
    SourceTable = Customer;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(no; rec."No.")
                {
                    Caption = 'Customer Number';
                }
                field(name; rec.Name)
                {
                    Caption = 'Name';
                }
                field(address; rec.Address)
                {
                    Caption = 'Address';
                }
                field(city; rec.City)
                {
                    Caption = 'City';
                }
                field(postCode; rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(countryRegionCode; rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
            }
        }
    }
}