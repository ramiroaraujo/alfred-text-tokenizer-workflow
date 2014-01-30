# Tokenizer Workflow for Alfred app

> Note, this is the pre-mavericks branch. For the Mavericks branch go to the [master branch](https://github.com/ramiroaraujo/alfred-transmit-workflow)

Workflow for tokenizing different text value input, and converting them back to a string with multiple syntaxes. It was basically thought as a text exapander to convert
space separated works into quoted comma separated values, to use in different languages, mostly because of envy of Ruby's array notation ```%w()```.

## Usage
Type the keyword tokenizer, followed by a space and then a list of space, comma, semicolon, tab or newline separated values.
You can also paste from the clipboard here, which is the only way of inserting tabs or newlines. As long as the input
string is not tokenizable, you'll see:

![no-results](https://raw.github.com/ramiroaraujo/alfred-tokenize-workflow/master/screenshots/no-results.png)

When the input string is tokenizable you'll be prompted with different output options for your data:

![tokenize](https://raw.github.com/ramiroaraujo/alfred-tokenize-workflow/master/screenshots/tokenize.png)

Select any output format and the generated text will be copied to the clipboard and pasted in the front most app.

## Installation
For OS X 10.9 Mavericks, Download the [alfred-tokenize-workflow.alfredworkflow](https://github.com/ramiroaraujo/alfred-tokenize-workflow/raw/master/alfred-tokenize-workflow.alfredworkflow) and import to Alfred 2.

For Previous OS X Versions, Download the [alfred-tokenize-workflow.alfredworkflow](https://github.com/ramiroaraujo/alfred-tokenize-workflow/raw/pre-mavericks/alfred-tokenize-workflow.alfredworkflow) and import to Alfred 2.

## Changelog
* _2014-01-29_ - Released