# README

## Sitemap

```bash
.
├── assets
│   └── videos
├── _config.yml
├── .docker
│   └── repo.dockerfile
├── docs
│   ├── CTFs_and_Challenges
│   │   ├── Past_Challenges
│   │   │   └── Challenge_01.md
│   │   ├── Practice_Challenge
│   │   │   └── Challenge_01.md
│   │   └── Upcoming_CTFs.md
│   ├── Discussion_and_Ideas
│   │   ├── Discussions.md
│   │   └── Idea_Tracker.md
│   ├── Documentation
│   │   ├── Meeting_01.md
│   │   └── Meeting_02.md
│   ├── Miscellaneous
│   │   ├── Club_Overview.md
│   │   ├── Events.md
│   │   ├── Links_and_References.md
│   │   └── Membership_Guidelines.md
│   ├── Projects_and_Research
│   │   ├── Project_01
│   │   │   └── README.md
│   │   └── Research_Papers
│   │       └── Paper_01.md
│   ├── Tools_and_Software
│   │   ├── CustomTools
│   │   │   └── Tool_01.md
│   │   └── Open_Source_Tools
│   │       └── Tool_01.md
│   └── Tutorials_and_Training_Materials
│       ├── External_Resources.md
│       ├── Getting_Started
│       │   └── Guide_01.md
│       └── Workshop_Materials
│           └── Workshop_01.md
├── .github
│   ├── CHANGELOG.md
│   ├── CODE_OF_CONDUCT.md
│   ├── CONTRIBUTING.md
│   ├── ISSUE_TEMPLATE.md
│   ├── LICENSE
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows
│       ├── main.yml
│       ├── Node.js.yml
│       ├── .nvmrc
│       └── tests.yml
├── _includes
│   ├── footer.html
│   ├── header.html
│   ├── nav.html
│   └── sidebar.html
├── index.md
├── jekyll.gitignore
├── _layouts
│   ├── archive.html
│   ├── category.html
│   ├── default.html
│   ├── home.html
│   ├── page.html
│   ├── post.html
│   └── tag.html
├── .nvmrc
├── _posts
│   └── README.md
├── README.md
├── src
│   ├── assets
│   │   ├── css
│   │   │   ├── main.scss
│   │   │   └── menu.css
│   │   ├── html
│   │   │   └── index.html
│   │   ├── img
│   │   │   └── logo.png
│   │   └── js
│   │       ├── main.js
│   │       └── menu.js
│   ├── cli
│   │   └── create_dir_strut.sh
│   ├── .hooks
│   │   └── pre-commit.sh
│   ├── main.bsdesign
│   └── python
├── tree.txt
└── .vscode
    └── Cybersecurity_Club.code-workspace

35 directories, 57 files

```

### Folders

1. The `_layouts` folder is where templates are defined for this website
2. The `_posts` folder is where blog posts would go
3. The `_includes` folder can contain snippets of code to include in layouts
4. The `assets` folder is for:
   1. CSS
      1. **Note** that Jekyll uses SCSS for its style files, which is a superset of `CSS` that includes features like variables and nesting.
   2. JavaScript
   3. images
5. `index.md` file at the root of the repository is the content for the main page of the website.
   1. Any .md files in the root of the repository will be converted into pages on the website.
6. `_config.yml` file for site settings:
   1. This includes things like
   2. The site name
   3. Author name
   4. The theme being used

## Github Pages

One of the great things about Jekyll is its simplicity. To create a new page, all you have to do is create a new HTML or Markdown file.

Just specify the branch and the directory (usually `main` and `/docs`, or `main` and `root`) from where GitHub Pages should build your site.

It is worth mentioning that while Jekyll is the easiest to use with GitHub Pages (since it's supported directly), you can still use other static site generators like Hugo or MkDocs. You would just need to build the site locally and commit the generated static files.

## GitHooks

### pre-commit

```bash
#!/bin/sh
# pre-commit

if git rev-parse --verify HEAD >/dev/null 2>&1
then
    against=HEAD
else
    # Initial commit: diff against an empty tree object
    against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Redirect output to stderr.
exec 1>&2

# Check for TODO comments
if ! git diff-index --cached --quiet $against -- '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' '**/*.html' '**/*.css' '**/*.scss' '**/*.md' '(exclude)package-lock.json' '(exclude)yarn.lock'; then
    echo "To be committed:"
    git diff --cached -- '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' '**/*.html' '**/*.css' '**/*.scss' '**/*.md' '(exclude)package-lock.json' '(exclude)yarn.lock'
    if git diff --cached --name-only -z $against | xargs -0 grep -n 'TODO'; then
        echo 'ERROR: Commit contains TODO'
        exit 1
    fi
fi

# Normal exit
exit 0
```

### Setup .hooks

```bash
# Run this command once to set up the hooks
git config core.hooksPath .hooks
```

## Overview

This Jekyll-based GitHub Pages site is structured with a series of HTML and Markdown files, along with accompanying CSS for styling. The website uses Jekyll's powerful templating language, Liquid, to dynamically build the site upon each commit.

### Main Components

The website consists of several main components:

**Layouts**: These are templates that wrap around your content. They live in the `_layouts` directory.
**Includes**: These are partials that can be included in your layouts and pages. They live in the `_includes` directory.
**Pages**: These are the actual content of your site, and can be written in HTML or Markdown. They utilize front matter to specify metadata and assign layouts.
**Static files and assets**: These are files such as CSS stylesheets, JavaScript files, and images. They're typically stored in an assets directory at the root of your project.

### File Structure

```bash
/
├── _includes/
│   ├── header.html
│   ├── footer.html
│   └── sidebar.html
├── _layouts/
│   └── default.html
├── assets/
│   ├── css/
│   └── img/
├── _config.yml
└── index.md
```

`_includes/` - This directory contains the HTML snippets that are reused across the site.
`_layouts/` - This directory contains the layout templates.
`assets/` - This directory contains static files such as images and CSS.
`_config.yml` - This file is used by Jekyll to get configuration information for the site.
`index.md` - This file is the main content file.

## Specific Components

### Header

The header.html file in the _includes directory is responsible for generating the site's navigation bar. It contains a logo image and main navigation links, including a dropdown menu for project related pages.

This is included in your layout with the `{% include header.html %}` tag.

### Sidebar

The sidebar.html file in the _includes directory creates a sidebar that includes an About section, navigation links, and social media links. The sidebar can be included in any of your layouts or pages by using the `{% include sidebar.html %}` tag.

### Footer

The `footer.html` file in the `_includes` directory generates the site's footer.

It includes a copyright statement, social media links, and secondary navigation.

This is included in your layout with the `{% include footer.html %}` tag.

### Layout

The `default.html` file in the `_layouts` directory is the main layout for the site. It structures the HTML and includes the header, the main content area, and the footer.

Content pages specify their use of this layout in their front matter with layout: default.

### Configuration

The `_config.yml` file at the root of the project is used to define configuration settings for the site. This includes things like the site title, description, and social media links.

### Styling

The site's styles are defined in CSS files located in the `assets/css/` directory. You should modify these files to change the look and feel of the site.

### Content Pages

Content pages can be written in Markdown or HTML and are where the main content of the site lives. These pages utilize front matter to assign layouts and specify metadata like the page title.

Content pages should be added to the root directory or organized into subdirectories. Each content page that uses the default layout will automatically have the header, footer, and sidebar included.

### Deployment

Because this site is hosted on **GitHub Pages** and powered by **Jekyll**, the site is automatically built and deployed whenever you push to your repository. The site is hosted at `https://<username>.github.io/<repository>/`.

### Additional Information

For more detailed information on how to work with Jekyll and GitHub Pages, refer to the following resources:
This documentation is a general guide and your actual site might be slightly different based on your specific needs and customizations.

[Jekyll Documentation][addon-1]
[GitHub Pages Documentation][addon-2]

[addon-1]: https://github.com/ "Official Jekyll Documentation"
[addon-2]: https://github.com/ "Official Github PAges Documentation"
