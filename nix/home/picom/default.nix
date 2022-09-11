{ ... }:

{
  services.picom = {
    enable = true;
    fade = true;
    fadeDelta = 4;
    # These two together use the experimental xrender backend, which should
    # help solve screen tearing issues on X11.
    experimentalBackends = true;
    vSync = true;
    opacityRules = [
      "95:class_g = 'Kitty' && !_NET_WM_STATE@:32a"
      "0:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_HIDDEN'"
      "0:_NET_WM_STATE@[1]:32a = '_NET_WM_STATE_HIDDEN'"
      "0:_NET_WM_STATE@[2]:32a = '_NET_WM_STATE_HIDDEN'"
      "0:_NET_WM_STATE@[3]:32a = '_NET_WM_STATE_HIDDEN'"
      "0:_NET_WM_STATE@[4]:32a = '_NET_WM_STATE_HIDDEN'"
    ];
  };
}
