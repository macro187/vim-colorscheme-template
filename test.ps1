# Copyright (c)
# Ron MacNeil <macro@hotmail.com>
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.


""
"This file is for exercising Powershell syntax highlighting"
""
exit 0


#
# Variables
#
$unprefixed_variable
${brace_delimited_unprefixed_variable}
$foo:provider_prefixed_variable
${foo:brace_delimited_provider_prefixed_variable}
$private:scope_prefixed_variable
${private:brace_delimited_scope_prefixed_variable}


#
# Numeric Literals
#
- 2.345
-2.345
-1
-0.5
-.5
-0
0
.5
0.5
1
2.345

- 0xFF
-0xFF
-0xAA
-0x99
-0x00
0x00
0x99
0xAA
0xFF


#
# Not Quite Numeric Literals
#
1.1.1
-1.1.1
0xGG
-0xGG


#
# String Literals
#
"Quote-delimited string containing a $interpolated_variable"
"Quote-delimited string containing a ${interpolated_variable}"
"Quote-delimited string containing a $provider:prefixed_interpolated_variable"
"Quote-delimited string containing a ${provider:prefixed_interpolated_variable}"
"Quote-delimited string containing a $private:scope_prefixed_interpolated_variable"
"Quote-delimited string containing a ${private:scope_prefixed_interpolated_variable}"

"Quote-delimited string containing an arbitrary interpolated expression: 1+1 = $(1+1)"

'Apostrophe-delimited string containing what $looks_like_an_interpolated_variable_but_isnt'

@"
Quote-delimited multi-line here string
containing $interpolated_variables and
also ${brace_delimited_interpolated_variables} and
also $provider:prefixed_interpolated_variables and
also ${brace:delimited_provider_prefixed_interpolated_variables} and
also $private:scope_prefixed_interpolated_variables and
also ${private:brace_delimited_scope_prefixed_interpolated_variables}
"@

@'
Apostrophe-delimited multi-line here string
containing what $looks_like_an_interpolated_variable_but_isnt
'@


#
# Properties
#
$something.SomeProperty
${something}.SomeProperty
($something).SomeProperty
[SomeType]::SomeStaticProperty


#
# Methods
#
$something.SomeMethod($a, $b)
${something}.SomeMethod($a, $b)
($something).SomeMethod($a, $b)
[SomeType]::SomeStaticMethod($a, $b)


#
# Types
#
[string] $languageType
[System.IO.Stream] $dotNetType
[System.Collections.Generic.Dictionary[string,string]] $genericType
[_Foo] $typeBeginningWithUnderscore


#
# Not Quite Types
#
[3Abcde] $doesNotBeginWithLetterOrUnderscore
[Foo Bar] $containsWhitespace
[Foo:Bar] $containsInvalidCharacter


#
# Arrays
#
$a = 1, 2, 3
$a = @(1, 2, 3)
$a[0]
$a[100]
($a)[0]
($a)[100]


#
# Hashtables
#
$h = @{key1="value1";key2="value2"}

$h = @{"key1"="value1";"key2"="value2"}

$h = @{
    key1 = "value1"
    key2 = "value2"
}

$h = @{
    "key1" = "value1"
    "key2" = "value2"
}

$h["key1"]
$h.key2


#
# .SYNOPSIS
# Line-commented documentation block
#
# .DESCRIPTION
# Lorem ipsum
#
# .PARAMETER Param1
# Lorem ipsum
#
# .PARAMETER Param2
# Lorem ipsum
#


<#
.SYNOPSIS
Block-commented documentation block

.DESCRIPTION
Lorem ipsum

.PARAMETER Param1
Lorem ipsum

.PARAMETER Param2
Lorem ipsum
#>


#
# Script Parameter Block
#
param (
    [Parameter(Mandatory=$true,Position=0)]
    [ValidateNotNullOrEmpty]
    [string]
    $Param1,

    [string]
    $Param2
)


#
# Functions
#
function SomeFunction() { }

function SomeFunction(
    [string]
    $Param1,

    [string]
    $Param2,

    [switch]
    $Param3
)
{
}

SomeFunction $arg1 $arg2 -Param3
SomeFunction $arg1 $arg2 -Param3:$false
SomeFunction -Param1 $arg1 -Param3 -Param2 $arg2
SomeFunction -Param1 $arg1 -Param3:$false -Param2 $arg2
Some-Dash-Separated-Function $arg1 $arg2 -Param3


#
# Cmdlets
#
Verb-Subject $arg1 $arg2 -Param3
Verb-Subject $arg1 $arg2 -Param3:$false
Verb-Subject -Param1 $arg1 -Param3 -Param2 $arg2
Verb-Subject -Param1 $arg1 -Param3:$false -Param2 $arg2

