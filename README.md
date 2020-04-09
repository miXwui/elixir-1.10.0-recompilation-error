# Elixir 1.10.0 - 1.10.2 recompilation error

## Summary

Start `iex -S mix`, edit _module.ex_ and save, run `r(Servy.Handler)` first, and then `recompile()`. Results in error. Subsequent `recompile()` will keep erroring.

Running `recompile(force: true)` works.

No issue on Elixir 1.9.4.  
Bug on:

- 1.10.0
- 1.10.1
- 1.10.2

## Repro Steps

1. `iex -S mix`
2. Edit and save _/lib/servy/module.ex_ like so:

    ```diff
    - %{conv | resp_body: "Edit me"}
    + %{conv | resp_body: "Edited"}
    ```

3. `iex> r(Servy.Handler)`
4. `iex> recompile()`

Below is output/error:

```bash
iex -S mix
Erlang/OTP 22 [erts-10.7] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Compiling 2 files (.ex)
Interactive Elixir (1.10.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> r(Servy.Handler)
warning: redefining module Servy.Handler (current version loaded from _build/dev/lib/servy/ebin/Elixir.Servy.Handler.beam)
  lib/servy/handler.ex:1

{:reloaded, Servy.Handler, [Servy.Handler]}
iex(2)> recompile()
Compiling 1 file (.ex)
** (File.Error) could not read file "": no such file or directory
    (elixir 1.10.1) lib/file.ex:353: File.read!/1
    (elixir 1.10.1) lib/kernel/parallel_compiler.ex:406: anonymous fn/2 in Kernel.ParallelCompiler.checker_runtime_modules/1
    (elixir 1.10.1) lib/enum.ex:2111: Enum."-reduce/3-lists^foldl/2-0-"/3
    (elixir 1.10.1) lib/kernel/parallel_compiler.ex:403: Kernel.ParallelCompiler.checker_runtime_modules/1
    (elixir 1.10.1) lib/kernel/parallel_compiler.ex:388: Kernel.ParallelCompiler.maybe_check_modules/3
    (elixir 1.10.1) lib/kernel/parallel_compiler.ex:359: Kernel.ParallelCompiler.write_and_verify_modules/4
    (elixir 1.10.1) lib/kernel/parallel_compiler.ex:144: Kernel.ParallelCompiler.spawn_workers/3
    (mix 1.10.1) lib/mix/compilers/elixir.ex:195: Mix.Compilers.Elixir.compile_manifest/9
```
