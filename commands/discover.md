---
description: Discover interactive elements on a web page
---

# Argus Element Discovery

Discover all interactive elements on a web page for testing purposes.

## Usage

`/argus:discover [url]` - Analyze a specific URL

## What This Does

1. Navigates to the specified URL
2. Analyzes the DOM structure
3. Identifies interactive elements (buttons, forms, links, inputs)
4. Categorizes elements by type and purpose
5. Generates element map with selectors

## Arguments

$ARGUMENTS

## Output

- Element inventory with counts by type
- Interactive element details (selector, text, purpose)
- Suggested test scenarios based on elements found
- Screenshot of the page

## Example

```
/argus:discover https://demo.vercel.store
```

Use the `mcp__argus__argus_discover` MCP tool to perform discovery.
