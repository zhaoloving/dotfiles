import XMonad
import XMonad.Config.Gnome

main = do
    xmonad $ myConfig

myConfig = gnomeConfig {
    terminal = "terminator"
}
