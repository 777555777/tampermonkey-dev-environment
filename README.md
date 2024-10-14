# Tampermonkey Scripts Development Environment

This project provides an environment for developing Tampermonkey userscripts using **TypeScript** and **ECMAScript Modules (ESM)**. The environment uses **Vite** for bundling and provides a minimal setup that allows you to add Tampermonkey script headers automatically after building.

## Features

- Write your Tampermonkey scripts in TypeScript.
- Bundles your code into a single file for use in Tampermonkey, with automatic header injection.
- Supports multiple script projects under the `/src` directory.

## Getting Started

### Installation

Clone this repository and install the dependencies:

```bash
git clone git@192.168.178.10:bc/tampermonkey-scripts.git
cd tampermonkey-scripts
npm install
```

### Developing Scripts

Create a new directory for each Tampermonkey script under `src/` with the following structure:

```plaintext
/src/
└── scriptName/
    ├── header.txt   # Tampermonkey header file
    └── main.ts      # TypeScript script logic
```

Write your Tampermonkey metadata in the `header.txt` file, following [Tampermonkey's metadata documentation](https://www.tampermonkey.net/documentation.php?locale=en).

Write your script logic in `main.ts`. You can use TypeScript for type safety and modular code organization.

Run the build command:

```bash
npm run build
```

After the build, you will find the bundled script in the `dist/` folder, with the Tampermonkey metadata header already injected.
Then simply copy paste the bundled script into Tampermonkey in your Browser.
