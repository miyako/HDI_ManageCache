# HDI_ManageCache

A 4D v16 **HDI** (How Do I) binary database demonstrating programmatic capabilities of the cache manager, converted to a 4D project using 4D 21. The codebase was then updated and cleaned up with the help of **GitHub Copilot**.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool.

- **Blog post:** [Boost your performance with the new cache manager](https://blog.4d.com/boost-performances-new-cache-manager/)
- **Original download:** [HDI_ManageCache.zip](https://download.4d.com/Demos/4D_v16/HDI_ManageCache.zip)

## Branches

Each branch represents a distinct modernisation effort, guided by a corresponding Copilot instruction file.

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-xliff-localisation-fix`](../../tree/miyako-xliff-localisation-fix) | XLIFF localisation fixes | [localisation.instructions.md](.github/copilot/instructions/localisation.instructions.md) |
| [`miyako-modernize-c-var-syntax`](../../tree/miyako-modernize-c-var-syntax) | Modernize c_* declarations to var syntax | [variable.declarations.instructions.md](.github/copilot/instructions/variable.declarations.instructions.md) |
| [`miyako-solid-pancake`](../../tree/miyako-solid-pancake) | Migrate menu bar to use standard actions | [menu.instructions.md](.github/copilot/instructions/menu.instructions.md) |
| [`miyako-psychic-giggle`](../../tree/miyako-psychic-giggle) | Hide methods in Run Method dialog | [method.visibility.instructions.md](.github/copilot/instructions/method.visibility.instructions.md) |
| [`miyako-supreme-journey`](../../tree/miyako-supreme-journey) | Modernise startup dialog | [startup.instructions.md](.github/copilot/instructions/startup.instructions.md) |
| [`miyako-dark-mode-liquid-glass-css`](../../tree/miyako-dark-mode-liquid-glass-css) | Dark mode + liquid glass CSS styling | [css.instructions.md](.github/copilot/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/copilot/instructions/tahoe.css.instructions.md) |

## Copilot Token Usage

| Session | Branch | Model(s) | Input Tokens | Output Tokens | Turns |
|---------|--------|----------|-------------:|--------------:|------:|
| Xliff localisation fixes | `miyako-xliff-localisation-fix` | Claude Sonnet 5 | 2,902,652 | 25,287 | 36 |
| Modernize c_* var syntax | `miyako-modernize-c-var-syntax` | Claude Sonnet 5 | 3,125,417 | 16,371 | 46 |
| Menu bar standard actions | `miyako-solid-pancake` | Claude Sonnet 5 | 1,168,893 | 6,981 | 22 |
| Hide methods in Run Method dialog | `miyako-psychic-giggle` | Claude Haiku 4.5 | 2,268,375 | 12,102 | 50 |
| Modernise startup dialog | `miyako-supreme-journey` | Claude Sonnet 5 | 5,576,684 | 32,121 | 70 |
| Dark mode + glass CSS | `miyako-dark-mode-liquid-glass-css` | Claude Sonnet 5 | 8,465,323 | 34,035 | 76 |
| **Total** | | | **23,507,344** | **126,897** | **300** |

## Model Selection Assessment

All sessions in this project used Sonnet 5 or Haiku 4.5 -- no Opus was used. This is an appropriate model mix for a project consisting entirely of well-scoped, instruction-driven modernisation tasks.

The method visibility session used Haiku 4.5, which was a good fit for this trivial property-setting task. The remaining sessions used Sonnet 5, appropriate for moderate tasks like XLIFF generation, mechanical refactors, menu migrations, CSS styling, and startup dialog updates.

The startup dialog (5.6M input, 70 turns) and dark mode (8.5M input, 76 turns) sessions had high turn counts, suggesting iterative refinement -- but Sonnet 5 was still the right tier for these instruction-guided tasks.

**Recommendation:** Continue using Sonnet 5 as the default for this project. Haiku 4.5 is viable for trivial property edits (method visibility, simple JSON attribute changes).

## Screenshots
