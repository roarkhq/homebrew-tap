# Roarkhq Tap

Homebrew formulae for Roark's command line tools.

## Install

```sh
brew tap roarkhq/tap
brew trust roarkhq/tap
brew install roark
```

The `brew trust` step is not optional. Homebrew refuses to load a formula from a
third-party tap until it is trusted, and without it `brew install` stops with:

```
Error: Refusing to load formula roarkhq/tap/roark from untrusted tap roarkhq/tap.
```

To trust the one formula rather than the whole tap, use
`brew trust --formula roarkhq/tap/roark`.

In a `brew bundle` `Brewfile`:

```ruby
tap "roarkhq/tap"
brew "roark"
```

## If the install fails right after a release

```
npm error notarget No matching version found for @roarkanalytics/sdk@^X.Y.Z
with a date before <yesterday>
```

Nothing is broken. Homebrew installs the CLI's dependencies with
`--min-release-age=1`, so npm refuses any package published in the last day. A
formula published the same day as the SDK it depends on cannot install until
that SDK is a day old. Wait and retry; no change to the formula is needed.

## Documentation

`brew help`, `man brew`, or [Homebrew's documentation](https://docs.brew.sh).

## For maintainers

`Formula/roark.rb` is **generated** by the `brew-formula` workflow in
[roarkhq/app-agent-codegen](https://github.com/roarkhq/app-agent-codegen), which
renders it from the OpenAPI spec and `sdk.yml`, downloads the published tarball
to compute its `sha256`, checks the dependencies are old enough for Homebrew,
and commits the result here.

Do not hand-edit it: the next release overwrites it. To publish a new version,
dispatch `brew-formula` with the version already on npm.
