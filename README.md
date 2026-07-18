SATySFi English short-CV template
=================================

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

A compact English CV template built with SATySFi.

This repository is intended to be used as a **GitHub template repository**.
Create a new repository from this template, edit `short-cv.saty`, and build the PDF with SATySFi.

![](./image/short-cv.svg)

Requirements
------------

You need a working SATySFi environment.

The template depends on the following SATySFi packages:

- `base`
- `easytable`
- `figbox`
- `fss`
- `latexcmds`
- `parallel`
- `fonts-noto-sans`

Install them with:

```sh
opam install satysfi-base satysfi-easytable satysfi-figbox satysfi-fss \
  satysfi-latexcmds satysfi-parallel satysfi-fonts-noto-sans
satyrographos install
```

The default design uses the Noto Sans font family from `satysfi-fonts-noto-sans`.

Build
-----

Generate the PDF and SVG previews:

```sh
make short-cv.pdf
make image/short-cv.svg
```

The output is an A4, one-page PDF. Generating the SVG requires
[`pdf2svg`](https://www.digip.org/pdftosvg/), available on macOS via
Homebrew with `brew install pdf2svg` and on Debian/Ubuntu as the
`pdf2svg` package.

Customize the sample
--------------------

Edit `short-cv.saty`. Header data is passed to `+cv-header`:

```satysfi
let header-data = (|
  name = {Your Name};
  subtitle = {Short Curriculum Vitae};
  portrait = FigBox.include-image 28mm `portrait.pdf`;
  affiliation-lines = {|
    Your organization
  |};
  email = Some(`you@example.com`);
  orcid = Some(`0000-0000-0000-0000`);
  address-lines = {|
    Street and number
    |
    City and country
  |};
  bottom-vspace = 50pt;
|) in
```

`email` and `orcid` are optional string fields. Use `None` when a value is
not available. Present values are rendered after `affiliation-lines` as
`Email: ...` and `ORCID: ...`, with `mailto:` and `https://orcid.org/` links
generated automatically.

`bottom-vspace` is a required length field. The same value is applied to both
bottom-aligned header text columns: the affiliation/e-mail column and the
address column. Because those columns are bottom-aligned, a positive value such
as `50pt` raises the visible lines of each column relative to its own bottom
edge. Contact lines (e-mail, ORCID) are rendered within the affiliation column
before any spacing adjustment takes effect. `50pt` is the intended value for
the included example; users may adjust it when adapting the header content to
different layouts.

Each table row is a section record passed to `+cv-section`:

```satysfi
let experience-section = (|
  label = {Experience};
  style = Bulleted;
  entries = {|
    First entry.
    |
    A longer second entry that wraps within the right column.
  |};
|) in
```

Use `\cvbreak;` inside a long label to choose its line breaks explicitly.

Available entry styles are:

- `Bulleted` for bullet points.
- `Numbered` for numbered entries.
- `Plain` for unmarked paragraphs.

Compose the document explicitly so sections can be reordered or omitted:

```satysfi
let footer-data = (| updated = {18/07/2026}; |) in

short-cv-document footer-data '<
  +cv-header(header-data);
  +cv-section(experience-section);
>
```

The footer prints `Update: <date>` on the left. Keep the content short enough for the intended one-page format.

Files
-----

- `short-cv.saty`: Main SATySFi source file to edit
- `short-cv.satyh`: Helper definitions for the CV layout
- `portrait.pdf`: An example portrait image, originally from [Blue circled 9 on Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Blue_circled_9.svg)

License
-------

This repository is licensed under the MIT License.
