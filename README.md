
`divergence` is a simple python script for uploading markdown files to
Confluence (a proprietary wiki system). If you find yourself needing to publish
documentation to Confluence at work, but wish that instead you could just write
markdown and keep it versioned in git instead of contending with
browser-mangling javascript and pull-down menus, then this tool is for you!

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

    export CONFLUENCE_USER="user123"
    export CONFLUENCE_PASSWORD="password456"
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

You might want to write a shell script wrapper to automate configuration; you
could also set these variables in `~/.profile` or similar:

    #!/bin/bash

    export CONFLUENCE_USER=`whoami`
    export CONFLUENCE_PASSWORD=`pass evil-corp.jira.com | head -n1`
    export CONFLUENCE_URL="https://evil-corp.jira.com/wiki/"

    divergence -v $*

It's probably possible to use any pandoc-supported markup file format (not just
Markdown), but this hasn't been tested.

Metadata can also be extracted from a pandoc-style YAML header in the markdown
file itself. This is helpful if you want to override the (case-sensitive, and
thus buggy) title/page matching behavior, or if you want to override the
Confluence space for different documents.

    ---
    confluence-page-id: 12345
    confluence-space-key: PRJ5
    confluence-page-title: "Some Fancy Title Here"
    ...

Space Key is used for creating pages and doing title-based lookup. If page-id
(a number which can be found in the URL of pages on the confluence site) is
given, that is used for lookup and editing instead.

Other confluence metadata, such as the page hierarchy, can be modified in the
Confluence web interface and should persist across updates from this tool.
