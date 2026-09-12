![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_ManageCache

Programmatic control of the 4D data cache manager -- reading, resizing, tuning and flushing the cache at runtime. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v16**; converted from the binary `.4DB` to the `.4DProject` architecture so it runs on current 4D releases.

## What it demonstrates

- Reading the current cache size at runtime with `Get cache size`.
- Resizing the cache on the fly with `SET CACHE SIZE`, including an optional unload-minimum-size argument.
- Reading and writing the unload minimum size and flush periodicity through `Get database parameter` / `SET DATABASE PARAMETER`.
- Forcing cached data to disk with `FLUSH CACHE`, either wholesale or freeing a chosen number of bytes.
- Inspecting detailed cache statistics with `Cache info` and rendering them as JSON.
- Branching behaviour by engine architecture: several cache commands are 64-bit only, so the form detects the running version and enables/disables controls accordingly.

## Key commands

| Command | Used for |
|---|---|
| `Get cache size` | Reading the current cache size at form load |
| `SET CACHE SIZE` | Resizing the cache (64-bit only), optionally setting the unload minimum |
| `Get database parameter` | Reading `Cache unload minimum size` and `Cache flush periodicity` |
| `SET DATABASE PARAMETER` | Writing the flush periodicity and (32-bit) unload minimum size |
| `Cache info` | Retrieving detailed cache statistics (64-bit only) |
| `FLUSH CACHE` | Writing cached data to disk, wholesale or by a byte amount |

## How it works

The startup method `Project/Sources/Methods/00_Start.4dm` opens the standard `HDI` splash form; its `BtnDemo` object method opens the real demo form `HDI2` in a dialog.

`Project/Sources/Forms/HDI2/method.4dm` is where the interesting work happens. On `On Load` it detects the engine architecture with `Version type` against `64 bit version`. On 64-bit it hides the `Warning@` objects; on 32-bit it disables every `64@` object, because `SET CACHE SIZE` and `Cache info` do not exist there. It then reads the current settings into form variables: `vSize` from `Get cache size`, `vMinUnload` from `Get database parameter(Cache unload minimum size)`, and `vFlushPer` from `Get database parameter(Cache flush periodicity)`, converting byte values to MB for display.

Each button carries a one-line object method:

- `64_Button.4dm` -- `SET CACHE SIZE(vSize*1024*1024)` resizes the cache.
- `Button4.4dm` -- sets the unload minimum size; on 64-bit via the second argument of `SET CACHE SIZE`, on 32-bit via `SET DATABASE PARAMETER(Cache unload minimum size)`.
- `Button1.4dm` -- `SET DATABASE PARAMETER(Cache flush periodicity; vFlushPer)`.
- `64_Button2.4dm` -- `Cache info` into an object, then `JSON Stringify` into `vCacheInfos` for display.
- `Button6.4dm` -- `FLUSH CACHE(vValToFree)` frees a chosen number of bytes; `Button7.4dm` -- `FLUSH CACHE` with no argument writes the whole cache.

Start with `HDI2/method.4dm` to see the architecture split, then read the button methods to see each individual cache call.

## Points of interest

- `SET CACHE SIZE` and `Cache info` are 64-bit only. The demo does not error on 32-bit; it disables the `64@` controls up front and routes the unload-minimum setting through `SET DATABASE PARAMETER` instead.
- `Cache flush periodicity` is volatile -- the comment in `Button1.4dm` and the `HDI2_TxtValueLostAtRestart` label both flag that the value is lost on restart.
- The `FLUSH BUFFER` command was renamed `FLUSH CACHE`; the source comments preserve that history.
- `Get cache size` returns bytes; the form divides by `1024*1024` for the MB fields and multiplies back before each call.

## Modernisation notes

Converted from the 4D v16 binary `.4DB` to the `.4DProject` architecture. Each branch below is an isolated modernisation step.

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-xliff-localisation-fix`](../../tree/miyako-xliff-localisation-fix) | XLIFF localisation fixes | [localisation.instructions.md](.github/instructions/localisation.instructions.md) |
| [`miyako-modernize-c-var-syntax`](../../tree/miyako-modernize-c-var-syntax) | Modernize c_* declarations to var syntax | [variable.declarations.instructions.md](.github/instructions/variable.declarations.instructions.md) |
| [`miyako-solid-pancake`](../../tree/miyako-solid-pancake) | Migrate menu bar to use standard actions | [menu.instructions.md](.github/instructions/menu.instructions.md) |
| [`miyako-psychic-giggle`](../../tree/miyako-psychic-giggle) | Hide methods in Run Method dialog | [method.visibility.instructions.md](.github/instructions/method.visibility.instructions.md) |
| [`miyako-supreme-journey`](../../tree/miyako-supreme-journey) | Modernise startup dialog | [startup.instructions.md](.github/instructions/startup.instructions.md) |
| [`miyako-dark-mode-liquid-glass-css`](../../tree/miyako-dark-mode-liquid-glass-css) | Dark mode + liquid glass CSS styling | [css.instructions.md](.github/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/instructions/tahoe.css.instructions.md) |

## References

- [4D blog: Boost your performance with the new cache manager](https://blog.4d.com/boost-performances-new-cache-manager/)
- [4D documentation: SET CACHE SIZE](https://developer.4d.com/docs/commands/set-cache-size)
- [4D documentation: Cache info](https://developer.4d.com/docs/commands/cache-info)
- [4D documentation: FLUSH CACHE](https://developer.4d.com/docs/commands/flush-cache)
- [4D documentation: SET DATABASE PARAMETER](https://developer.4d.com/docs/commands/set-database-parameter)
- Original download: [HDI_ManageCache.zip](https://download.4d.com/Demos/4D_v16/HDI_ManageCache.zip)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="360" height="352" alt="Screenshot 2026-07-23 at 13 20 14" src="https://github.com/user-attachments/assets/2c169183-2c5d-4213-a7fe-c55bcb8d8f45" />
<img width="720" height="572" alt="Screenshot 2026-07-23 at 13 20 17" src="https://github.com/user-attachments/assets/7b0caedf-9df4-4cce-bed1-dc542158b1b3" />
<img width="720" height="572" alt="Screenshot 2026-07-23 at 13 20 28" src="https://github.com/user-attachments/assets/fb8a5c63-1c23-4b7c-8076-8ba821a97ccf" />
