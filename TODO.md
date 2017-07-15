
program structure:
- check for pandoc existence
- render each file to pandoc format (checking for typos, etc)
- connect to server
- for each doc:
    parse for metadata
    read page to see if it exists
    if no change, pass
    else, upload

TODO:
- `--help`
- installation procedure
- extract space, title, and/or page ID from pandoc yaml header
- don't push if no change

Nice to have, but unlikely to be implemented:

- optional table of contents
- more than just markdown (restructured text, html, etc)
- configurable banner at the top of rendered pages ("this uploaded from...")
- color output, one line per file
- detecting and uploading included image files as attachments.
  `confluence-sync` does this
