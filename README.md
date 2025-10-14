# 💤 ZenVim

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green?logo=neovim)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1-blue?logo=lua)](https://www.lua.org/)
[![Lazy.nvim](https://img.shields.io/badge/Plugin%20Manager-Lazy.nvim-orange)](https://github.com/folke/lazy.nvim)
[![Theme](https://img.shields.io/badge/Theme-TokyoNight-purple)](https://github.com/folke/tokyonight.nvim)

> A clean, modular Neovim configuration built from scratch with Lua and Lazy.nvim.

---

## ⚡ Overview

ZenVim is a **modular Neovim setup built from scratch**.  
Every feature is in its own file under `lua/plugins/`, making it easy to extend, replace, or debug.  

---

## ⚡ Core Features

| Area | Description |
|------|--------------|
| 🧠 **LSP** | Language Server Protocol support with `nvim-lspconfig` + `mason.nvim` |
| 🪄 **Completion** | Autocompletion via `nvim-cmp` and `LuaSnip` |
| 🧹 **Formatting & Linting** | Automatic formatting and linting via `conform.nvim`, `nvim-lint`, `mason-conform.nvim` |
| 🎥 **Smooth Animations** | Seamless scroll and cursor effects using `neoscroll.nvim` and `smear-cursor.nvim` |
| 🚀 **Motion Enhancements** | Faster navigation with `flash.nvim` and multi-cursor editing via `nvim-multicursor` |
| 🪶 **UI Enhancements** | Beautiful command line, popups, and key hints with `noice.nvim` and `which-key.nvim` |
| 🧭 **File Explorer** | File and git tree navigation using `neo-tree.nvim` |
| 🔍 **Search Everything** | Fuzzy finding and live grep via `telescope.nvim` |
| 🌳 **Syntax Tree** | Better syntax highlighting and parsing with `nvim-treesitter` |
| 💾 **Quality of Life** | Git integration, color previews, undo history, and better PHP/HTML indentation |

---

## 🖱️ Plugin Highlights

### 🎬 Animations
- **[neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)** → Smooth scrolling with easing functions.
- **[smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)** → Subtle cursor smear effect when moving fast.

### 🧹 Formatter & Linter
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** → Async universal formatter.
- **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** → On-the-fly linting.
- **[mason-conform.nvim](https://github.com/zeioth/mason-conform.nvim)** → Mason integration for Conform.

### 🏃 Motions
- **[nvim-multicursor](https://github.com/smoka7/multicursors.nvim)** → Multi-cursor editing.
- **[flash.nvim](https://github.com/folke/flash.nvim)** → Enhanced motion & navigation.

### 🧩 One-Liners / Utilities
- **[better-indent-support-for-php-html](https://github.com/Vimjas/vim-html-php-indent)** → Correct PHP/HTML indentation.
- **[oscyank.nvim](https://github.com/ojroques/nvim-osc52)** → Copy to system clipboard over SSH.
- **[vim-doge](https://github.com/kkoomen/vim-doge)** → Auto-documentation generator.
- **[vim-fugitive](https://github.com/tpope/vim-fugitive)** → Git integration.
- **[undotree](https://github.com/mbbill/undotree)** → Visualize undo history.
- **[ts-comments.nvim](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)** → Context-aware commenting.
- **[highlight-colors.nvim](https://github.com/brenoprata10/nvim-highlight-colors)** → Inline color preview.

### 🪶 UI & Experience
- **[noice.nvim](https://github.com/folke/noice.nvim)** → Modern command line, messages, and popup UI.
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** → Display available keybindings in popup.

### 🧠 LSP & Mason
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** → Built-in LSP configuration.
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** → Install/manage LSPs, DAPs, Linters, and Formatters.

### 🎨 Theme
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** → Vibrant theme with night, storm, moon variants.

---

## 🧰 Requirements

- Neovim ≥ 0.9.0  
- Node.js ≥ 16 (JS/TS tools)  
- Python ≥ 3.8 (Python LSPs/formatters)  
- Lua 5.1+  
- ripgrep (`rg`)  
- PHP ≥ 8.0 (for phpactor or intelephense)

---

## 🚀 Installation

1. **Clone ZenVim:**

```bash
git clone https://github.com/<yourusername>/zenvim ~/.config/nvim

2. **Open Neovim and Lazy.nvim will automatically install plugins:**

```bash
nvim

---

## 🔑 Keymaps Overview

```markdown
## 🔑 Keymaps

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fs` | Search current word |
| `<leader>fi` | Find in `~/.config/nvim` |
| `<leader>e` | Toggle Neo-tree |
| `<leader>ca` | Code action |
| `gd` | Go to definition |
| `gr` | List references |
| `<F2>` | Rename symbol |
| `:UndotreeToggle` | Toggle undo history |

---

## 💡 Notes

- Lazy.nvim handles plugin loading and optimization.
- Conform runs formatters asynchronously.
- nvim-lint runs on file save.
- Telescope provides fuzzy searching and live grep.
