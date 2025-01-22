codeunit 70000 FileShare
{
    procedure WriteFileToShare(StorageAccount: Text; FileShare: text; Authorization: Interface "Storage Service Authorization"; FilePath: Text; FileContent: InStream)
    var
        AFSFileClient: Codeunit "AFS File Client";
        AFSOperationResponse: Codeunit "AFS Operation Response";
    begin
        AFSFileClient.Initialize(StorageAccount, FileShare, Authorization);
        AFSOperationResponse := AFSFileClient.CreateFile(FilePath, FileContent);
        if not AFSOperationResponse.IsSuccessful() then
            Error(AFSOperationResponse.GetError());

        AFSOperationResponse := AFSFileClient.PutFileStream(filePath, FileContent);
        if not AFSOperationResponse.IsSuccessful() then
            Error(AFSOperationResponse.GetError());
    end;

    procedure GetFileFromStorage(StorageAccount: Text; FileShare: text; Authorization: Interface "Storage Service Authorization"; FilePath: Text)
    var
        AFSFileClient: Codeunit "AFS File Client";
        AFSOperationResponse: Codeunit "AFS Operation Response";
        FileContents: InStream;
    begin
        AFSFileClient.Initialize(StorageAccount, FileShare, Authorization);
        AFSOperationResponse := AFSFileClient.GetFileAsStream(FilePath, FileContents);
        if not AFSOperationResponse.IsSuccessful() then
            Error(AFSOperationResponse.GetError());

    end;
}
