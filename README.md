
A simple python script for uploading markdown files to Confluence (a
proprietary wiki system). If you find yourself needing to publish documentation
to Confluence at work, but wish that instead you could just write markdown and
keep it versioned in git instead of contending with browser-mangling javascript
and pull-down menus, then this tool is for you!

This is crude and one-way: there is no mechanism for synchronizing or retaining
edits made by peers, won't look the way you want it to, there are no unittests,
it will mangle your wiki space, and confound your sysadmins. Have Fun!

# Installation and Setup

You need **Python 3**, the **requests** python(3) library, and **pandoc**
installed first:

    # debian/ubuntu
    sudo apt install python3 python3-requests pandoc

    # homebrew? guessing here
    sudo brew install python3 py3-requests pandoc

To experiment you can checkout this repo and run commands locally. If you like
it you can install system-wide with:

    sudo make install

On the Confluence side, it uses the newer REST API (not the old XML-RPC API)
and generates complete pages in "Confluence storage" syntax, so if you're lucky
it will Just Work without needing any administrative intervention.

# Usage

    export CONFLUENCE_USER=`whoami`
    export CONFLUENCE_PASSWORD="password123"
    export CONFLUENCE_URL="https://evil-corp.jira.com/wiki/"
    ./divergence -s "PROD25" Acme_Widget_Docs.md

This will create a new page "Acme Widget Docs" under the space with ID
"PROD25" (or overwrite it if it already exists). When experimenting you
probably want to use your personal space, which will be something like
"~bitdiddle". If you blow away something accidentally, it should be possible to
revert the push in the wiki interface (this has not been verified).

Multiple files can be uploaded at the same time.

If you have in-line images you'll need to upload them manually. Haven't tried
it yet.

