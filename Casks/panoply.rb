cask "panoply" do
  arch arm: "arm64-"

  version "5.2.3"
  sha256 arm:   "3d461299692dae72b7be5f31de31b1a8854dc66bcb3774b0010be0c8b00fcae4",
         intel: "b8cfdf1098104ccfef5e0980aefbb8ca3d080845cf602fc11cf44ac837cbc16a"

  url "https://www.giss.nasa.gov/tools/panoply/download/PanoplyMacOS-#{arch}#{version}.dmg"
  name "Panoply netCDF, HDF and GRIB Data Viewer"
  desc "Plot geo-referenced data from netCDF, HDF, and GRIB"
  homepage "https://www.giss.nasa.gov/tools/panoply/"

  livecheck do
    url "https://www.giss.nasa.gov/tools/panoply/download/"
    regex(/href=.*?PanoplyMacOS[._-]#{arch}v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  app "Panoply.app"

  zap trash: [
    "~/Library/Caches/gov.nasa.giss.panoply",
    "~/Library/Preferences/gov.nasa.giss.panoply.plist",
    "~/Library/Preferences/gov.nasa.giss.Panoply.prefs.xml",
  ]

  caveats do
    depends_on_java "9+"
  end
end
