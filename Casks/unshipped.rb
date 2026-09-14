cask "unshipped" do
  version "0.5.0"
  sha256 "57b5dfad069e91ddc16bc7510b1c44d02bce666341feeaa2d315ce7f8d8975ed"

  url "https://github.com/Jonezzyboy/unshipped/releases/download/v#{version}/unshipped_#{version}_arm64.dmg"
  name "unshipped"
  desc "Shows which GitHub repos have commits waiting on a release"
  homepage "https://github.com/Jonezzyboy/unshipped"

  depends_on arch: :arm64
  depends_on formula: "gh"
  depends_on macos: :big_sur

  app "unshipped.app"

  # Ad-hoc signed rather than notarised, so Gatekeeper blocks first launch
  # otherwise. Drop once the build carries a Developer ID signature.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/unshipped.app"],
        writable_paths: ["unshipped.app"],
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
