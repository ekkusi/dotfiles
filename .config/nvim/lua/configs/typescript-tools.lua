require("typescript-tools").setup {
  settings = {
    tsserver_file_preferences = {
      importModuleSpecifierPreference = "project-relative",
    },
  },
}
