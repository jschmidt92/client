class CfgSounds {
    sounds[] = {};
    class SOF_newMsg {
        name = "newMsg";
        sound[] = {QUOTE(PATHTOF(sounds\newMsg.ogg)), 2, 1};
        titles[] = {};
    };
    class SOF_msgSent {
        name = "msgSent";
        sound[] = {QUOTE(PATHTOF(sounds\woop.ogg)), 3, 1};
        titles[] = {};
    };
};