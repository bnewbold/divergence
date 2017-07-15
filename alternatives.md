
What alternatives are there?
----------------------------

[https://github.com/laurencer/confluence-sync]()

`confluence-sync-tool` was the closest thing to what I wanted. I even tried
hacking in the custom pandoc converter, but ran in to problems with `CNAME`
code blockes getting mangled and gave up trying to debug in Haskell.

[https://bitbucket.org/atlassianlabs/confluence-pandoc-connect]()

This is intended to run server-side. It's where I found the
`confluence-storage.lua` pandoc writer.

[https://github.com/lanyonm/markdown-to-confluence-uploader]()

Close, but no cigar. Does a meh job converting markdown to wiki markup, then
uses Confluence's API to convert to storage format via the XML-RPC API. The
results are poorly formatted.

