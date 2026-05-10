<div align="center">

<pre>
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
</pre>

<h1>🌿 lain-wired-terminal-dotfiles-mint-ubuntu-debian</h1>

<p>
  <strong>EN:</strong> Aesthetic terminal environment for Linux Mint / Ubuntu / Debian.<br>
  Inspired by <em>Serial Experiments Lain</em> & Kanagawa wave aesthetics.<br>
  <strong>RU:</strong> Эстетичное окружение терминала для Linux Mint / Ubuntu / Debian.<br>
  Вдохновлено <em>Serial Experiments Lain</em> и эстетикой волны Канагава.
</p>

<p>
  <img src="https://img.shields.io/badge/Neovim-0.11+-57A143?logo=neovim&logoColor=white" alt="Neovim">
  <img src="https://img.shields.io/badge/Tmux-3.x-1BB91F?logo=tmux&logoColor=white" alt="Tmux">
  <img src="https://img.shields.io/badge/Zsh-5.9+-F15A24?logo=gnu-bash&logoColor=white" alt="Zsh">
  <img src="https://img.shields.io/badge/Alacritty-latest-FD8019?logo=alacritty&logoColor=white" alt="Alacritty">
  <br>
  <img src="https://img.shields.io/badge/theme-Kanagawa-7E9CD8" alt="Theme">
  <img src="https://img.shields.io/badge/aesthetic-Lain-957FB8" alt="Lain">
  <img src="https://img.shields.io/badge/vibe-cyberpunk-FF00AF" alt="Cyberpunk">
  <img src="https://img.shields.io/badge/status-rice%20ready-76946A" alt="Rice Ready">
</p>

<p>
  <code>#lain</code> · <code>#serialexperimentslain</code> · <code>#anime</code> · <code>#cyberpunk</code> · <code>#ricing</code> · <code>#neovim</code> · <code>#tmux</code> · <code>#zsh</code> · <code>#aesthetic</code> · <code>#weeb</code> · <code># unixporn</code>
</p>

</div>

---

## 🇬🇧 English

### What's Inside

| Component | Description |
|-----------|-------------|
| **Neovim** | [LazyVim](https://www.lazyvim.org/) — modular config powered by `lazy.nvim` |
| **Tmux** | [Oh My Tmux!](https://github.com/gpakosz/.tmux) with Kanagawa theme & powerline style |
| **Zsh** | [Oh My Zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k) rainbow prompt |
| **Alacritty** | GPU terminal with transparency, Kanagawa colors & FiraCode Nerd Font |
| **Nerd Fonts** | FiraCode + Symbols Only (glyph fallback) |

### 🚀 Quick Install

```bash
git clone https://github.com/USERNAME/lain-wired-terminal-dotfiles-mint-ubuntu-debian.git
cd lain-wired-terminal-dotfiles-mint-ubuntu-debian
./install.sh
```

The installer will:
1. Update packages & install dependencies
2. Download & install Nerd Fonts
3. Install Neovim (AppImage v0.11+)
4. Install Oh My Zsh + plugins
5. Install TPM + tmux plugins **automatically**
6. Backup existing configs
7. Apply all dotfiles
8. Set `zsh` as default shell

### 📦 Auto-installed Tools

`git` · `curl` · `wget` · `tmux` · `zsh` · `alacritty` · `ripgrep` · `fd-find` · `fzf` · `zoxide` · `lolcat` · `eza` · `bat` · `lazygit` · `fastfetch` · `fonts-noto-color-emoji`

### 🎨 Theme

**Kanagawa** palette — inspired by Hokusai's famous *Great Wave off Kanagawa* woodblock print, blended with the cyberpunk melancholy of *Serial Experiments Lain*.

- **Neovim:** `rebelot/kanagawa.nvim`
- **Tmux:** custom colors in `tmux.conf.local`
- **Alacritty:** colors in `alacritty.toml`
- **Dashboard:** ASCII art of Lain Iwakura rendered via `lolcat` 🌈

### ⌨️ Key Bindings

**Tmux** (Prefix = `Ctrl+B` / `Ctrl+A`)

| Binding | Action |
|---------|--------|
| `Prefix + \|` | Vertical split |
| `Prefix + -` | Horizontal split |
| `Prefix + h/j/k/l` | Navigate panes |
| `Prefix + H/J/K/L` | Resize pane |
| `Prefix + r` | Reload config |
| `Prefix + s` | Sessionx (session manager) |
| `Prefix + m` | Toggle mouse |

**Neovim** (Leader = `Space`)

| Binding | Action |
|---------|--------|
| `<Leader> e` | File tree (Neo-tree) |
| `<Leader> ff` | Find files (fzf) |
| `<Leader> sg` | Live grep |
| `<Leader> gg` | LazyGit |

**Zsh**

| Command | Description |
|---------|-------------|
| `t` | Smart tmux session manager |
| `zi` | Interactive zoxide (cd + fzf) |
| `lg` | LazyGit |
| `f` | Fastfetch |

---

## 🇷🇺 Русский

### Что внутри

| Компонент | Описание |
|-----------|----------|
| **Neovim** | [LazyVim](https://www.lazyvim.org/) — модульная конфигурация на `lazy.nvim` |
| **Tmux** | [Oh My Tmux!](https://github.com/gpakosz/.tmux) с темой Kanagawa и powerline-стилем |
| **Zsh** | [Oh My Zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k) с радужным промптом |
| **Alacritty** | GPU-терминал с прозрачностью, цветами Kanagawa и FiraCode Nerd Font |
| **Nerd Fonts** | FiraCode + Symbols Only (fallback для иконок) |

### 🚀 Быстрая установка

```bash
git clone https://github.com/USERNAME/lain-wired-terminal-dotfiles-mint-ubuntu-debian.git
cd lain-wired-terminal-dotfiles-mint-ubuntu-debian
./install.sh
```

Установщик автоматически:

1. Обновит пакеты и установит зависимости
2. Скачает и установит шрифты
3. Установит Neovim (AppImage v0.11+)
4. Установит Oh My Zsh и плагины
5. Установит TPM и tmux-плагины **автоматически**
6. Сделает бэкап текущих конфигов
7. Применит все конфиги
8. Установит zsh как shell по умолчанию

### 📦 Автоустановка инструментов

`git` · `curl` · `wget` · `tmux` · `zsh` · `alacritty` · `ripgrep` · `fd-find` · `fzf` · `zoxide` · `lolcat` · `eza` · `bat` · `lazygit` · `fastfetch` · `fonts-noto-color-emoji`

### 🎨 Тема

Палитра **Kanagawa** — вдохновлёна знаменитой гравюрой Хокусая «Большая волна в Канагаве», смешанной с киберпанковой меланхолией *Serial Experiments Lain*.

- **Neovim:** `rebelot/kanagawa.nvim`
- **Tmux:** кастомные цвета в `tmux.conf.local`
- **Alacritty:** цвета в `alacritty.toml`
- **Dashboard:** ASCII-арт Лэйн Ивакуры через `lolcat` 🌈

### ⌨️ Ключевые биндинги

**Tmux** (Prefix = `Ctrl+B` / `Ctrl+A`)

| Биндинг | Действие |
|---------|----------|
| `Prefix + \|` | Вертикальный сплит |
| `Prefix + -` | Горизонтальный сплит |
| `Prefix + h/j/k/l` | Навигация между панелями |
| `Prefix + H/J/K/L` | Изменение размера панели |
| `Prefix + r` | Перезагрузить конфиг |
| `Prefix + s` | Sessionx (менеджер сессий) |
| `Prefix + m` | Вкл/выкл мышь |

**Neovim** (Leader = `Space`)

| Биндинг | Действие |
|---------|----------|
| `<Leader> e` | Файловый менеджер (Neo-tree) |
| `<Leader> ff` | Find files (fzf) |
| `<Leader> sg` | Live grep |
| `<Leader> gg` | LazyGit |

**Zsh**

| Команда | Описание |
|---------|----------|
| `t` | Smart tmux session manager |
| `zi` | Интерактивный zoxide (cd + fzf) |
| `lg` | LazyGit |
| `f` | Fastfetch |

---

## 📁 Structure / Структура

```
.
├── alacritty/
│   └── alacritty.toml          # Terminal config / Конфиг терминала
├── fontconfig/
│   └── fonts.conf              # Nerd Font glyph fallback
├── nvim/
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/
│       ├── config/             # LazyVim settings
│       └── plugins/            # User plugins + Lain banner
├── tmux/
│   ├── tmux.conf               # Oh My Tmux! (don't touch / не трогать)
│   └── tmux.conf.local         # Customizations + Kanagawa theme
├── zsh/
│   ├── .zshrc                  # Zsh config
│   ├── .p10k.zsh               # Powerlevel10k rainbow theme
│   └── .aliases                # Aliases (eza, bat, lazygit, etc.)
├── install.sh                  # Installer / Установщик
└── README.md                   # This file
```

## 🛠️ Manual Setup / Ручная настройка

### Tmux

Edit only `~/.config/tmux/tmux.conf.local` — `tmux.conf` gets overwritten on Oh My Tmux! updates.

```bash
nvim ~/.config/tmux/tmux.conf.local
tmux source ~/.config/tmux/tmux.conf
```

### Neovim

```bash
nvim ~/.config/nvim/lua/plugins/        # user plugins
nvim ~/.config/nvim/lua/config/         # options, keymaps, autocmds
```

### Zsh

```bash
nvim ~/.zshrc      # main config
nvim ~/.aliases    # aliases
nvim ~/.p10k.zsh   # theme
```

## ⚠️ Backups / Бэкапы

Old configs are saved to / Старые конфиги сохраняются в:

```
~/.config-backup-YYYYMMDD-HHMMSS/
```

## 📝 License / Лицензия

Dotfiles are free to use and modify. / Конфиги свободны для использования и модификации.

Oh My Tmux! is dual-licensed under WTFPL/MIT.

---

<div align="center">

<code>「Present day, present time... Ha ha ha ha ha!」</code>

</div>
