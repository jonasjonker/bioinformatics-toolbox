# Vim basics

Vim is a powerfull command line text editor that is installed on most linux
systems and is available for windows and mac.
The power of Vim lies in the fact that it is very _good at editing_ files.

_In this document keystrokes will be indicated like this:_ [**ESC**] _in case of
specific keys, or like_ [**\<somekey>**] _for general cases. key combinations will be represented like_ [**dd**] _or like_ [**CTRL**+**r**] _to prevent ambiguity._

Vim has four modes:
|  modes  | key       |
|    ---: | :---      |
| normal  | [**ESC**] |
| command | [**:**]   |
| editing | [**i**]   |
| visual  | [**v**]   |

What can be confusing for beginners is that you start in _normal mode_, but that
*you can't write text in normal mode.* This might seem weird at first, it is actually quite usefull, since editing is mostly done in _normal mode_. Before we dive into how _normal_ mode works



## movement
h   - left
j   - down
k   - up
l   - right

w   - to start of Word on the right
e   - to End of word on the right
b   - to start of word on the left
ge  - to end of word on the left
zz  - center of line

L   - go to bottom screen
M   - go to middel screen
H   - go to top screen


^   - start of line
$   - end of line

gg  - top of file
G   - bottom of file

{   - paragraph up
}   - paragraph down
(   - sentence up
)   - sentence down
[[  - previous sectiom
]]  - next section
[]  - end of previous section
][  - en of next section

%   - toggle between brackets
:<#>- go to line number

t   - to <letter>
;   - repeat
/   - to <string>
*   - to next occurence of selected word
n   - repeat ; or *


## inner keyword
diw - delete in word
ci" - change in quotes
dip - delete paragraph
ci> - change between <>

## copy paste
y           - yank <movement>
yy          - yank entire line
p           - paste

"<letter>yy - yank entire line to register <letter>
"<LETTER>yy - append yank to register <letter>
"<letter>P  - paste from register <letter>
"+p         - paste from system clipboard

## commands

:%<sed> - sed like search replace


d   - delete
c   - change
C   - change rest of line
S   - change rest of line
x   - delete letter
r   - replace letter

~   - swap case (UPPER/lower)
>   - indent
<   - dedent


u         - undo
ctrl + r  - redo
.         - repeat last command

## insert
i   - insert
a   - append
o   - new line

## macros
q<letter><command>...q - store a macro
<number>@<letter>      - repeat a macro
:reg <letter>...       - view macro
