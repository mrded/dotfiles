vim.filetype.add({
  extension = { mdx = 'mdx' }
})

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.lua" },
    callback = function() vim.lsp.buf.format({ async = false }) end
  }
)

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.go" },
    callback = function() vim.lsp.buf.format({ async = false }) end
  }
)

local prettier = function()
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  local cmd = nil

  if vim.fn.executable("node_modules/.bin/prettier") == 1 then
    cmd = "node_modules/.bin/prettier"
  elseif vim.fn.executable("prettier") == 1 then
    cmd = "prettier"
  end

  if not cmd then return end

  -- read buffer content
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local content = table.concat(lines, "\n")

  -- run prettier via stdin and capture output
  local job_id = vim.fn.jobstart({ cmd, "--stdin-filepath", file }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, output)
      if not output then return end
      vim.schedule(function()
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
      end)
    end,
    on_stderr = function(_, data)
      if data and #data > 0 then
        print("Prettier error:", table.concat(data, "\n"))
      end
    end,
    stdin = "pipe",
  })

  if job_id > 0 then
    vim.fn.chansend(job_id, content)
    vim.fn.chanclose(job_id, "stdin")
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.md", "*.css", "*.scss" },
  callback = prettier,
})
