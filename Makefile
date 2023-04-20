# ai-hayasaka.zsh-theme Makefile
#   @copyright None
#   @author Matthieu GOSSET
#   @maintainers
#     Matthieu GOSSET <matthieu.gosset.dev@outlook.com>
#   @purpose `make install`
#   @usage
#     Tested on `Fedora 38`.
#     Tested with terminal theme of VSCode using `IBM Carbon Color Theme`

.PHONY: install set all clean
.SECONDEXPANSION:

ZSH_CUSTOM?=~/.oh-my-zsh/custom

all: install set

$(ZSH_CUSTOM)/ai-hayasaka.zsh-theme:
	ln ai-hayasaka.zsh-theme $(ZSH_CUSTOM)/ai-hayasaka.zsh-theme

install: $(ZSH_CUSTOM)/ai-hayasaka.zsh-theme
	echo "Linking done."

reinstall: clean install

# OMZ CMD SEEMS NOT TO BE ACCESSIBLE...
set:
	echo "Use following command to set it up:"
	echo "\tomz theme set ai-hayasaka"
	echo "Use following command to update prompt:"
	echo "\tsource ~/.zshrc"

clean:
	rm $(ZSH_CUSTOM)/ai-hayasaka.zsh-theme