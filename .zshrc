# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jsoares/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /home/jsoares/.sdkman/bin/sdkman-init.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias ll='ls -lhA'
alias starti3='nohup i3 &'
alias setclip='xclip -selection c'
alias getclip='xclip -selection c -o'
alias vim='nvim'
alias vi='nvim'
zip_folder() {
	echo Zipping dir \'$1\'...
	fileName=${1%/}.zip
	zip -r $fileName $1
}

upload_file() {
	echo Uploading file \'$1\'...
	apikey=$FILES_PH_API_KEY

	if [ -z "$apikey" ]; then
		echo "No api key set"
		echo "Perform 'export FILES_PH_API_KEY=YOU API KEY"
		return
	fi

	result=$(curl --progress-bar -F "file=@$1" -H "API-KEY: $apikey" "https://files.perpheads.com/upload" | jq --raw-output ".link")
	link="https://files.perpheads.com/$result"
	# Stop if failed to upload
	if [ $? -ne 0 ]; then
	  return
	fi
	echo $link | xclip -selection c
	echo -e Uploaded to $link.\\nLink copied to clipboard
}

upload_to_ph() {
	# Check if files exist
	for ((i=1;i<=$#;i++)); do
		if [ ! -f ${!i} ] && [ ! -d ${!i} ]; then
			echo File \'${!i}\' not found
			return
		fi
	done;

	for ((i=1;i<=$#;i++)); do
		if [ -f ${!i} ]; then
			upload_file ${!i}
		elif [ -d ${!i} ]; then
			zip_folder ${!i}
			upload_file $fileName
			echo Removing temporary zip file $fileName...
			rm $fileName
		fi
	done;
}


screenshot_and_upload() {
	folder=$HOME/Pictures/Screenshots
	mkdir -p $folder
	filename=$(date +"%Y-%m-%d-%H%M%S").jpg
	filepath="$folder/$filename"
	
	if [ $# -eq 1 ] && [ $1 == "-c" ]; then
		scrot -f -s -q 90 $filepath
	else
		scrot -f -q 90 $filepath
	fi

	# Stop if scrot does not take screenshot
	if [ $? -ne 0 ]; then
	  return
	fi

	upload $filepath
}

alias upload="upload_to_ph"
alias prtscr="screenshot_and_upload"
