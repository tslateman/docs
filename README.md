# Development Guide

This guide explains how to set up and work with the documentation locally.

## Quick Start

```bash
# First time setup
make setup

# Start the development server
make serve
```

The documentation will be available at <http://localhost:8000>

## Available Commands

### Setup and Installation

- `make setup` - Create virtual environment and install all dependencies
- `make install` - Install/reinstall dependencies only
- `make update` - Update all dependencies to latest versions

### Development

- `make serve` - Start the development server (default port 8000)
- `make port PORT=8080` - Start server on a custom port
- `make build` - Build static site to `./site/` directory
- `make watch` - Build and watch for changes (no server)

### Testing and Validation

- `make test` - Run documentation checks for broken links and warnings
- `make validate` - Validate MkDocs configuration syntax

### Deployment

- `make deploy` - Deploy to GitHub Pages (requires permissions)

**Note:** This site is deployed to https://tslateman.github.io/docs/

### Utilities

- `make shell` - Open a shell with virtual environment activated
- `make clean` - Remove generated files and virtual environment
- `make help` - Show all available commands

## Troubleshooting

### Virtual Environment Issues

If you encounter Python or pip errors:

```bash
# Clean and rebuild
make clean
make setup
```

### Port Already in Use

If port 8000 is busy:

```bash
# Use a different port
make port PORT=8080
```

### Missing Documentation Files

If MkDocs reports missing files, ensure your documentation is in the correct directory structure as specified in `mkdocs.yml`.

## Development Workflow

1. **Make changes** to your markdown files
2. **Preview locally** with `make serve`
3. **Validate** changes with `make test`
4. **Build** the static site with `make build`
5. **Deploy** when ready with `make deploy`

## Requirements

- Python 3.7 or higher
- make (GNU Make)
- Git (for deployment)

## Directory Structure

```sh
.
├── Makefile           # Build automation
├── mkdocs.yml         # MkDocs configuration
├── requirements.txt   # Python dependencies
├── docs/              # Documentation source files (or as configured)
├── site/              # Generated static site (git-ignored)
└── venv/              # Python virtual environment (git-ignored)
```
