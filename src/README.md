# Mirror Garden Source Organization

We refer to Mirror Garden as a *live programming engine* (aspirationally for now).

This file details our plan in terms of deliberate code organization.

## Overview

- We assume that [Conway's law](https://en.wikipedia.org/wiki/Conway%27s_law) applies, in all directions, at all scales, but _not immediately_.
- This file attempts to be deliberate about the organization reflected everywhere, both as we go, and in the limit.
- We will use this file to avoid happenstance outcomes (well, ones that follow the contours of natural laws like Conway's less deliberately).
- We expect this file will need to evolve as we go; it can serve as a place to reflect on this need for "global organization" of the system.


## Levels and mixing

- We _choose_ a coarse grouping of program modules based on _*five levels*_.
- Each _level_ of code organization corresponds with a _conceptual level_ of the engine.
- The levels progressively build outward as the numbers increase; the inner (lower-numbered) levels support outer (higher-numbered) levels.
- The only exception to higher-depends-on-lower is that the core level additionally refers to the higher levels in certain controlled ways.
- *The core level('s PL design) permits re-mixing media, edit languages, gadgets and applications across "silos" that would otherwise be totally separated.*

### Level numbers and names

0. Core language and storage
1. Media and editor types
2. Edit languages
3. Interactive gadgets
4. Applications, application parts


# Appendix

Each level has parts with a specific purposes and specific relationships to other levels' parts.

## Level 0: Core language and storage

### Core system

- Names: Symbolic data without a(ny one) type.
- Thunk creation; thunk forcing.
- Adapton evaluator: Caches named thunks' dynamic representation and result; Handles cache invalidation and repair.

### Core language

- (core) values: Names, numbers, text, booleans.
- (core) expressions: Functions, imperative control flow.

### Core embedding non-core elements

- (core embedding non-core) values: sub-cases for each DSL's value type (e.g., media and mdia editor types as values).
- (core embedding non-core) expressions: Do-blocks that create editor-command pipelines.

- (non-core) expressions: a command sub-case for each DSL's exp type (e.g., an edit command on the "current editor").

## Level 1: Media and editor types

Each media type has at least one corresponding editor type.  The media type represents meaningful creative content (when used by creative humans).

The editor type represents edit parameters and editing state not represented in the media directly, but that still affects how the media is edited.

### Basic media / editor types

- Text (line) input.
- Text (2D) plane.
- Lists of basic elements; Lists of lists; Lists of grids, etc
- Grids of basic elements; Grids of grids; Grids of lists, etc.
- N-ary trees of basic editing elements; trees of grids, lists, etc.

## Level 2: Edit languages

Each edit language gives a (first order) *representation* to the operations (*behavior*) of an editor type.

Each edit language is a domain-specific language for scripting edits with an editor and a corresponding media type.

### Basic edit languages:

- Text line (1D)
- Text plane (2D)
- List (1D)
- Grid (2D)
- N-ary trees.

## Level 3: Interactive gadgets

### Basic interactive gadgets:

- Text line (1D)
- Text plane (2D)
- List (1D)
- Grid (2D)
- N-ary trees.

## Level 4: Applications, application parts

### Basic applications:

- Main menu and settings
- Text editor
- Formula grid (single-sheet spreadsheet)
