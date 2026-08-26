# Generated from our OpenAPI spec by app-agent-codegen. Do not edit.
#
# Publish by copying this into roarkhq/homebrew-tap as Formula/roark.rb.

class Roark < Formula
  desc "Command line interface for the Roark Analytics API"
  homepage "https://github.com/roarkhq/sdk-roark-analytics-node/tree/main/packages/cli"
  url "https://registry.npmjs.org/@roarkanalytics/cli/-/cli-0.1.1.tgz"
  sha256 "9730a1d06dd496f79942ffede9dfa4b023c1fc95ef26fa0ef1a13a04eebcfd92"
  license "Apache-2.0"
  version "0.1.1"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]

    # The man pages ship inside the package; without this they are installed but
    # unreachable, and `man roark` finds nothing.
    man1.install Dir["#{libexec}/lib/node_modules/@roarkanalytics/cli/man/*.1"]
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/roark --version")

    # Exercises the command tree without needing a credential: --help must work
    # for a nested command, which is what catches a broken install rather than a
    # merely present one.
    assert_match "Usage:", shell_output("#{bin}/roark agent create --help")
  end
end
