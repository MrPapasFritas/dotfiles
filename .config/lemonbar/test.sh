source ./panel_config
source ./panel_icons
source ./panel_colors

stat=$(acpi -b | awk '{print $3}' | cut -d ',' -f1)
batery=$(acpi -b | grep -P -o '[0-9]+(?=%)')
if [ $stat == "Charging" ]; then
	ICON=$(pIcon "#b0a9ab" $CAC)
	batery="AC"
	por=""
else
	por="% "
	if [ $batery -gt 90 ]; then
		ICON=$(pIcon "#b0a9ab" $BAT100)
	elif [ $batery -gt 70 ] && [ $batery -lt 90 ]; then
		ICON=$(pIcon "#b0a9ab" $BAT75)
	elif [ $batery -gt 50 ] && [ $batery -lt 70 ]; then
		ICON=$(pIcon "#b0a9ab" $BAT50)
	elif [ $batery -gt 30 ] && [ $batery -lt 50 ]; then
		ICON=$(pIcon "#b0a9ab" $BAT25)
	elif [ $batery -gt 15 ] && [ $batery -lt 30 ]; then
		ICON=$(pIcon "#b0a9ab" $BAT25)
	elif [ $batery -lt 15 ]; then
		ICON=$(pIcon "#b0a9ab" $BAT0)
	fi
fi
echo -e "${ICON} ${batery}${por}"
OUTPUT=$(echo -e "${ICON} ${batery}${por}")
clr=$(pTextUnderline ${COLOR_DEFAULT_FG} ${COLOR_BATERY_FG} "${OUTPUT}")
echo -e "${clr}"
