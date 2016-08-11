# vendoff

Disable/enable a Go vendor folder, with this shell script.

## Usage

### init your repo

_Initialise your .gitignore file, by ignoring _novendor._

	vendoff.sh init

### Switch `off` vendor folder

_Move vendor to _novendor. Temporarily ignore changes (removal of 'vendor') in your repo, using 'skip-worktree'._

	vendoff.sh off

### Switch vendor folder back `on`.

_Move _novendor back to vendor. Remove the 'skip-worktree' options from the vendor folder_

	vendoff.sh on

## Why?

 * Easily experiment with different versions of dependencies. 
 * You may want to try out a new/experimental version of a dependency - check that everything works, and then back out.
 * For me this is part of my workflow. I commonly use a shared repo alongside a range of dependent projects. It is important to test changes locally.

## Why now?

 * GO15VENDOREXPERIMENT will be removed in Go1.7. 
 * I used to use this environment variable to acheive a similar thing - it's not available any longer!
 * See https://github.com/golang/go/issues/16562 for the issue I reported about this.

## Caveats

 * This works with git only.
 * This is intended to be used with tools like `godep`, `glide`, `govendor`, etc. Obviously don't try running these tools while you have your dependencies in the _novendor folder.
 * I don't think it works with git submodules, but it might. YMMV.
 * Experimental, yada yada.
