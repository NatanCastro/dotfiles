return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Existing tools
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",

        -- TypeScript and TSX
        "typescript-language-server",
        "eslint_d", -- Fast ESLint daemon

        -- Rust
        "rust-analyzer",

        -- Golang
        "gopls",
        "golangci-lint",
        "gofumpt",

        -- OCaml
        "ocaml-lsp",
        "ocamlformat",

        -- Markdown
        "markdownlint",
        "prettierd", -- Prettier daemon for Markdown, HTML, CSS, etc.

        -- HTML
        "html-lsp",

        -- Emmet (for HTML and CSS)
        "emmet-ls",

        -- CSS
        "css-lsp",

        -- Tailwind CSS
        "tailwindcss-language-server",

        -- Java
        "jdtls",
        "google-java-format",

        -- Python
        "pyright", -- Language server for Python
        "black", -- Formatter for Python
        "isort", -- Import sorter for Python
        "mypy", -- Type checker for Python
        "pylint", -- Linter for Python
      },
    },
  },
}
