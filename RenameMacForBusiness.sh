#!/bin/bash

# The script captures the name, model, and serial number of the MacBook.  It then converts these into a name string
# and appleis it to the computer name of the device.  
# 
# By John Hawkins | johnhawkins3d@gmail.com


### Variables ###
Site="Replace with Company or Site Name here" # site of your business, school, or organization.  best to use abbreviations.
GetModel=$(sysctl hw.model) # Gets the model name, either Air, Pro, or Mac
AssetTag=$(ioreg -l | grep IOPlatformSerialNumber | cut -c 37-48) # Gets the serial number.  Trims between 37-48 if you want a shorter asset tag


# if statement when query returns a 'pro'
if echo "$GetModel" =~ 'Pro'; then

    MacModel='mbp'

# if statement when query returns a 'air'
elif echo "$GetModel" =~ 'Air'; then

    MacModel='mba'

# if statement when query returns a 'imac'
elif echo "$GetModel" =~ 'Mac'; then

    MacModel='mac'
    
fi

# rename mac through terminal command
scutil --set ComputerName "$Site-$MacModel-$AssetTag"
