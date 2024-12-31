# GitHub Tutorial for Developers
> A comprehensive guide to using GitHub for version control and team collaboration

## Table of Contents
> Quick navigation through the tutorial sections

1. [Getting Started with GitHub](#getting-started)
2. [Basic Git Commands](#basic-commands)
3. [Working with Repositories](#working-with-repositories)
4. [Collaboration Workflow](#collaboration-workflow)
5. [Best Practices](#best-practices)
6. [Advanced Topics](#advanced-topics)
7. [Advanced Git Techniques](#advanced-git-techniques)
8. [Advanced GitHub Features](#advanced-github-features)
9. [Team Collaboration and Code Review](#team-collaboration-and-code-review)
10. [Security and Best Practices](#security-and-best-practices)
11. [Error Recovery and Troubleshooting](#error-recovery-and-troubleshooting)
12. [Git for Special Use Cases](#git-for-special-use-cases)

## Getting Started
> Essential setup and configuration for beginning with GitHub

### Setting up Git and GitHub
1. Install Git from [git-scm.com](https://git-scm.com/)
2. Create a GitHub account at [github.com](https://github.com)
3. Configure Git with your credentials:
```bash
git config --global user.name "Your Name"
# Sets your name for all Git repositories on your machine
# The --global flag makes this setting apply to all repositories
# Replace "Your Name" with your actual name as you want it to appear in commits

git config --global user.email "your.email@example.com"
# Sets your email for all Git repositories
# Should match your GitHub account email
# Used to link commits to your GitHub account
```

### Basic Commands
Essential Git commands you'll use daily:
```bash
git init                    # Initialize a new repository
git clone [url]            # Clone a repository
git add [file]            # Add files to staging
git commit -m "message"    # Commit changes
git push                   # Push changes to remote
git pull                   # Pull changes from remote
```

## Working with Repositories
### Creating a New Repository
1. Click "New" on GitHub
2. Fill in repository details
3. Initialize with README if needed
4. Clone to local machine:
```bash
git clone https://github.com/username/repository.git
```

### Uploading an Existing Project
```bash
cd your-project
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/username/repository.git
git push -u origin main
```

## Collaboration Workflow
### Branching Strategy
```bash
git checkout -b feature/new-feature    # Create new branch
git push -u origin feature/new-feature # Push branch
```

### Pull Requests
1. Create branch
2. Make changes
3. Push changes
4. Open Pull Request on GitHub
5. Request review
6. Merge after approval

### Code Review Process
- Review code changes
- Leave constructive comments
- Request changes if needed
- Approve when ready
- Merge pull request

## Best Practices
1. Write clear commit messages
2. Keep commits atomic and focused
3. Pull regularly to stay updated
4. Use meaningful branch names
5. Document code changes
6. Review before merging

## Advanced Topics
### Git Flow
- main/master branch for production
- develop branch for development
- feature branches for new features
- hotfix branches for urgent fixes

### Resolving Conflicts
```bash
git pull origin main
# Fix conflicts in files
git add .
git commit -m "Resolve conflicts"
git push
```

### GitHub Actions
- Automated workflows
- Continuous Integration
- Automated testing
- Deployment pipelines

### Security
- Use SSH keys
- Enable 2FA
- Review access permissions
- Keep dependencies updated

## Advanced Git Techniques
### Interactive Rebase
A powerful tool for revising commit history:
```bash
# Interactively edit last 3 commits
git rebase -i HEAD~3

# Rebase onto specific branch
git rebase -i main
```

Common rebase commands:
- `pick`: keep commit as is
- `reword`: change commit message
- `edit`: pause for amending
- `squash`: meld into previous commit
- `drop`: remove commit

### Git Hooks
Automated scripts for various Git events:

```bash
# Pre-commit hook example (.git/hooks/pre-commit)
#!/bin/sh
npm run lint
npm test

# Prevent commit if tests fail
if [ $? -ne 0 ]; then
    echo "Tests failed. Commit aborted."
    exit 1
fi
```

### Submodules and Subtrees
Managing project dependencies:
```bash
# Add submodule
git submodule add https://github.com/user/repo external/module

# Update submodules
git submodule update --init --recursive

# Add subtree
git subtree add --prefix external/lib https://github.com/user/lib main --squash
```

## Advanced GitHub Features
### GitHub CLI
Working with GitHub from the command line:
```bash
# Installation
winget install GitHub.cli

# Authentication
gh auth login

# Create PR
gh pr create --title "New feature" --body "Description"

# Manage issues
gh issue list
gh issue create
```

### GitHub Actions Workflow Examples

#### Continuous Integration
```yaml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Setup Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '16'
        
    - name: Install Dependencies
      run: npm ci
      
    - name: Run Tests
      run: npm test
```

#### Automatic Release Creation
```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    
    - name: Create Release
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: ${{ github.ref }}
        release_name: Release ${{ github.ref }}
        draft: false
        prerelease: false
```

## Team Collaboration and Code Review
### Code Review Checklist
1. **Architecture**
   - Does the change fit the overall architecture?
   - Are dependencies appropriate?

2. **Code Quality**
   - Is the code DRY (Don't Repeat Yourself)?
   - Does it follow project standards?
   - Are variables and functions named meaningfully?

3. **Testing**
   - Is there sufficient test coverage?
   - Are edge cases covered?
   - Are tests readable and maintainable?

4. **Documentation**
   - Are changes documented?
   - Are complex algorithms explained?
   - Is API documentation up to date?

### Branch Protection Rules
Setting up branch protection:
1. Open repository settings
2. Select "Branches"
3. Add rule for main branch
4. Recommended settings:
   - Require pull request reviews
   - Dismiss stale pull request approvals
   - Require status checks to pass
   - Require branches to be up to date
   - Include administrators

## Security and Best Practices
### Securing Secrets
```bash
# .gitignore example
.env
secrets/
*.key
config.private.json

# Using GitHub Secrets
secrets.API_KEY
secrets.DATABASE_URL
```

### Git-LFS for Large Files
```bash
# Install Git LFS
git lfs install

# Track file types with LFS
git lfs track "*.psd"
git lfs track "*.zip"

# Check LFS status
git lfs status
```

### Repository Maintenance
```bash
# Optimize repository
git gc --aggressive

# Find large objects
git rev-list --objects --all | grep -f <(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10 | awk '{print $1}')

# Clean up remote branches
git remote prune origin
```

## Error Recovery and Troubleshooting
### Commit Recovery
```bash
# Find deleted commit
git reflog

# Restore commit
git cherry-pick [commit-hash]

# Branch at specific time
git checkout -b recovery master@{1.day.ago}
```

### File Recovery
```bash
# Single file from commit
git checkout [commit-hash] -- path/to/file

# All files from commit
git checkout [commit-hash] .

# File from another branch
git checkout other-branch -- path/to/file
```

### Emergency Commands
```bash
# Temporarily store changes
git stash save "WIP: description"

# Undo last commit (keep changes)
git reset --soft HEAD^

# Discard all local changes
git reset --hard HEAD

# Reset branch to remote
git reset --hard origin/main
```

## Git for Special Use Cases
### Monorepo Management
```bash
# Selective checkout
git sparse-checkout set path/to/subdirectory

# Shallow clone
git clone --depth 1 repository-url

# Partial clone
git clone --filter=blob:none repository-url
```

### Git for CI/CD
```bash
# Version tags
git tag -a v1.0.0 -m "Release Version 1.0.0"
git push origin v1.0.0

# Create release branch
git checkout -b release/1.0.0 main
git push -u origin release/1.0.0
```

## Troubleshooting
Common issues and solutions:
```bash
# Undo last commit
git reset --soft HEAD~1

# Force push (use carefully!)
git push -f origin branch-name

# Clean untracked files
git clean -fd
```

Remember to always backup your work and be careful with force commands!

### Line-by-Line Command Explanations

```bash
git config --global user.name "Your Name"
# Sets your name for all Git repositories on your machine
# The --global flag makes this setting apply to all repositories
# Replace "Your Name" with your actual name as you want it to appear in commits

git config --global user.email "your.email@example.com"
# Sets your email for all Git repositories
# Should match your GitHub account email
# Used to link commits to your GitHub account

git init
# Creates a new Git repository in the current directory
# Initializes a .git folder to track changes
# Only needed once per project

git clone [url]
# Creates a copy of a remote repository on your local machine
# Downloads all files and history
# Automatically sets up remote tracking
```

### Understanding Git's Three Trees
> Git maintains three "trees" in its regular operation:

1. **Working Directory**
   - Contains your actual files
   - Where you make changes
   - Untracked by Git until added

2. **Staging Area (Index)**
   - Preparation area for commits
   - Files are "staged" here before committing
   - Allows selective commits

3. **Repository (HEAD)**
   - Contains all committed changes
   - Permanent history
   - Can be shared with others

## Advanced Workflow Concepts

### Branch Management Strategy
> Detailed explanation of branching strategies for different project sizes

#### For Small Projects
```bash
main (or master)
  └── feature branches
      └── bug fixes
```
- Simple, direct approach
- Suitable for solo developers or small teams
- Quick turnaround on changes

#### For Medium Projects
```bash
main
  └── develop
      ├── feature/*
      ├── bugfix/*
      └── hotfix/*
```
- More structured approach
- Separate development and production code
- Better for teams of 5-10 developers

#### For Large Projects
```bash
main
  ├── develop
  │   ├── feature/*
  │   ├── bugfix/*
  │   └── release/*
  └── hotfix/*
```
- Full GitFlow implementation
- Suitable for large teams
- Supports multiple releases

### Commit Message Best Practices
> Writing clear and useful commit messages

#### Structure
```
<type>(<scope>): <subject>

<body>

<footer>
```

#### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance tasks

#### Example
```
feat(auth): implement OAuth2 login

- Add OAuth2 authentication flow
- Create login middleware
- Add user session management

Closes #123
```

## Advanced Git Operations

### Stashing Operations
```bash
git stash save "WIP: feature description"
# Temporarily stores all modified tracked files
# WIP = Work In Progress
# Description helps identify stash later

git stash list
# Shows all stashed changes
# Format: stash@{n}: WIP on branch: message

git stash pop
# Applies most recent stash and removes it from stash list
# Can cause conflicts if changes overlap

git stash apply stash@{n}
# Applies specific stash but keeps it in the list
# Useful when you want to apply same changes multiple times
```

### Advanced Merge Strategies
```bash
git merge --strategy-option=theirs
# Automatically resolves conflicts by keeping incoming changes
# Useful when you trust the incoming changes more

git merge --no-ff
# Creates a merge commit even when fast-forward is possible
# Maintains explicit feature branch history

git merge --squash
# Combines all changes into a single commit
# Useful for cleaning up feature branch history
```

### Rebase Operations
```bash
git rebase -i HEAD~3
# Interactive rebase of last 3 commits
# Opens editor for commit manipulation

git rebase --onto main feature bugfix
# Moves bugfix branch onto main, excluding feature commits
# Useful for changing branch base
```

## GitHub-Specific Features

### Pull Request Templates
```markdown
# Pull Request Template
## Description
[Describe the changes made and why]

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests added/updated
- [ ] Manual testing performed

## Checklist
- [ ] Code follows project style
- [ ] Documentation updated
- [ ] Tests pass locally
```

### GitHub Actions Advanced Examples

#### Multi-Platform Testing
```yaml
name: Cross-Platform Tests

on: [push, pull_request]

jobs:
  test:
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
        node: [14, 16, 18]
    
    runs-on: ${{ matrix.os }}
    
    steps:
      - uses: actions/checkout@v2
      
      - name: Setup Node.js
        uses: actions/setup-node@v2
        with:
          node-version: ${{ matrix.node }}
          
      - name: Install Dependencies
        run: npm ci
        
      - name: Run Tests
        run: npm test
```

### Repository Insights
> Understanding GitHub's analytics tools

#### Code Frequency
- Shows additions and deletions over time
- Helps track project velocity
- Identifies high-activity periods

#### Network Graph
- Visualizes branch relationships
- Shows commit flow
- Helps understand merge patterns

#### Security Overview
- Dependency vulnerabilities
- Code scanning alerts
- Secret scanning status

## Best Practices for Team Collaboration

### Code Review Etiquette
1. **For Reviewers**
   - Be constructive and specific
   - Explain why changes are needed
   - Suggest solutions when possible
   - Respond promptly to reviews

2. **For Authors**
   - Keep PRs focused and small
   - Explain context and decisions
   - Respond to all comments
   - Update PR based on feedback

### Documentation Standards
1. **README.md Structure**
   ```markdown
   # Project Name
   
   ## Overview
   Brief description
   
   ## Installation
   Step-by-step guide
   
   ## Usage
   Code examples
   
   ## Contributing
   Guidelines
   
   ## License
   Terms
   ```

2. **Code Comments**
   ```javascript
   /**
    * Function description
    * @param {Type} paramName - Parameter description
    * @returns {Type} Return value description
    * @throws {ErrorType} Error description
    */
   ```