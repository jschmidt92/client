// [DirName, parentId] call sof_client_os_fnc_addDir;
_dirName = _this select 0;
_parentId = _this select 1;
_success = "Successfully created the dir.";

if (count (toArray _dirName) > 0) then {
    _newId = count SOF_FileSystem;
    // name, id, parent id, children, isdir?
    _newDir = [_dirName, _newId, _parentId, [], 1];

    // beim parent einspeichern
    (SOF_FileSystem select _parentId) set [count(SOF_FileSystem select _parentId), _newId];
    SOF_FileSystem set [count SOF_FileSystem, _newDir];
} else {
    _success = "Could not create the directory: No name given";
};

_return = _success;