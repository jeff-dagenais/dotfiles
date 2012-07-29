# Set-Up OSX
echo "Update Software"
sudo softwareupdate --download --all --install

echo "Set Computer Name, Local Host Name and Host Name"
sudo scutil --set ComputertName riot
sudo scutil --set LocalHostName riot
sudo scutil --set HostName riot

echo "Menu bar: hide the useless Time Machine and Volume icons"
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

#
# Terminal Shit
# -----------------
echo "Custom Terminal Prompt"
export PS1="\u@\h:\W \\$ " 

echo "Use the Pro theme by default in Terminal.app"
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

echo "Remove the `Last login` message from the Terminal"
touch .hushlogin

echo "General OS environment settings"
export EDITOR="sublime -w"
export GIT_EDITOR=EDITOR

echo "Expand save and print panels by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Disable Resume system-wide"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

echo "Use AirDrop over every interface. Srsly this should be a default."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

echo "Always open everything in Finder's list view. This is important."
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

#
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
# ---------------------------------------------------------------

echo "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int .5

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Enable text selection in QuickLook"
defaults write com.apple.finder QLEnableTextSelection -boolean true

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

#
# Screen
# ----------
echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Set desktop icons."
# Label on Bottom
/usr/libexec/PlistBuddy -c "Delete :DesktopViewSettings:IconViewSettings:labelOnBottom" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:labelOnBottom bool false" ~/Library/Preferences/com.apple.finder.plist
# Grid Spacing (100)
/usr/libexec/PlistBuddy -c "Delete :DesktopViewSettings:IconViewSettings:gridSpacing" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:gridSpacing integer 100" ~/Library/Preferences/com.apple.finder.plist
# Icon Size (32)
/usr/libexec/PlistBuddy -c "Delete :DesktopViewSettings:IconViewSettings:iconSize" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:iconSize integer 32" ~/Library/Preferences/com.apple.finder.plist
# Show Preview
/usr/libexec/PlistBuddy -c "Delete :DesktopViewSettings:IconViewSettings:showIconPreview" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:showIconPreview bool true" ~/Library/Preferences/com.apple.finder.plist
# Show Item Info
/usr/libexec/PlistBuddy -c "Delete :DesktopViewSettings:IconViewSettings:showItemInfo" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:showItemInfo bool true" ~/Library/Preferences/com.apple.finder.plist
# Text Size (10)
/usr/libexec/PlistBuddy -c "Delete :DesktopViewSettings:IconViewSettings:textSize" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:textSize integer 10" ~/Library/Preferences/com.apple.finder.plist
# View Options Version
/usr/libexec/PlistBuddy -c "Delete :DesktopViewSettings:IconViewSettings:viewOptionsVersion" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:viewOptionsVersion bool none" ~/Library/Preferences/com.apple.finder.plist
# Arrange by Kind
/usr/libexec/PlistBuddy -c "Delete :DesktopViewSettings:IconViewSettings:arrangeBy" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:arrangeBy string kind" ~/Library/Preferences/com.apple.finder.plist
# Column Width (320)
/usr/libexec/PlistBuddy -c "Delete :StandardViewOptions:ColumnViewOptions:ColumnWidth" ~/Library/Preferences/com.apple.finder.plist 
/usr/libexec/PlistBuddy -c "Add :StandardViewOptions:ColumnViewOptions:ColumnWidth integer 320" ~/Library/Preferences/com.apple.finder.plist

echo "Set New Window Path"
/usr/libexec/PlistBuddy -c "Delete :NewWindowTargetPath" ~/Library/Preferences/com.apple.finder.plist 
/usr/libexec/PlistBuddy -c "Add :NewWindowTargetPath string $HOME" ~/Library/Preferences/com.apple.finder.plist

echo "Show Hard Drives on Desktop. Hide Removable Media on Desktop."
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "Show Pathbar and Status Bar in Finder"
/usr/libexec/PlistBuddy -c "Delete :ShowPathbar" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Add :ShowPathbar bool true" ~/Library/Preferences/com.apple.finder.plist
defaults write com.apple.finder ShowStatusBar -bool true

echo "Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Remove Dropbox’s green checkmark icons in Finder"
file=/Applications/Dropbox.app/Contents/Resources/check.icns
[ -e "$file" ] && mv -f "$file" "$file.bak"
unset file

#
# Sidebar
# ----------------------
echo "Set Sidebar Favorites: Show Removable. HardDisks, Ejectables, Servers"
/usr/libexec/PlistBuddy -c "Delete :favorites:ShowRemovable" ~/Library/Preferences/com.apple.sidebarlists.plist
/usr/libexec/PlistBuddy -c "Add :favorites:ShowRemovable bool true" ~/Library/Preferences/com.apple.sidebarlists.plist
/usr/libexec/PlistBuddy -c "Delete :favorites:ShowHardDisks" ~/Library/Preferences/com.apple.sidebarlists.plist
/usr/libexec/PlistBuddy -c "Add :favorites:ShowHardDisks bool true" ~/Library/Preferences/com.apple.sidebarlists.plist
/usr/libexec/PlistBuddy -c "Delete :favorites:ShowEjectables" ~/Library/Preferences/com.apple.sidebarlists.plist
/usr/libexec/PlistBuddy -c "Add :favorites:ShowEjectables bool true" ~/Library/Preferences/com.apple.sidebarlists.plist
/usr/libexec/PlistBuddy -c "Delete :favorites:ShowServers" ~/Library/Preferences/com.apple.sidebarlists.plist
/usr/libexec/PlistBuddy -c "Add :favorites:ShowServers bool true" ~/Library/Preferences/com.apple.sidebarlists.plist

#
# Dock & hot corners
# ----------------------
echo "Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilte-stack -bool true

echo "Set the icon size of Dock items to 24 pixels"
defaults write com.apple.dock tilesize -int 24

echo "Enable spring loading for all Dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo "Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

echo "Enable the 2D Dock"
defaults write com.apple.dock no-glass -bool true

echo "Reset Launchpad"
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete

echo "Set-Up Hot corners"
# Bottom left screen corner → Mission Control
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom right screen corner → Start screen saver
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

#
# Safari
# ----------
echo "Safari - Always Open in Tabs"
defaults write com.apple.Safari TabCreationPolicy -int 2

echo "Safari - Show Status Bar"
defaults write com.apple.Safari ShowStatusBar -bool true

echo "Set Home Page to Github"
defaults write com.apple.Safari HomePage -string https://github.com

echo "Safari New Window Behavior"
defaults write com.apple.Safari NewWindowBehavior -int 0

echo "Safari New Tab Behavior"
defaults write com.apple.Safari NewTabBehavior -int 2

echo "SafariGeolocationPermissionPolicy"
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 1

echo "Disable Safari's Auto Open Safe Downloads"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

echo "Disable Safari’s thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo "Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

echo "Remove useless icons from Safari’s bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo "Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
# Address Book, Dashboard, iCal, iTunes, Mail, and Disk Utility               #
###############################################################################

echo "Enable the debug menu in Address Book, iCal & Disk Utility"
defaults write com.apple.addressbook ABShowDebugMenu -bool true
defaults write com.apple.iCal IncludeDebugMenu -bool true
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

echo "Disable the iTunes arrow links and Ping completely"
defaults write com.apple.iTunes show-store-arrow-links -bool true
defaults write com.apple.iTunes disablePingSidebar -bool true
defaults write com.apple.iTunes disablePing -bool true

echo "Make ⌘ + F focus the search input in iTunes"
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

echo "Copy email addresses as foo@example.com instead of Foo Bar <foo@example.com> in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

###############################################################################
# Terminal                                                                    #
###############################################################################

echo "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

###############################################################################
# Time Machine                                                                #
###############################################################################

echo "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Disable local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer; do
	killall "$app" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."