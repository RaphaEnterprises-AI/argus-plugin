---
description: Discover interactive elements on a web page
args:
  - name: url
    description: The URL to analyze
    required: true
    type: string
allowed_tools:
  - mcp__argus__argus_discover
  - mcp__argus__argus_visual_capture
---

# Argus Element Discovery

Discover all interactive elements on a web page for testing purposes.

## Usage

`/argus discover <url>` - Analyze a specific URL

## What This Does

1. Navigates to the specified URL
2. Analyzes the DOM structure
3. Identifies interactive elements (buttons, forms, links, inputs)
4. Categorizes elements by type and purpose
5. Generates element map with selectors

## Instructions

Use the `argus_discover` MCP tool with the provided URL to analyze the page.

Present the output as:
- Element inventory with counts by type
- Interactive element details (selector, text, purpose)
- Suggested test scenarios based on elements found

## Example

```
/argus discover https://demo.vercel.store
```
