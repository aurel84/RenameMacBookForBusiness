#!/bin/bash

# The script captures the name, model, and serial number of the MacBook.  
# It then converts these into a name string and applies renames the computer 
# to the string that was captured.
#
# By John Hawkins | johnhawkins3d@gmail.com


### Variables ###
ComputerName=$(scutil --get ComputerName) # query the computer name
Site="Replace with Company or Site Name here" # site of your business, school, or organization.  best to use abbreviations.
GetModel=$(sysctl hw.model) # Gets the model name, either Air, Pro, or Mac
AssetTag=$(ioreg -l | grep IOPlatformSerialNumber | cut -c 37-48) # Gets the serial number.  Trims between 37-48 if you want a shorter asset tag


# if statement when query returns a 'pro'

echo "Determining the Computer Name for the MacBoook..."

if echo "$GetModel" =~ 'Pro'; then

    MacModel='mbp'

# if statement when query returns a 'air'
elif echo "$GetModel" =~ 'Air'; then

    MacModel='mba'

# if statement when query returns a 'imac'
elif echo "$GetModel" =~ 'Mac'; then

    MacModel='mac'
    
fi

echo "The MacBook model is $GetModel".

# rename mac through terminal command

echo "Now renaming the MacBook..."

scutil --set ComputerName "$Site-$MacModel-$AssetTag"

echo "The MacBook has been renamed to $ComputerName."
