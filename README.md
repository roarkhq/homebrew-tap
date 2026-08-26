# Roarkhq Tap

## How do I install these formulae?

`brew install roarkhq/tap/<formula>`

Or `brew tap roarkhq/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "roarkhq/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## For maintainers

Add formula files (`.rb`) under `Formula/`. Open a PR: the `brew test-bot`
workflow builds and tests it, then bottles can be published with
`brew pr-pull` (or the `publish.yml` workflow). See
[How to Create and Maintain a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap).
