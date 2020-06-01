# Rename MacBooks for Businesses and Organizations.

The script captures the name, model, and serial number of the MacBook.  It then converts these into a name string and applies renames the computer to the string that was captured.  The output for the name should be "OrgName-Model-SerialNumber".  For example, a MacBook Pro owned by Bob's Hosting Services, with a Serial number of 123456790 will be renamed to "bhs-mbp-1234567890".  There is a line in the script where you can change the businessname to any of your choice, and in addition to that, you can shorten the length of the serial number by cutting some numbers off as well.

For example, to change the name of the computer, go to Site in the Script, and alter the area inside the paranthesis:

# Site="Replace with Company or Site Name here"

Lastly, to alter the length of the serial number, change ending of 37-48, to be a number between 37-38 to 37-48.

# AssetTag=$(ioreg -l | grep IOPlatformSerialNumber | cut -c 37-48) 
