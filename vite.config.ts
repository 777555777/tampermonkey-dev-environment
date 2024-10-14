import { defineConfig } from "vite"
import { resolve } from "node:path"
import { readdirSync } from "node:fs"
import { exec } from "child_process"

const srcDir = resolve(__dirname, "src")

function generateInputEntries() {
  const entries = {}
  const directories = readdirSync(srcDir, { withFileTypes: true })
  for (const directory of directories) {
    if (directory.isDirectory()) {
      const scriptName = directory.name
      entries[scriptName] = resolve(srcDir, scriptName, "main.ts")
    }
  }
  return entries
}

export default defineConfig({
  build: {
    minify: false,
    rollupOptions: {
      input: generateInputEntries(),
      output: {
        entryFileNames: "[name].js",
        dir: "dist",
        inlineDynamicImports: false,
        manualChunks: undefined,
      },
    },
  },
  plugins: [
    {
      name: "run-bash-scripts",
      closeBundle() {
        exec("./wrap-iife.sh && ./add-header.sh", (error, stdout, stderr) => {
          if (error) {
            console.error(`Error running scripts: ${error.message}`)
            return
          }
          if (stderr) {
            console.error(`stderr: ${stderr}`)
            return
          }
          console.log(`stdout: ${stdout}`)
        })
      },
    },
  ],
})
