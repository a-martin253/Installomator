tableaudesktop)
    name="Tableau Desktop"
    type="pkgInDmg"
    packageID="com.tableausoftware.tableaudesktop"
    latestVersionURL="https://www.tableau.com/downloads/desktop/reg-mac-arm64"
    versionString=$(curl -fsIL "${latestVersionURL}" | grep -i "location" | tail -1 | sed -nE 's/.*\/TableauDesktop-([0-9.-]+)\.dmg/\1/p')
    appNewVersion=${versionString//-/.}
    if [[ $(arch) == "arm64" ]]; then
        log "Architecture is Apple Silicon (arm64), using arm64-specific download."
        downloadURL="https://www.tableau.com/downloads/desktop/reg-mac-arm64"
    else
        log "Architecture is Intel (x86_64), using Universal download."
        downloadURL="https://www.tableau.com/downloads/desktop/reg-mac"
    fi
    expectedTeamID="QJ4XPRK37C"
    ;;
