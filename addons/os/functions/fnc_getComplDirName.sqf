// [dirId] call sof_client_os_fnc_getComplDirName
_dirId = _this select 0;
_dir = SOF_FileSystem select _dirId;

while { _dir select 1 != _dir select 2 } do {
    _parentDir = SOF_FileSystem select (_dir select 2);
    _fullPath = format ["%2\%1", _fullPath, _parentDir select 0];
    _dir = _parentDir;
};

_fullPath;