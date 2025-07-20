{ inputs, pkgs, ... }:

{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  programs.zen-browser = {
    enable = true;

    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    policies = let
      locked = value: {
        Value = value;
        Status = "locked";
      };
    in {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true; # save webs for later reading
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = {
        "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/github-file-icons/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      Preferences = builtins.mapAttrs (_: locked) {
        "browser.tabs.warnOnClose" = false;
        "zen.widget.linux.transparency" = true;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
      };
    };
  };
}
