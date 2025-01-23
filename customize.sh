###################
# ML Unlocker v3.0 
###################
SKIPUNZIP=1

# Note
ui_print " Take Note: ML Unlocker v3.0 works only if you activate"
sleep 0.5
ui_print " in Termux/Material Terminal. For more info, execute"
sleep 0.5
ui_print " 𝐬𝐮 -𝐜 𝐦𝐥𝐮𝐧𝐥𝐨𝐜𝐤𝐞𝐫 or 𝐬𝐮 first then 𝐦𝐥𝐮𝐧𝐥𝐨𝐜𝐤𝐞𝐫 ."
sleep 10 mo

# Unzip files
ui_print "- Unzipping files..."
sleep 1
unzip -oj "$ZIPFILE" module.prop mlunlocker -d "$TMPDIR" >&2

# Detect system xbin folder if exist and create path in MODPATH
ui_print "- Detecting xbin folder in system..."
sleep 1
if [ -d /system/xbin ]; then
  ui_print "✓xbin folder detected!"
  ui_print "- Creating xbin folder in MODPATH"
  mkdir -p "$MODPATH"/system/xbin
else
  ui_print "✓xbin folder not detected!"
  # Create bin path in MODPATH
  ui_print "- Creating bin folder in MODPATH"
  mkdir -p "$MODPATH"/system/bin
fi

# Extract module files
ui_print "- Extracting module files..."
sleep 1
cp -af "$TMPDIR"/module.prop "$MODPATH"/module.prop
if [ -d /system/xbin ]; then
  cp -af "$TMPDIR"/mlunlocker "$MODPATH"/system/xbin/mlunlocker
else
  cp -af "$TMPDIR"/mlunlocker "$MODPATH"/system/bin/mlunlocker
fi

# Setting Permissions
ui_print "- Setting permissions..."
sleep 1
if [ -d "$MODPATH"/system/xbin ]; then
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  set_perm "$MODPATH"/system/xbin/ 0 2000 751
  set_perm "$MODPATH"/system/xbin/mlunlocker 0 2000 755
else
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  set_perm "$MODPATH"/system/bin/ 0 2000 751
  set_perm "$MODPATH"/system/bin/mlunlocker 0 2000 755
fi

#===============================
# End of customize.sh
# Modified by @preparetodietm
#===============================
