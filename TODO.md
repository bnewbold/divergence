TODO:
- extract title, and/or page ID from pandoc yaml header. maybe even space?
- update checking doesn't actually work
- fuzzy page title matching bug
- optional header (flag)
- optional table of contents (flag)
- "force update" (flag)

Nice to have, but unlikely to be implemented:
- more than just markdown (restructured text, html, etc)
- configurable banner at the top of rendered pages ("this uploaded from...")
- color output, one line per file
- detecting and uploading included image files as attachments.
  `confluence-sync` does this
