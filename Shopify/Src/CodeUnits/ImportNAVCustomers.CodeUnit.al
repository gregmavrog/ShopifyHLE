codeunit 70001 "Import NAV Customers"
{
    procedure ImportCustomersFromNAV()
    var
        Base64Convert: Codeunit "Base64 Convert";
        HttpClient: HttpClient;
        HttpRequestMessage: HttpRequestMessage;
        HttpResponseMessage: HttpResponseMessage;
        RequestHeaders: HttpHeaders;
        ContentHeaders: HttpHeaders;
        Content: HttpContent;
        CustomerJson: Text;
        UserName, Password, ConcatenatedText, Base64CovertedText, ResponseText, BasicAuth : Text;
        CustomerRec: Record Customer;
        CustomerObject: JsonObject;
        CustomerArray: JsonArray;
        CustomerToken: JsonToken;
        CustomerValue: JsonValue;

        ConcatTok: Label '%1:%2', Locked = true;
        BasicTok: Label 'Basic %1', Locked = true;

        ErrorBuilder: TextBuilder;
        Url: Text;

    begin
        // Set the URL of the NAV 2017 OData web service
        Url := 'http://dynamics05.de-haske.com:8048/NAV2017-TEST/OData/Company(''Hal%20Leonard%20Distribution%20BV'')/TransDeliveryLines';
        Username := 'adm_mavrogeorgisg';
        Password :='!WelcometoHLE!6@';
      //  Password := 'mO+Bf/Hf4ts5G+h/RSuFEkFEtn4itKEtO7Bd8/Lg5js=';

        ConcatenatedText := StrSubstNo(ConcatTok, Username, Password);
        Base64CovertedText := Base64Convert.ToBase64(ConcatenatedText);
        BasicAuth := StrSubstNo(BasicTok, Base64CovertedText);
        BasicAuth:= 'Basic mO+Bf/Hf4ts5G+h/RSuFEkFEtn4itKEtO7Bd8/Lg5js=';
        RequestHeaders := HttpClient.DefaultRequestHeaders();
        if (RequestHeaders.Contains('Authorization')) then
            RequestHeaders.Remove('Authorization');
     //
        RequestHeaders.Add('Authorization',BasicAuth);

        // Set up the HTTP request
      /*   Content.GetHeaders(ContentHeaders);
        ContentHeaders.Add('Content-Type', 'application/json');
        if ()
        ContentHeaders.Add('Authorization', 'Basic ' + EncodeBase64(Username + ':' + Password));
 */

       if not HttpClient.Get(Url, HttpResponseMessage) then begin
            HttpResponseMessage.Content().ReadAs(ResponseText);
            error('Failed to connect to NAV 2017 OData web service. : %1', ResponseText);
       end;

        // Check the response status
        if not HttpResponseMessage.IsSuccessStatusCode() then begin
            ErrorBuilder.Clear();
            ErrorBuilder.AppendLine('The request to the NAV 2017 OData web service failed.');
            ErrorBuilder.Append('Status code :');
            ErrorBuilder.AppendLine(Format(HttpResponseMessage.HttpStatusCode()));
            ErrorBuilder.Append('Descroption :');
            ErrorBuilder.AppendLine(HttpResponseMessage.ReasonPhrase());
            error(ErrorBuilder.ToText());
        end;

        /*    HttpResponseMessage.Content.ReadAs(CustomerJson);
           JsonArray.ReadFrom(CustomerJson);

           // Loop through the JSON array and insert customers
           foreach CustomerToken in CustomerArray do
               if (CustomerToken.IsObject()) then begin
                   CustomerRec.Init();
                   if not CustomerObject.Get(name,CustomerToken)
                   CustomerRec."No." := JsonObject.Get('No.',JsonToken).   AsText();
                   CustomerRec.Name := JsonObject.Get('name').AsText();
                   CustomerRec.Address := JsonObject.Get('Address').AsText();
                   CustomerRec.City := JsonObject.Get('City').AsText();
                   CustomerRec."Post Code" := JsonObject.Get('Post Code').AsText();
                   CustomerRec."Country/Region Code" := JsonObject.Get('Country/Region Code').AsText();
                   CustomerRec.Insert();
               end;
       end else begin
               Error('Failed to retrieve customers from NAV 2017: %1', HttpResponseMessage.HttpStatusCode());
           end; */
    end;
}