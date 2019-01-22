# Introduction 
This is just a quick guideline to install `ESLint` in your JS applications.

# Table of contents
1. [Install packages](#install-packages)
2. [Create your .eslintrc.json file!](#create-your-eslintrc-json-file)
3. [How to use it](#how-to-use-it)
4. [Add shortcut commands ](#add-shortcut-commands)
5. [Integrating ESLint with  Prettier](#integrating-eslint-with-prettier)
6. [If you are also using Codeclimate](#if-you-are-also-using-codeclimate)

# Install packages
Follow the steps below and install all the necessary packages.

```console
$ npm install --save-dev eslint
$ npm add --save-dev eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-config-react-app
```
==References==
[Integrating with ESLint · Prettier](https://prettier.io/docs/en/eslint.html)
[ESLint で ES6で書かれたReact のコードを検証する - Qiita](https://qiita.com/kjugk/items/b9dfc876e16dbfa4f447#eslint-plugin-react-%E3%81%AE-recommened-rulues-%E3%82%92%E9%81%A9%E7%94%A8%E3%81%99%E3%82%8B)
[ESLintの推奨設定（eslint:recommended）のチェック内容 ｜ Tips Note by TAM](https://www.tam-tam.co.jp/tipsnote/javascript/post11934.html)
[ESLint ルール 一覧 (日本語) - galife](https://garafu.blogspot.com/2017/02/eslint-rules-jp.html)
[PrettierとLinterを併用する - Qiita](https://qiita.com/sigwyg/items/ebb21ef70550cee7a163)
[GitHub - prettier/eslint-config-prettier: Turns off all rules that are unnecessary or might conflict with Prettier.](https://github.com/prettier/eslint-config-prettier#special-rules)
[Prettier + ESLint + Facebook Code Quality: The Auto-magical React Styling Tutorial](https://medium.com/@eliotjunior/prettier-eslint-facebook-code-quality-the-auto-magical-react-styling-tutorial-19481acb10dd)

# Create your .eslintrc.json file
This is just an example of `.eslintrc` file. (This is like the bare minimum for a react application)

```json
{
  "extends": ["react-app", "plugin:jsx-a11y/recommended"],
  "plugins": ["jsx-a11y"]
}
```
# How to use it
Simply run the commands below to use `ESLint`.

```console
// Run the command to check a specific file.
$ ./node_modules/.bin/eslint yourfile.js

// Run the command to fix errors.
// Each file
$ ./node_modules/.bin/eslint --fix yourfile.js
// Each Folder
$ ./node_modules/.bin/eslint --fix src/actions/
```
# Add shortcut commands 

```json
"scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject",
    "lint": "eslint . --ext .js,.jsx; exit 0",
    "lint-fix": "eslint --fix . --ext .js,.jsx; exit 0"
  }
```

# Integrating ESLint with  Prettier
[Difference of those two tools](https://www.futurehosting.com/blog/prettier-vs-eslint-whats-the-difference/)

```console
$ npm install eslint --save-dev
$ npm install --save-dev prettier eslint-plugin-prettier
$ npm install --save-dev eslint-config-prettier
```

```json
{
  "extends": ["react-app", "plugin:jsx-a11y/recommended", "prettier"],
  "plugins": ["jsx-a11y", "prettier"],
  "rules": {
     "prettier/prettier": "error"
   }
}
```
## References
- [Prettier + ESLint + Facebook Code Quality: The Auto-magical React Styling Tutorial](https://medium.com/@eliotjunior/prettier-eslint-facebook-code-quality-the-auto-magical-react-styling-tutorial-19481acb10dd)
- [Command Line Interface - ESLint - Pluggable JavaScript linter](https://eslint.org/docs/user-guide/command-line-interface#--ext)
- [Running eslint as an npm script results in ELIFECYCLE error. · Issue #2409 · eslint/eslint · GitHub](https://github.com/eslint/eslint/issues/2409)
- [ESLint をグローバルにインストールせずに使う - Qiita](https://qiita.com/mysticatea/items/6bd56ff691d3a1577321)
- [Streamline JavaScript Development with ESLint - NodeSource](https://nodesource.com/blog/streamline-javascript-development-with-eslint/)

### If you are also using Codeclimate

```console
$ touch .codeclimate.yml
```

```
// .codeclimate.yml
eslint:
  enabled: true
  config:
    config: /vfhd-development-kit/projects/vf_helpdesk_frontend/.eslintrc.json
```
==References==
[Code Climate](https://docs.codeclimate.com/docs/eslint)
