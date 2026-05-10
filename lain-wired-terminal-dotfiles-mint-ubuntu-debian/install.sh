#!/usr/bin/env bash
set -e

# =============================================================================
# lain-wired-terminal-dotfiles-mint-ubuntu-debian Installer
# For Linux Mint / Ubuntu / Debian based distributions
# =============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# =============================================================================
# Anime Stuff
# =============================================================================

rainbow() {
    if command -v lolcat >/dev/null 2>&1; then
        lolcat -F 0.3 -S "$(date +%s)"
    else
        cat
    fi
}

anime_quote() {
    local quotes=(
        "Present day, present time... Ha ha ha ha ha!"
        "Everyone is connected."
        "The Wired is just another world."
        "I am who I am. I am myself."
        "No matter where you go, everyone's connected."
        "Get in the robot, Shinji!"
        "I mustn't run away..."
        "Omedetou."
        "The world is not beautiful, therefore it is."
        "See you, space cowboy..."
        "Bang."
        "The net is vast and infinite."
        "Stand Alone Complex."
        "All hail Britannia!"
        "People who can't throw something important away, can never hope to change anything."
        "A lesson without pain is meaningless."
        "Tuurrururururururu... ~"
        "Omae wa mou shindeiru."
        "NANI?!"
        "This is... Requiem."
        "I love Emilia."
        "Eren... tatakae."
        "Pilkunussija!"
        " Installing... Installing... COMPLETE."
        "Protocol 3: Protect the Pilot."
    )
    local idx=$(( RANDOM % ${#quotes[@]} ))
    echo "  ${MAGENTA}「${quotes[$idx]}」${NC}"
}

print_stage() {
    local num="$1"
    local total="$2"
    local title="$3"
    local subtitle="$4"

    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}  [${num}/${total}]${NC} ${GREEN}${title}${NC}"
    if [[ -n "$subtitle" ]]; then
        echo -e "${BLUE}  ${subtitle}${NC}"
    fi
    anime_quote
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

print_header() {
    echo ""
    echo -e "${MAGENTA}"
    cat <<'ASCII' | rainbow
          _..--¯¯¯¯--.._
      ,-''              `-.
    ,'                     `.
   ,                         \
  /                           \
 /          ′.                 \
'          /  ││                ;
;       n /│  │/         │      │
│      / v    /\/`-'v√\'.│\     ,
:    /v`,———         ————.^.    ;
'   │  /′@@`,        ,@@ `\│    ;
│  n│  '.@@/         \@@  /│\  │;
` │ `    ¯¯¯          ¯¯¯  │ \/││
 \ \ \                     │ /\/
 '; `-\          `′       /│/ │′
  `    \       —          /│  │
   `    `.              .' │  │
    v,_   `;._     _.-;    │  /
       `'\│-_`'-''__/^'^' │ │
              ¯¯¯¯¯        │ │
    ____ ____ ____ ____    │ /
   ||l |||a |||i |||n ||   ││
   ||__|||__|||__|||__||   ││
   |/__\|/__\|/__\|/__\|   │,
ASCII
    echo -e "${NC}"
    echo -e "${GREEN}      「 MINT TERMINAL CONFIGS — Wired Edition 」${NC}"
    echo -e "${BLUE}         Terminal Environment Installer for Linux Mint / Ubuntu / Debian${NC}"
    echo ""
}

detect_os() {
    print_stage "0" "10" "Initializing Protocol..." "Scanning the Wired for OS signature..."

    if [[ -f /etc/os-release ]]; then
        # shellcheck source=/dev/null
        . /etc/os-release
        OS_NAME="${NAME:-Unknown}"
        OS_ID="${ID:-unknown}"
        OS_LIKE="${ID_LIKE:-}"
    else
        OS_NAME="Unknown"
        OS_ID="unknown"
        OS_LIKE=""
    fi

    echo -e "${BLUE}  Detected OS:${NC} ${OS_NAME}"
    echo ""

    if [[ "$OS_ID" != "linuxmint" && "$OS_ID" != "ubuntu" && "$OS_ID" != "debian" && "$OS_LIKE" != *"debian"* && "$OS_LIKE" != *"ubuntu"* ]]; then
        echo -e "${YELLOW}  ⚠ Warning: This installer is optimized for Debian-based distributions.${NC}"
        echo -e "${YELLOW}    But the Wired connects everyone... Continuing anyway...${NC}"
        echo ""
    fi
}

# =============================================================================
# Package Installation
# =============================================================================

install_packages() {
    print_stage "1" "10" "Downloading from the Wired..." "sudo apt update && install base packages"
    sudo apt update || true
    echo ""

    print_stage "2" "10" "Summoning Dependencies..." "Installing tools from another dimension"
    sudo apt install -y \
        git curl wget \
        tmux zsh alacritty \
        ripgrep fd-find fzf zoxide lolcat \
        fonts-noto-color-emoji \
        fontconfig \
        xsel xclip \
        build-essential \
        2>/dev/null || true

    # Install eza
    if ! command -v eza &>/dev/null; then
        echo -e "${YELLOW}  -> Summoning eza from the shadow realm...${NC}"
        sudo apt install -y eza 2>/dev/null || {
            echo -e "${YELLOW}  -> eza not in repos, installing from GitHub deb...${NC}"
            local eza_deb
            eza_deb="$(curl -s https://api.github.com/repos/eza-community/eza/releases/latest | grep -oP '"browser_download_url": "\K[^"]*x86_64-unknown-linux-gnu\.deb[^"]*' | head -1)"
            if [[ -n "$eza_deb" ]]; then
                curl -Lo /tmp/eza.deb "$eza_deb" 2>/dev/null && sudo dpkg -i /tmp/eza.deb 2>/dev/null || true
                rm -f /tmp/eza.deb
            fi
        }
    fi

    # Install bat
    if ! command -v batcat &>/dev/null && ! command -v bat &>/dev/null; then
        echo -e "${YELLOW}  -> Summoning bat...${NC}"
        sudo apt install -y bat 2>/dev/null || true
    fi
    if command -v batcat &>/dev/null && ! command -v bat &>/dev/null; then
        sudo ln -sf "$(command -v batcat)" /usr/local/bin/bat 2>/dev/null || true
    fi

    # Install fastfetch
    if ! command -v fastfetch &>/dev/null; then
        echo -e "${YELLOW}  -> Summoning fastfetch...${NC}"
        sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch 2>/dev/null || true
        sudo apt update 2>/dev/null || true
        sudo apt install -y fastfetch 2>/dev/null || {
            echo -e "${YELLOW}  -> fastfetch PPA failed, trying direct deb...${NC}"
            local ff_deb
            ff_deb="$(curl -s https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest | grep -oP '"browser_download_url": "\K[^"]*linux-amd64\.deb[^"]*' | head -1)"
            if [[ -n "$ff_deb" ]]; then
                curl -Lo /tmp/fastfetch.deb "$ff_deb" 2>/dev/null && sudo dpkg -i /tmp/fastfetch.deb 2>/dev/null || true
                rm -f /tmp/fastfetch.deb
            fi
        }
    fi

    # Install lazygit
    if ! command -v lazygit &>/dev/null; then
        echo -e "${YELLOW}  -> Summoning lazygit...${NC}"
        local LAZYGIT_VERSION
        LAZYGIT_VERSION="$(curl -s 'https://api.github.com/repos/jesseduffield/lazygit/releases/latest' | grep -Po '"tag_name": *"v\K[^"]*')"
        if [[ -n "$LAZYGIT_VERSION" ]]; then
            curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" 2>/dev/null || true
            if [[ -f /tmp/lazygit.tar.gz ]]; then
                tar xf /tmp/lazygit.tar.gz -C /tmp lazygit 2>/dev/null || true
                sudo install /tmp/lazygit /usr/local/bin 2>/dev/null || true
                rm -f /tmp/lazygit.tar.gz /tmp/lazygit
            fi
        fi
    fi

    echo ""
}

# =============================================================================
# Fonts
# =============================================================================

install_fonts() {
    print_stage "3" "10" "Summoning Glyphs..." "Downloading Nerd Fonts from another dimension"
    mkdir -p "$HOME/.local/share/fonts"
    local NERD_FONTS_DIR="$HOME/.local/share/fonts"

    # FiraCode Nerd Font
    if [[ ! -f "$NERD_FONTS_DIR/FiraCodeNerdFont-Regular.ttf" ]]; then
        echo -e "${YELLOW}  -> Downloading FiraCode Nerd Font...${NC}"
        curl -fLo /tmp/FiraCode.tar.xz \
            "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.tar.xz" \
            2>/dev/null || true
        if [[ -f /tmp/FiraCode.tar.xz ]]; then
            tar -xf /tmp/FiraCode.tar.xz -C "$NERD_FONTS_DIR" 2>/dev/null || true
            rm -f /tmp/FiraCode.tar.xz
            echo -e "${GREEN}  -> FiraCode Nerd Font installed${NC}"
        else
            echo -e "${RED}  -> Failed to download FiraCode Nerd Font${NC}"
        fi
    else
        echo -e "${GREEN}  -> FiraCode Nerd Font already installed${NC}"
    fi

    # Symbols Nerd Font
    if [[ ! -f "$NERD_FONTS_DIR/SymbolsNerdFont-Regular.ttf" ]]; then
        echo -e "${YELLOW}  -> Downloading Symbols Nerd Font...${NC}"
        curl -fLo /tmp/NerdFontsSymbolsOnly.tar.xz \
            "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.tar.xz" \
            2>/dev/null || true
        if [[ -f /tmp/NerdFontsSymbolsOnly.tar.xz ]]; then
            tar -xf /tmp/NerdFontsSymbolsOnly.tar.xz -C "$NERD_FONTS_DIR" 2>/dev/null || true
            rm -f /tmp/NerdFontsSymbolsOnly.tar.xz
            echo -e "${GREEN}  -> Symbols Nerd Font installed${NC}"
        else
            echo -e "${RED}  -> Failed to download Symbols Nerd Font${NC}"
        fi
    else
        echo -e "${GREEN}  -> Symbols Nerd Font already installed${NC}"
    fi

    fc-cache -fv "$NERD_FONTS_DIR" >/dev/null 2>&1 || true
    echo ""
}

# =============================================================================
# Neovim
# =============================================================================

install_neovim() {
    print_stage "4" "10" "Booting into the Nerve..." "Installing Neovim (AppImage >= 0.11)"
    local NVIM_APPIMAGE="$HOME/.local/bin/nvim"
    mkdir -p "$HOME/.local/bin"

    if [[ ! -f "$NVIM_APPIMAGE" ]] || ! "$NVIM_APPIMAGE" --version 2>/dev/null | grep -q "NVIM v0.11"; then
        echo -e "${YELLOW}  -> Downloading Neovim AppImage...${NC}"
        curl -Lo /tmp/nvim.appimage \
            "https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage" \
            2>/dev/null || true
        if [[ -f /tmp/nvim.appimage ]]; then
            chmod u+x /tmp/nvim.appimage
            cp /tmp/nvim.appimage "$NVIM_APPIMAGE"
            rm -f /tmp/nvim.appimage
            echo -e "${GREEN}  -> Neovim AppImage installed to $NVIM_APPIMAGE${NC}"
        else
            echo -e "${RED}  -> Failed to download Neovim AppImage, falling back to apt...${NC}"
            sudo apt install -y neovim
        fi
    else
        echo -e "${GREEN}  -> Neovim already installed${NC}"
    fi

    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
        export PATH="$HOME/.local/bin:$PATH"
    fi
    echo ""
}

# =============================================================================
# Oh My Zsh
# =============================================================================

install_ohmyzsh() {
    print_stage "5" "10" "Summoning the Shell Spirit..." "Installing Oh My Zsh"
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        echo -e "${YELLOW}  -> Running Oh My Zsh installer...${NC}"
        RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo -e "${GREEN}  -> Oh My Zsh installed${NC}"
    else
        echo -e "${GREEN}  -> Oh My Zsh already installed${NC}"
    fi
    echo ""
}

install_zsh_plugins() {
    print_stage "6" "10" "Gathering Spirits..." "Installing Zsh plugins (powerlevel10k, autosuggestions, syntax-highlighting)"
    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]]; then
        echo -e "${YELLOW}  -> Cloning powerlevel10k...${NC}"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k" 2>/dev/null || true
    else
        echo -e "${GREEN}  -> powerlevel10k already installed${NC}"
    fi

    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
        echo -e "${YELLOW}  -> Cloning zsh-autosuggestions...${NC}"
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null || true
    else
        echo -e "${GREEN}  -> zsh-autosuggestions already installed${NC}"
    fi

    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
        echo -e "${YELLOW}  -> Cloning zsh-syntax-highlighting...${NC}"
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null || true
    else
        echo -e "${GREEN}  -> zsh-syntax-highlighting already installed${NC}"
    fi

    echo ""
}

# =============================================================================
# Tmux
# =============================================================================

install_tpm() {
    print_stage "7" "10" "Establishing Connections..." "Installing TPM (Tmux Plugin Manager)"
    if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" 2>/dev/null || true
        echo -e "${GREEN}  -> TPM installed${NC}"
    else
        echo -e "${GREEN}  -> TPM already installed${NC}"
    fi
    echo ""
}

install_tmux_plugins() {
    print_stage "7.5" "10" "Synchronizing Protocols..." "Installing tmux plugins automatically"
    local TPM_DIR="$HOME/.tmux/plugins/tpm"
    local TPM_BIN="$TPM_DIR/bin/install_plugins"

    if [[ -f "$TPM_BIN" ]]; then
        echo -e "${YELLOW}  -> Running TPM plugin installation...${NC}"
        tmux new-session -d -s __tmp_tpm_install__ 2>/dev/null || true
        sleep 1
        tmux run-shell "$TPM_BIN" 2>/dev/null || true
        sleep 3
        tmux kill-session -t __tmp_tpm_install__ 2>/dev/null || true
        echo -e "${GREEN}  -> Tmux plugins installed${NC}"
    else
        echo -e "${YELLOW}  -> TPM not found, skipping auto-installation.${NC}"
        echo -e "${YELLOW}     After starting tmux, press 'Prefix + I' to install plugins.${NC}"
    fi
    echo ""
}

# =============================================================================
# Backup
# =============================================================================

backup_configs() {
    print_stage "8" "10" "Creating Backup Copies..." "Saving your reality to the Wired"
    local BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$BACKUP_DIR"

    local items=(
        "$HOME/.zshrc"
        "$HOME/.p10k.zsh"
        "$HOME/.aliases"
        "$HOME/.config/alacritty"
        "$HOME/.config/tmux"
        "$HOME/.config/nvim"
        "$HOME/.config/fontconfig"
    )

    for cfg in "${items[@]}"; do
        if [[ -e "$cfg" ]]; then
            cp -r "$cfg" "$BACKUP_DIR/" 2>/dev/null || true
        fi
    done

    echo -e "${GREEN}  -> Backups saved to $BACKUP_DIR${NC}"
    echo ""
}

# =============================================================================
# Config Installation
# =============================================================================

install_configs() {
    print_stage "9" "10" "Rewriting Reality..." "Installing Alacritty, Tmux, Neovim, Fontconfig, Zsh configs"

    # Alacritty
    echo -e "${YELLOW}  -> Installing Alacritty config...${NC}"
    mkdir -p "$HOME/.config/alacritty"
    cp "$DOTFILES_DIR/alacritty/alacritty.toml" "$HOME/.config/alacritty/"

    # Tmux
    echo -e "${YELLOW}  -> Installing Tmux config...${NC}"
    mkdir -p "$HOME/.config/tmux"
    cp "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.config/tmux/"
    cp "$DOTFILES_DIR/tmux/tmux.conf.local" "$HOME/.config/tmux/"
    ln -sf "$HOME/.config/tmux/tmux.conf" "$HOME/.tmux.conf" 2>/dev/null || true

    # Neovim
    echo -e "${YELLOW}  -> Installing Neovim config...${NC}"
    mkdir -p "$HOME/.config/nvim"
    cp -r "$DOTFILES_DIR/nvim/"* "$HOME/.config/nvim/"

    # Fontconfig
    echo -e "${YELLOW}  -> Installing Fontconfig...${NC}"
    mkdir -p "$HOME/.config/fontconfig"
    cp "$DOTFILES_DIR/fontconfig/fonts.conf" "$HOME/.config/fontconfig/"

    # Zsh
    echo -e "${YELLOW}  -> Installing Zsh config...${NC}"
    cp "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    cp "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
    cp "$DOTFILES_DIR/zsh/.aliases" "$HOME/.aliases"

    # Set Gnome Terminal font
    if command -v gnome-terminal &>/dev/null; then
        echo -e "${YELLOW}  -> Setting Gnome Terminal font to FiraCode Nerd Font...${NC}"
        local PROFILE
        PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default 2>/dev/null | tr -d \')
        if [[ -n "$PROFILE" ]]; then
            gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/" font 'FiraCode Nerd Font 11' 2>/dev/null || true
        fi
    fi

    echo -e "${GREEN}  -> All configs installed${NC}"
    echo ""
}

# =============================================================================
# Shell
# =============================================================================

set_default_shell() {
    print_stage "10" "10" "Transferring Consciousness..." "Setting zsh as default shell"
    local ZSH_PATH
    ZSH_PATH="$(command -v zsh)"

    if [[ -z "$ZSH_PATH" ]]; then
        echo -e "${RED}  -> zsh not found!${NC}"
        return 1
    fi

    if [[ "$SHELL" == "$ZSH_PATH" ]]; then
        echo -e "${GREEN}  -> zsh is already the default shell${NC}"
    else
        echo -e "${YELLOW}  -> Changing default shell to zsh...${NC}"
        echo -e "${YELLOW}     You may be prompted for your password.${NC}"
        chsh -s "$ZSH_PATH" || {
            echo -e "${RED}  -> Failed to change shell. Run manually:${NC}"
            echo -e "${RED}     chsh -s $(which zsh)${NC}"
        }
    fi
    echo ""
}

# =============================================================================
# Main
# =============================================================================

main() {
    print_header
    detect_os

    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}  This will install and configure:${NC}"
    echo "    • Neovim (LazyVim) + plugins"
    echo "    • Tmux (Oh My Tmux!) + plugins"
    echo "    • Zsh (Oh My Zsh + Powerlevel10k) + plugins"
    echo "    • Alacritty terminal"
    echo "    • Nerd Fonts (FiraCode + Symbols)"
    echo "    • Tools: eza, bat, fzf, zoxide, ripgrep, fd, lazygit, fastfetch"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""

    read -rp "Continue? [Y/n]: " confirm
    if [[ ! "$confirm" =~ ^[Yy]?$ ]]; then
        echo -e "${MAGENTA}  Connection terminated. Goodbye, Lain.${NC}"
        exit 0
    fi
    echo ""

    install_packages
    install_fonts
    install_neovim
    install_ohmyzsh
    install_zsh_plugins
    install_tpm
    backup_configs
    install_configs
    install_tmux_plugins
    set_default_shell

    echo -e "${MAGENTA}"
    cat <<'EOF' | rainbow
    ____  ____  ____  ____  ____  ____  ____  ____
   ||P ||||r ||||e ||||s ||||e ||||n ||||t ||||.||
   ||__||||__||||__||||__||||__||||__||||__||||__||
   |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|
        ____  ____  ____  ____  ____  ____
       ||d ||||a ||||y ||||, ||||  ||||p ||
       ||__||||__||||__||||__||||__||||__||
       |/__\||/__\||/__\||/__\||/__\||/__\|
            ____  ____  ____  ____  ____  ____  ____  ____
           ||p ||||r ||||e ||||s ||||e ||||n ||||t ||||.||
           ||__||||__||||__||||__||||__||||__||||__||||__||
           |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|
                ____  ____  ____  ____  ____  ____  ____  ____
               ||t ||||i ||||m ||||e ||||. ||||. ||||. ||
               ||__||||__||||__||||__||||__||||__||||__||
               |/__\||/__\||/__\||/__\||/__\||/__\||/__\|
                    ____  ____  ____  ____  ____  ____  ____  ____
                   ||H ||||a ||||  ||||h ||||a ||||  ||||h ||||a ||
                   ||__||||__||||__||||__||||__||||__||||__||||__||
                   |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|
                        ____  ____  ____  ____  ____  ____  ____  ____
                       ||h ||||a ||||  ||||h ||||a ||||! ||||! ||
                       ||__||||__||||__||||__||||__||||__||||__||
                       |/__\||/__\||/__\||/__\||/__\||/__\||/__\|
EOF
    echo -e "${NC}"
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║          🎉 Installation Complete! Welcome to the Wired! 🎉          ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Next steps:${NC}"
    echo "  1. Log out and log back in (or start a new terminal)"
    echo "  2. Open tmux — all plugins should be installed automatically"
    echo "  3. Open nvim — LazyVim will bootstrap and install plugins (~1-2 min)"
    echo "  4. If p10k config wizard pops up, configure or skip with Ctrl+C"
    echo ""
    echo -e "${BLUE}Useful commands:${NC}"
    echo "  t     — smart tmux session manager"
    echo "  zi    — interactive zoxide (cd with fzf)"
    echo "  lg    — lazygit"
    echo "  f     — fastfetch system info"
    echo "  lain  — present day, present time..."
    echo ""
}

main "$@"
