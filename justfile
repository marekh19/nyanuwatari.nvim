# nyanuwatari.nvim — task runner
# Build dependencies (lush.nvim, shipwright.nvim) live in project-local
# .deps/ as an nvim pack. Nothing touches your system nvim install.

# Default recipe: list available tasks
default:
    @just --list

# Clone build dependencies into ./.deps (idempotent, fast on re-run)
deps:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p .deps/pack/dev/start
    if [ ! -d .deps/pack/dev/start/lush.nvim ]; then
      echo "→ cloning lush.nvim"
      git clone --depth 1 --quiet https://github.com/rktjmp/lush.nvim .deps/pack/dev/start/lush.nvim
    fi
    if [ ! -d .deps/pack/dev/start/shipwright.nvim ]; then
      echo "→ cloning shipwright.nvim"
      git clone --depth 1 --quiet https://github.com/rktjmp/shipwright.nvim .deps/pack/dev/start/shipwright.nvim
    fi
    echo "✓ deps ready"

# Format every Lua source file with stylua
fmt:
    stylua lua/ colors/

# Verify all Lua files are stylua-clean (exits non-zero if not)
check-fmt:
    stylua --check lua/ colors/

# Smoke-test: load the colorscheme in headless mode and report errors
check: deps
    nvim --headless -u NORC \
      --cmd 'set packpath^=./.deps' \
      --cmd 'set rtp+=.' \
      --cmd 'colorscheme nyanuwatari' \
      --cmd 'echo "ok"' \
      --cmd 'q'

# Regenerate extras/ from the lua palette via shipwright headless
extras: deps
    nvim --headless -u NORC \
      --cmd 'set packpath^=./.deps' \
      --cmd 'set rtp+=.' \
      --cmd 'lua require("nyanuwatari.shipwright.build").run()' \
      --cmd 'q'

# Pull latest versions of lush.nvim and shipwright.nvim
deps-update:
    cd .deps/pack/dev/start/lush.nvim && git pull --quiet --ff-only
    cd .deps/pack/dev/start/shipwright.nvim && git pull --quiet --ff-only
    @echo "✓ deps updated"

# Remove cached build deps (next `just check`/`just extras` re-clones)
deps-clean:
    rm -rf .deps
    @echo "✓ deps cleaned"
