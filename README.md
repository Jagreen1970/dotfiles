# dotfiles
My dotfiles

## Install Alacritty (MacOS)

```sh
brew install alacritty
sudo xattr -d com.apple.quarantine /Applications/Alacritty.app                   
```

## Alacritty themes

Clone the alacritty-theme repository, or download the theme of your choice:

```sh
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

Add an import to your `alacritty.yml` (Replace `{theme}` with your desired
colorscheme):

```yaml
import:
 - ~/.config/alacritty/themes/themes/{theme}.yaml
```

## p10k for the looks

https://github.com/SourceXSL/powerlevel10k

## Fonts for p10k

On Macs, sometimes the fonts get lost after updates... :-/

To reinstall, see: https://github.com/SourceXSL/powerlevel10k/blob/master/font.md
