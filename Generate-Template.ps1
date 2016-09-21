# ------------------------------------------------------------------------------
# Copyright (c) Ron MacNeil <macro@hotmail.com>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# ------------------------------------------------------------------------------


#
# .SYNOPSIS
# Generate Vim color scheme template
#


$outfile = "$PSScriptRoot\template.vim"


function Out([string] $s)
{
    $s = $s.Replace("`r`n", "`n")
    $s = $s.Replace("`r", "`n")
    $s += "`n"
    [System.IO.File]::AppendAllText($outfile, $s)
}


function Debug($s)
{
    [Console]::Error.WriteLine($s)
}


if (Test-Path $outfile) {
    Remove-Item -Force $outfile
}


#
# Names of colors 0-7
#
$colors =
    "Black",
    "Red",
    "Green",
    "Yellow",
    "Blue",
    "Magenta",
    "Cyan",
    "White"


#
# Names of light colors 8-15
#
$lightColors = @(
    $colors |
    %{ "Light$_" }
    )


#
# 16 color name -> number lookup tables (for 16 and 256 color terminals)
#
$colorNumbers16 = @{}
$colorNumbers256 = @{}
$i = 0
foreach ($c in $colors) {
    $colorNumbers16[$c]             = $i
    $colorNumbers16["Light$c"]      = $i
    $colorNumbers256[$c]           = $i
    $colorNumbers256["Light$c"]    = $i + 8
    $i++
}


#
# 16 color name -> hex RGB lookup table (for GUI)
#
$colorHex = @{
    Black           = "#000000"
    Red             = "#800000"
    Green           = "#008000"
    Yellow          = "#808000"
    Blue            = "#000080"
    Magenta         = "#800080"
    Cyan            = "#008080"
    White           = "#C0C0C0"
    LightBlack      = "#808080"
    LightRed        = "#FF0000"
    LightGreen      = "#00FF00"
    LightYellow     = "#FFFF00"
    LightBlue       = "#0000FF"
    LightMagenta    = "#FF00FF"
    LightCyan       = "#00FFFF"
    LightWhite      = "#FFFFFF"
}


#
# 256 color hex RGB (for GUI)
#
$color256Hex =
    "#000000",
    "#800000",
    "#008000",
    "#808000",
    "#000080",
    "#800080",
    "#008080",
    "#C0C0C0",
    "#808080",
    "#FF0000",
    "#00FF00",
    "#FFFF00",
    "#0000FF",
    "#FF00FF",
    "#00FFFF",
    "#FFFFFF",
    "#000000",
    "#00005F",
    "#000087",
    "#0000AF",
    "#0000D7",
    "#0000FF",
    "#005F00",
    "#005F5F",
    "#005F87",
    "#005FAF",
    "#005FD7",
    "#005FFF",
    "#008700",
    "#00875F",
    "#008787",
    "#0087AF",
    "#0087D7",
    "#0087FF",
    "#00AF00",
    "#00AF5F",
    "#00AF87",
    "#00AFAF",
    "#00AFD7",
    "#00AFFF",
    "#00D700",
    "#00D75F",
    "#00D787",
    "#00D7AF",
    "#00D7D7",
    "#00D7FF",
    "#00FF00",
    "#00FF5F",
    "#00FF87",
    "#00FFAF",
    "#00FFD7",
    "#00FFFF",
    "#5F0000",
    "#5F005F",
    "#5F0087",
    "#5F00AF",
    "#5F00D7",
    "#5F00FF",
    "#5F5F00",
    "#5F5F5F",
    "#5F5F87",
    "#5F5FAF",
    "#5F5FD7",
    "#5F5FFF",
    "#5F8700",
    "#5F875F",
    "#5F8787",
    "#5F87AF",
    "#5F87D7",
    "#5F87FF",
    "#5FAF00",
    "#5FAF5F",
    "#5FAF87",
    "#5FAFAF",
    "#5FAFD7",
    "#5FAFFF",
    "#5FD700",
    "#5FD75F",
    "#5FD787",
    "#5FD7AF",
    "#5FD7D7",
    "#5FD7FF",
    "#5FFF00",
    "#5FFF5F",
    "#5FFF87",
    "#5FFFAF",
    "#5FFFD7",
    "#5FFFFF",
    "#870000",
    "#87005F",
    "#870087",
    "#8700AF",
    "#8700D7",
    "#8700FF",
    "#875F00",
    "#875F5F",
    "#875F87",
    "#875FAF",
    "#875FD7",
    "#875FFF",
    "#878700",
    "#87875F",
    "#878787",
    "#8787AF",
    "#8787D7",
    "#8787FF",
    "#87AF00",
    "#87AF5F",
    "#87AF87",
    "#87AFAF",
    "#87AFD7",
    "#87AFFF",
    "#87D700",
    "#87D75F",
    "#87D787",
    "#87D7AF",
    "#87D7D7",
    "#87D7FF",
    "#87FF00",
    "#87FF5F",
    "#87FF87",
    "#87FFAF",
    "#87FFD7",
    "#87FFFF",
    "#AF0000",
    "#AF005F",
    "#AF0087",
    "#AF00AF",
    "#AF00D7",
    "#AF00FF",
    "#AF5F00",
    "#AF5F5F",
    "#AF5F87",
    "#AF5FAF",
    "#AF5FD7",
    "#AF5FFF",
    "#AF8700",
    "#AF875F",
    "#AF8787",
    "#AF87AF",
    "#AF87D7",
    "#AF87FF",
    "#AFAF00",
    "#AFAF5F",
    "#AFAF87",
    "#AFAFAF",
    "#AFAFD7",
    "#AFAFFF",
    "#AFD700",
    "#AFD75F",
    "#AFD787",
    "#AFD7AF",
    "#AFD7D7",
    "#AFD7FF",
    "#AFFF00",
    "#AFFF5F",
    "#AFFF87",
    "#AFFFAF",
    "#AFFFD7",
    "#AFFFFF",
    "#D70000",
    "#D7005F",
    "#D70087",
    "#D700AF",
    "#D700D7",
    "#D700FF",
    "#D75F00",
    "#D75F5F",
    "#D75F87",
    "#D75FAF",
    "#D75FD7",
    "#D75FFF",
    "#D78700",
    "#D7875F",
    "#D78787",
    "#D787AF",
    "#D787D7",
    "#D787FF",
    "#D7AF00",
    "#D7AF5F",
    "#D7AF87",
    "#D7AFAF",
    "#D7AFD7",
    "#D7AFFF",
    "#D7D700",
    "#D7D75F",
    "#D7D787",
    "#D7D7AF",
    "#D7D7D7",
    "#D7D7FF",
    "#D7FF00",
    "#D7FF5F",
    "#D7FF87",
    "#D7FFAF",
    "#D7FFD7",
    "#D7FFFF",
    "#FF0000",
    "#FF005F",
    "#FF0087",
    "#FF00AF",
    "#FF00D7",
    "#FF00FF",
    "#FF5F00",
    "#FF5F5F",
    "#FF5F87",
    "#FF5FAF",
    "#FF5FD7",
    "#FF5FFF",
    "#FF8700",
    "#FF875F",
    "#FF8787",
    "#FF87AF",
    "#FF87D7",
    "#FF87FF",
    "#FFAF00",
    "#FFAF5F",
    "#FFAF87",
    "#FFAFAF",
    "#FFAFD7",
    "#FFAFFF",
    "#FFD700",
    "#FFD75F",
    "#FFD787",
    "#FFD7AF",
    "#FFD7D7",
    "#FFD7FF",
    "#FFFF00",
    "#FFFF5F",
    "#FFFF87",
    "#FFFFAF",
    "#FFFFD7",
    "#FFFFFF",
    "#080808",
    "#121212",
    "#1C1C1C",
    "#262626",
    "#303030",
    "#3A3A3A",
    "#444444",
    "#4E4E4E",
    "#585858",
    "#626262",
    "#6C6C6C",
    "#767676",
    "#808080",
    "#8A8A8A",
    "#949494",
    "#9E9E9E",
    "#A8A8A8",
    "#B2B2B2",
    "#BCBCBC",
    "#C6C6C6",
    "#D0D0D0",
    "#DADADA",
    "#E4E4E4",
    "#EEEEEE"


Out @'
" Copyright (c)
" Ron MacNeil <macro@hotmail.com>
"
" Permission to use, copy, modify, and distribute this software for any purpose
" with or without fee is hereby granted, provided that the above copyright
" notice and this permission notice appear in all copies.
"
" THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
" REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
" AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
" INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
" LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
" OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
" PERFORMANCE OF THIS SOFTWARE.
'@


Out @'


set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="YOUR_COLOR_SCHEME_NAME"
'@


Out @'


"
" 16-color combinations for 16-color terminal
"
'@
foreach ($f in $colors) {
    foreach ($b in $colors) {
        $fnum = $colorNumbers16[$f]
        $bnum = $colorNumbers16[$b]
        Out "let ${f}On${b} = ' ctermfg=$fnum ctermbg=$bnum cterm=NONE'"
    }
}
foreach ($f in $lightColors) {
    foreach ($b in $colors) {
        $fnum = $colorNumbers16[$f]
        $bnum = $colorNumbers16[$b]
        Out "let ${f}On${b} = ' ctermfg=$fnum ctermbg=$bnum cterm=bold'"
    }
}
foreach ($f in $colors) {
    foreach ($b in $lightColors) {
        $fnum = $colorNumbers16[$f]
        $bnum = $colorNumbers16[$b]
        Out "let ${f}On${b} = ' ctermfg=$bnum ctermbg=$fnum cterm=bold,reverse'"
    }
}


Out @'


"
" 16-color combinations for 256-color terminal, plus individual 256-color
" foreground and background colors
"
'@
Out "if &t_Co > 16"
foreach ($f in $lightColors) {
    foreach ($b in $colors) {
        $fnum = $colorNumbers256[$f]
        $bnum = $colorNumbers256[$b]
        Out "let ${f}On${b} = ' ctermfg=$fnum ctermbg=$bnum cterm=NONE'"
    }
}
foreach ($f in $colors) {
    foreach ($b in $lightColors) {
        $fnum = $colorNumbers256[$f]
        $bnum = $colorNumbers256[$b]
        Out "let ${f}On${b} = ' ctermfg=$fnum ctermbg=$bnum cterm=NONE'"
    }
}
foreach ($c in ($colors + $lightColors)) {
    $cnum = $colorNumbers256[$c]
    Out "let Fg$c = ' ctermfg=$cnum' | let Bg$c = ' ctermbg=$cnum'"
}
for ($i = 0; $i -lt 256; $i++) {
    Out "let Fg$i = ' ctermfg=$i' | let Bg$i = ' ctermbg=$i'"
}
Out "endif"


Out @'


"
" 16-color combinations and individual 256-color foreground and background
" colors for GUI
"
'@
Out "if has(`"gui_running`")"
foreach ($f in $colors) {
    foreach ($b in $colors) {
        $fhex = $colorHex[$f]
        $bhex = $colorHex[$b]
        Out "let ${f}On${b} = ' guifg=$fhex guibg=$bhex gui=NONE'"
    }
}
foreach ($f in $lightColors) {
    foreach ($b in $colors) {
        $fhex = $colorHex[$f]
        $bhex = $colorHex[$b]
        Out "let ${f}On${b} = ' guifg=$fhex guibg=$bhex gui=NONE'"
    }
}
foreach ($f in $colors) {
    foreach ($b in $lightColors) {
        $fhex = $colorHex[$f]
        $bhex = $colorHex[$b]
        Out "let ${f}On${b} = ' guifg=$fhex guibg=$bhex gui=NONE'"
    }
}
foreach ($c in ($colors + $lightColors)) {
    $cnum = $colorNumbers256[$c]
    $hex = $color256Hex[$cnum]
    Out "let Fg$c = ' guifg=$hex' | let Bg$c = ' guibg=$hex'"
}
for ($i = 0; $i -lt 256; $i++) {
    $hex = $color256Hex[$i]
    Out "let Fg$i = ' guifg=$hex' | let Bg$i = ' guibg=$hex'"
}
Out "endif"


Out @'


"
" 16-Color Scheme
"
" Instructions: Define complete color scheme using 16-color combinations.
"
" exe 'hi Normal' .WhiteOnBlack
" ...
"
'@


Out @'


"
" 256-Color Scheme
"
" Instructions: Override differences from 16-color scheme using 256-color
" foreground colors, background colors, and cterm settings.
"
if &t_Co > 16 || has("gui_running")
" exe 'hi Normal' .Fg59 .Bg234 .' cterm=italic'
" ...
endif
'@


Out @'


"
" GUI Scheme
"
" Instructions: Override differences from 256-color scheme using guifg, guibg,
" and gui settings.
"
if has("gui_running")
" exe 'hi Normal' .' guifg=#99AA8A' .' guibg=#22282A' .' gui=italic'
" ...
endif

'@

