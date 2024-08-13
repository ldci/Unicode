#! /usr/local/bin/red
Red [
	Title: "uniCodeTools"
	Author: "ldci"
	Version: 1.0
	Notes: {This code allows to generate emojis or unicode characters}
]
gui-console-ctx/terminal/color?: yes
_save-cfg

makeUnicodeFromChar: func [s [string!] c [char!] return: [string!]][
	rejoin [s form c]
]

makeUnicodeFromString: func [s [string!] c [string!] return: [string!]][
	rejoin [s c]
]

makeUnicodeFromNumber: func [s [string!] c [number!] return: [string!]][
	rejoin [s form to-char c]
]

makeUniCode: func [s [string!] c [char! string! number!] return: [string!]][
	out: ""	
	t: type? c
	if any [t = char! t = integer! t = issue!] [out: rejoin [s form to-char c]]	
	if t = string! [out: rejoin [s c]]	;if t = integer! [out: rejoin [s form to-char c]]
	out
]

makeUnicodeFromBlock: func [
	s [string!] 
	b [block!] 
	return: [string!]
][
	n: length? b
	repeat  i n [append s form to-char b/:i]
]

print "From Char"
print makeUnicodeFromChar "" #"^(2705)"
print makeUnicodeFromChar "Validate " #"^(2705)"
print "-------------------"
print "From String"
print makeUnicodeFromString "" "^(2705)"
print makeUnicodeFromString "Validate " "^(2705)"
print "-------------------"
print "From Hexadecimal Value"
print makeUnicodeFromNumber "" 2705h
print makeUnicodeFromNumber "Validate " 2705h
print "-------------------"
print "From Integer Value"
print makeUnicodeFromNumber "" 9989
print makeUnicodeFromNumber "Validate " 9989
print "-------------------"
print "From Hexadecimal Block"
print makeUnicodeFromBlock "" [1F9D1h 1F3FBh 200Dh 1F52Ch]
print makeUnicodeFromBlock "Test " [1F9D1h 1F3FBh 200Dh 1F52Ch]
print "-------------------"
print "From Char Block"                                 
print makeUnicodeFromBlock "" [#"^(1F9D1)"  #"^(1F3FB)"  #"^(200D)"  #"^(1F52C)"]     
print makeUnicodeFromBlock "Test " [#"^(1F9D1)"  #"^(1F3FB)"  #"^(200D)"  #"^(1F52C)"] 
print "-------------------"                                    
print makeUniCode "Validate" 2705h
print makeUniCode "Validate" 9989
print makeUniCode "Validate" #"^(2705)"
print makeUniCode "Validate" "^(2705)"


                                          