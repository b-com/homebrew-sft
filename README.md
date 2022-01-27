# homebrew-sft
b-com software factory homebrew formulae repository

## using brew-sft
To access the recipes of the b-com/homebrew-sft repository, use:
brew tap b-com/sft

## remaken
To publish a new remaken version for brew:
- on github, draft a new release targeted to the adequate commit and create a new tag
- build the release version of remaken on linux, mac os X for this commit
- deploy the binaries in the github release
- get the sha256 from the binaries
- update remaken.rb urls (with the url targeting the binary deployment url on github) and sha256 values

Minor versions (i.e. where only the last digit changes) are made in the remaken.rb (for the latest release), or in the remaken.rb@version (for older releases).
Major versions (i.e. when the two first digits are modified) are published following the workflow:
- copy the current remaken.rb as remaken@prev_version.rb (for instance, when switching from 1.9 to 2.0, copy remaken.rb to remaken.rb@1.9.  In remaken.rb@1.9, set class value to 'remakenAT19' )
- modify remaken.rb to set the new major version, urls and sha256 to the latest release.
