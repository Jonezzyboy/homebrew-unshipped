cask "unshipped" do
  version "0.24.1"
  sha256 "2ed58714c4bb27a8ccded52de66401561938509b56aea9a4fa1a446ac2108858"

  url "https://github.com/Jonezzyboy/unshipped/releases/download/v#{version}/unshipped_#{version}_arm64.dmg"
  name "Unshipped"
  desc "Shows which GitHub repos have commits waiting on a release"
  homepage "https://github.com/Jonezzyboy/unshipped"

  depends_on arch: :arm64
  depends_on formula: "gh"
  depends_on macos: :big_sur

  app "Unshipped.app"

  # Ad-hoc signed rather than notarised, so Gatekeeper blocks first launch
  # otherwise. Drop once the build carries a Developer ID signature.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Unshipped.app"],
        writable_paths: ["Unshipped.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/com.alanjones.unshipped",
    "~/Library/Caches/com.alanjones.unshipped",
    "~/Library/HTTPStorages/com.alanjones.unshipped",
    "~/Library/Saved Application State/com.alanjones.unshipped.savedState",
    "~/Library/WebKit/com.alanjones.unshipped",
  ]
end
