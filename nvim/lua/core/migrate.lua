-- One-time migrations for this dotfiles repo.
-- Each migration is keyed by a unique ID stored in a marker file so it runs
-- exactly once per machine, regardless of how many times NeoVim starts.

local marker_dir = vim.fn.stdpath("data") .. "/dotfiles-migrations"
vim.fn.mkdir(marker_dir, "p")

local function done(id)
  return vim.fn.filereadable(marker_dir .. "/" .. id) == 1
end

local function mark(id)
  vim.fn.writefile({}, marker_dir .. "/" .. id)
end

-- Migration: remove legacy Packer plugin directory.
-- Packer installed plugins under site/pack/packer/, which Neovim auto-loads
-- on startup. Leaving it in place causes stale or duplicate plugins to shadow
-- the vim.pack-managed copies in site/pack/core/.
if not done("remove-packer-dir") then
  local packer_dir = vim.fn.stdpath("data") .. "/site/pack/packer"
  if vim.fn.isdirectory(packer_dir) == 1 then
    local result = vim.fn.delete(packer_dir, "rf")
    if result == 0 then
      vim.notify("Migration: removed legacy Packer directory " .. packer_dir, vim.log.levels.INFO)
    else
      vim.notify("Migration: failed to remove " .. packer_dir .. " — remove it manually", vim.log.levels.WARN)
    end
  end
  mark("remove-packer-dir")
end
