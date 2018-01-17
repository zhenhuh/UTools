;;;= Update hot keys
;;=
.upalias = %_META%\make_alias.bat

;;;= Register scripts under UTOOLS to hot keys
;;=
;= Append tools to register file
.reg = %_META_IMPL%\regtools.bat $1

;= Re-register all custom tools
.rereg = %_META_IMPL%\regtools.bat 1


;;;= Save current dir & go back
;;=
push = %_META_IMPL%\pushdir.bat
pop  = %_META_IMPL%\popdir.bat


;;;= Abbreviation for command
;;=
c  = cls
t  = type $*


;;;= Quick folder ops
;;=
.   = start .
..  = cd ..
... = cd ../..
\   = cd \
cd  = cd /d "$*"


;;;= Misc.
;= Copy inputs to clipboard
cc = echo | set /p=$* | clip


;;;= Git alias
;;=
gs = git status
gc = git commit
gd = git diff $*
ga = git add $*


;;;= Bash command alias
;;=
ll = ls -alF --show-control-chars --color
lf = ls */ -ld --show-control-chars --color
