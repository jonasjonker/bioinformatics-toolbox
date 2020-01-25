# Vim basics

Vim is a powerfull command line text editor that is installed on most linux
systems and is available for windows and mac.
The power of Vim lies in the fact that it is very _good at editing_ files.

_In this document keystrokes will be indicated like this:_ [**ESC**] _in case of
specific keys, or like_ [**\<somekey>**] _for general cases. key combinations will be represented like_ [**dd**] _or like_ [**CTRL**+**r**] _to prevent ambiguity._

###### switch mode

|  modes  | key       |
|    ---: | :---      |
| normal  | [**ESC**] |
| command | [**:**]   |
| editing | [**i**]   |
| visual  | [**v**]   |

What can be confusing for beginners is that you start in _normal mode_, but that
*you can't write text in normal mode.* This might seem weird at first, it is actually quite usefull, since editing is mostly done in _normal mode_. Before we dive into how _normal_ mode works

###### usefull commands

|  command          | key combo |
|    ---:           | :---      |
| quit              | [**:q**]  |
| save              | [**:w**]  |
| save & quit       | [**:wq**] |
| quit without save | [**:q!**] |


## movement
###### relative position

|  unit           | left      | down      | up        | right     |
|    ---:         | ---       | ---       | ---       | ---       |
| character       | [**h**]   | [**j**]   | [**k**]   | [**l**]   |
| Word (start)    | [**b**]   |           |           | [**w**]   |
| Word (end)      | [**e**]   |           |           | [**ge**]  |
| line            | [**^**]   |           |           | [**$**]   |
| file            |           | [**gg**]  | [**G**]   |           |
| sentence        |           | [**(**]   | [**)**]   |           |
| paragraph       |           | [**{**]   | [**}**]   |           |
| section (start) |           | [**\[\[**]| [**\]\]**]|           |
| section (end)   |           | [**\[\]**]| [**\]\[**]|           |
| next bracket    |           | [**%**]   | [**%**]   |           |

The power of vim is that movements can be combined numbers and commands.
For example:
```Vim
20j " will move you down 20 line
d4w " will delete 4 words to your right.
c2{ " will delete the next 2 paragraphs. 
```

###### abolute position

|  position       | key       |
|    ---:         | ---       |
| bottom screen   | [**L**]   |
| middel screen   | [**M**]   |
|  top screen     | [**L**]   |
| middle line     | [**zz**]  |

###### specific position

|  specified ...  | next      |  previous |  repeat   |
|    ---:         | ---       | ---       | ---       |
| character       | [**t**]   | [**f**]   | [**;**]   |
| string          | [**/**]   | [**?**]   | [**n**]   |
| selection       | [**\***]  | [**#**]   | [**n**]   |
| line            | [**:\<number>**]  |   |           |

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
