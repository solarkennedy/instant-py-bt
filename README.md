# instant-py-bt

[![Build Status](https://travis-ci.org/solarkennedy/instant-py-bt.svg?branch=master)](https://travis-ci.org/solarkennedy/instant-py-bt)

This is a script that will do whatever it takes to get python backtrace on a
running python process. To that end it will install whatever packages are
needed to get that done. It uses sudo to install those packages.

The script uses system packages and therefore is only supported on certain OSes
and certain python versions. See below for support details.

## Usage

```
$ py-bt PID
```

## Example

```
./py-bt 19302
Inspecting 19302 ...
Reading symbols from /usr/bin/python3.6...Reading symbols from /usr/lib/debug/.build-id/62/f45a63637adfb24578bf094814d28eb0cf8309.debug...done.
done.
Attaching to program: /usr/bin/python3.6, process 19302
Reading symbols from /lib/x86_64-linux-gnu/libpthread.so.0...Reading symbols from /usr/lib/debug/.build-id/4a/08084aa956dcb4ad3e4c2295b927f237767bfe.debug...done.
done.
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
Reading symbols from /lib/x86_64-linux-gnu/libdl.so.2...Reading symbols from /usr/lib/debug//lib/x86_64-linux-gnu/libdl-2.26.so...done.
done.
Reading symbols from /lib/x86_64-linux-gnu/libutil.so.1...Reading symbols from /usr/lib/debug//lib/x86_64-linux-gnu/libutil-2.26.so...done.
done.
Reading symbols from /lib/x86_64-linux-gnu/libexpat.so.1...(no debugging symbols found)...done.
Reading symbols from /lib/x86_64-linux-gnu/libz.so.1...(no debugging symbols found)...done.
Reading symbols from /lib/x86_64-linux-gnu/libm.so.6...Reading symbols from /usr/lib/debug//lib/x86_64-linux-gnu/libm-2.26.so...done.
done.
Reading symbols from /lib/x86_64-linux-gnu/libc.so.6...Reading symbols from /usr/lib/debug//lib/x86_64-linux-gnu/libc-2.26.so...done.
done.
Reading symbols from /lib64/ld-linux-x86-64.so.2...Reading symbols from /usr/lib/debug//lib/x86_64-linux-gnu/ld-2.26.so...done.
done.
0x00007fee1fed9817 in __GI___select (nfds=nfds@entry=0, readfds=readfds@entry=0x0, writefds=writefds@entry=0x0, 
    exceptfds=exceptfds@entry=0x0, timeout=timeout@entry=0x7ffcf2a43ef0) at ../sysdeps/unix/sysv/linux/select.c:41
41	../sysdeps/unix/sysv/linux/select.c: No such file or directory.
#0  0x00007fee1fed9817 in __GI___select (nfds=nfds@entry=0, readfds=readfds@entry=0x0, writefds=writefds@entry=0x0, 
    exceptfds=exceptfds@entry=0x0, timeout=timeout@entry=0x7ffcf2a43ef0) at ../sysdeps/unix/sysv/linux/select.c:41
#1  0x0000000000636342 in pysleep (secs=<optimized out>) at ../Modules/timemodule.c:1438
#2  time_sleep (self=<optimized out>, obj=<optimized out>) at ../Modules/timemodule.c:235
#3  0x00000000004c4add in _PyCFunction_FastCallDict (kwargs=0x0, nargs=1, args=0x7fee2108fe80, 
    func_obj=<built-in method sleep of module object at remote 0x7fee1fa41908>) at ../Objects/methodobject.c:209
#4  _PyCFunction_FastCallKeywords (
    func=func@entry=<built-in method sleep of module object at remote 0x7fee1fa41908>, 
    stack=stack@entry=0x7fee2108fe80, nargs=nargs@entry=1, kwnames=kwnames@entry=0x0)
    at ../Objects/methodobject.c:294
#5  0x000000000054f3c4 in call_function (pp_stack=pp_stack@entry=0x7ffcf2a44068, oparg=<optimized out>, 
    kwnames=kwnames@entry=0x0) at ../Python/ceval.c:4824
#6  0x0000000000553aaf in _PyEval_EvalFrameDefault (f=<optimized out>, throwflag=<optimized out>)
    at ../Python/ceval.c:3322
#7  0x000000000054e4c8 in PyEval_EvalFrameEx (throwflag=0, 
    f=Frame 0x7fee2108fcf8, for file ./py36-py-bt-itest.py, line 7, in level3 (level3='level3'))
    at ../Python/ceval.c:753
#8  _PyFunction_FastCall (co=<optimized out>, args=<optimized out>, nargs=nargs@entry=0, 
    globals=globals@entry={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}) at ../Python/ceval.c:4906
#9  0x000000000054f4f6 in fast_function (kwnames=0x0, nargs=0, stack=<optimized out>, 
    func=<function at remote 0x7fee210b3e18>) at ../Python/ceval.c:4941
#10 call_function (pp_stack=pp_stack@entry=0x7ffcf2a44208, oparg=<optimized out>, kwnames=kwnames@entry=0x0)
    at ../Python/ceval.c:4845
#11 0x0000000000553aaf in _PyEval_EvalFrameDefault (f=<optimized out>, throwflag=<optimized out>)
    at ../Python/ceval.c:3322
#12 0x000000000054e4c8 in PyEval_EvalFrameEx (throwflag=0, 
    f=Frame 0x7fee21123a48, for file ./py36-py-bt-itest.py, line 11, in level2 ()) at ../Python/ceval.c:753
#13 _PyFunction_FastCall (co=<optimized out>, args=<optimized out>, nargs=nargs@entry=0, 
    globals=globals@entry={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}) at ../Python/ceval.c:4906
#14 0x000000000054f4f6 in fast_function (kwnames=0x0, nargs=0, stack=<optimized out>, 
    func=<function at remote 0x7fee1fa3f510>) at ../Python/ceval.c:4941
#15 call_function (pp_stack=pp_stack@entry=0x7ffcf2a443a8, oparg=<optimized out>, kwnames=kwnames@entry=0x0)
    at ../Python/ceval.c:4845
#16 0x0000000000553aaf in _PyEval_EvalFrameDefault (f=<optimized out>, throwflag=<optimized out>)
    at ../Python/ceval.c:3322
#17 0x000000000054e4c8 in PyEval_EvalFrameEx (throwflag=0, 
    f=Frame 0x13c25c8, for file ./py36-py-bt-itest.py, line 15, in level1 ()) at ../Python/ceval.c:753
#18 _PyFunction_FastCall (co=<optimized out>, args=<optimized out>, nargs=nargs@entry=0, 
    globals=globals@entry={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}) at ../Python/ceval.c:4906
#19 0x000000000054f4f6 in fast_function (kwnames=0x0, nargs=0, stack=<optimized out>, 
    func=<function at remote 0x7fee1fa3f7b8>) at ../Python/ceval.c:4941
---Type <return> to continue, or q <return> to quit---#20 call_function (pp_stack=pp_stack@entry=0x7ffcf2a44548, oparg=<optimized out>, kwnames=kwnames@entry=0x0)
    at ../Python/ceval.c:4845
#21 0x0000000000553aaf in _PyEval_EvalFrameDefault (f=<optimized out>, throwflag=<optimized out>)
    at ../Python/ceval.c:3322
#22 0x000000000054efc1 in PyEval_EvalFrameEx (throwflag=0, 
    f=Frame 0x13b05c8, for file ./py36-py-bt-itest.py, line 19, in <module> ()) at ../Python/ceval.c:753
#23 _PyEval_EvalCodeWithName (_co=_co@entry=<code at remote 0x7fee1faa0270>, 
    globals=globals@entry=<code at remote 0x7fee1faa0270>, locals=locals@entry=< at remote 0x7fee210e1270>, 
    args=args@entry=0x0, argcount=argcount@entry=0, kwnames=kwnames@entry=0x0, kwargs=0x0, kwcount=0, kwstep=2, 
    defs=0x0, defcount=0, kwdefs=0x0, closure=0x0, name=0x0, qualname=0x0) at ../Python/ceval.c:4153
#24 0x000000000054ff73 in PyEval_EvalCodeEx (closure=0x0, kwdefs=0x0, defcount=0, defs=0x0, kwcount=0, kws=0x0, 
    argcount=0, args=0x0, locals=locals@entry=< at remote 0x7fee210e1270>, 
    globals=globals@entry=<code at remote 0x7fee1faa0270>, _co=_co@entry=<code at remote 0x7fee1faa0270>)
    at ../Python/ceval.c:4174
#25 PyEval_EvalCode (co=co@entry=<code at remote 0x7fee1faa0270>, 
    globals=globals@entry={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}, 
    locals=locals@entry={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}) at ../Python/ceval.c:730
#26 0x000000000042b3c9 in run_mod (arena=0x7fee210e1270, flags=0x7ffcf2a4485c, 
    locals={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}, 
    globals={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}, filename='./py36-py-bt-itest.py', mod=0x1423e80)
    at ../Python/pythonrun.c:980
#27 PyRun_FileExFlags (fp=0x14158d0, filename_str=<optimized out>, start=<optimized out>, 
    globals={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}, 
    locals={'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <SourceFileLoader(name='__main__', path='./py36-py-bt-itest.py') at remote 0x7fee2108de48>, '__spec__': None, '__annotations__': {}, '__builtins__': <module at remote 0x7fee21148638>, '__file__': './py36-py-bt-itest.py', '__cached__': None, 'time': <module at remote 0x7fee1fa41908>, 'level3': <function at remote 0x7fee210b3e18>, 'level2': <function at remote 0x7fee1fa3f510>, 'level1': <function at remote 0x7fee1fa3f7b8>}, closeit=1, flags=0x7ffcf2a4485c) at ../Python/pythonrun.c:933
#28 0x000000000042b5b5 in PyRun_SimpleFileExFlags (fp=0x14158d0, filename=<optimized out>, closeit=1, 
    flags=0x7ffcf2a4485c) at ../Python/pythonrun.c:396
#29 0x000000000044182b in run_file (p_cf=0x7ffcf2a4485c, filename=0x13684b0 L"./py36-py-bt-itest.py", fp=0x14158d0)
    at ../Modules/main.c:338
#30 Py_Main (argc=argc@entry=2, argv=argv@entry=0x1367260) at ../Modules/main.c:809
#31 0x0000000000421f64 in main (argc=2, argv=<optimized out>) at ../Programs/python.c:69

---Type <return> to continue, or q <return> to quit---=============

Unable to read information on python frame

=============

   2    import time
   3    
   4    def level3():
   5        while True:
   6            level3="level3"
  >7            time.sleep(1)
   8    
   9    
  10    def level2():
  11        level3()
  12    

=============

Traceback (most recent call first):
  <built-in method sleep of module object at remote 0x7fee1fa41908>
  File "./py36-py-bt-itest.py", line 7, in level3
    time.sleep(1)
  File "./py36-py-bt-itest.py", line 11, in level2
    level3()
  File "./py36-py-bt-itest.py", line 15, in level1
    level2()
  File "./py36-py-bt-itest.py", line 19, in <module>
    level1()
A debugging session is active.

	Inferior 1 [process 19302] will be detached.

Quit anyway? (y or n) [answered Y; input not from terminal]
Detaching from program: /usr/bin/python3.6, process 19302
```

## OS Support

- [X] Ubuntu 17.10 (Python 2.7/3.6) (GDB 8.0)
- [X] Ubuntu 16.04 (Python 2.7/3.4) (GDB 7.7)
- [X] Ubuntu 14.04 (Python 2.7/3.4) (GDB 7.7)
- [ ] Ubuntu 12.04 (Python 2.7/3.2) (GDB 7.1)
- [ ] Ubuntu 10.04 (Python 2.6/3.1) (GDB 7.1)

## Python Environment Support

- [X] Non-virtualenv
- [X] Virtualenv
- [X] [dh-virtualenv](https://github.com/spotify/dh-virtualenv)
- [ ] Python processes in docker
