// [fileName] call sof_client_os_fnc_getFileWName
params ["_fileName"];
_fileName = _this select 0;
_fileId = -1;
_toFindFile = [];

_allCurFiles = SOF_CurrentDir select 3;

{
    _curFile = SOF_FileSystem select _x;
    if ((_curFile) select 0 == _fileName) then {
        _fileId = _curFile select 1;
        _toFindFile = _curFile;
    };
} forEach _allCurFiles;

_toFindFile;