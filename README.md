# HDI_NewStandardActions

A 4D **HDI** (How Do I) example demonstrating the standard actions available for **styled text areas** — toggling font attributes, picking colors and sizes, spell-checking, and computing/revealing dynamic 4D expressions, all without writing action-handling code.

## Overview

4D standard actions let a form object (typically a button) be wired directly to a built-in behavior via its `"action"` property: 4D handles triggering the action *and* automatically enables/disables the object depending on whether the action is valid in the current context. This example builds a toolbar of such buttons around a single styled-text area on `HDI2`, and also shows how to invoke the very same actions programmatically with `INVOKE ACTION`, and how to query their state with `Get action info`.

## Features

- **Styled-text standard actions** — `fontBold`, `fontItalic`, `fontUnderline`, `fontLinethrough`, `fontSize?value=...`, `color?value=...`, `backgroundColor?value=...`, plus the system pickers `font/showDialog`, `color/showDialog`, and `backgroundColor/showDialog`.
- **Expression actions** — `computeExpressions`, `freezeExpressions`, and `visibleReferences` to evaluate, freeze, or reveal dynamic 4D expressions embedded in the styled text.
- **Full spell-check action set** — `spell/enabled`, `spell/showDialog`, `spell/autoCorrectionEnabled`, `spell/autoLanguageEnabled`, `spell/learn`/`unLearn`, and related actions, all wired without custom code.
- **Programmatic invocation** — the `size9`–`size12` object methods call `INVOKE ACTION` directly (e.g. `ak font size+"?value=24pt"`) to show that any standard action can also be triggered from method code, not just from a button.
- **Action introspection** — `GetActionInfos` uses `Action info` to read each action's title, status, and enabled/visible state on `On Selection Change`, driving a live reference list of the actions on the current page.
- **Modern startup flow** — the splash screen (`00_Start`) uses `CALL WORKER`, a non-blocking `DIALOG(...;*)`, and window-reuse detection instead of spawning a new process or blocking on a modal dialog.
- **XLIFF localisation** — all user-facing menu, form, and message strings are externalised to `Resources/{lang}.lproj/*.xlf` (English and Japanese), grouped by purpose (menus, per-form, messages).
- **Dark mode & Liquid Glass** — `styleSheets.css` uses `"automatic"` colour values so text/controls adapt to light/dark mode; `styleSheets_mac.css` sizes buttons correctly for macOS Tahoe's Liquid Glass appearance as well as classic rendering.
- **Modern method declarations** — all methods use `#DECLARE`/`var` typing instead of legacy `C_*` directives, with subroutines and form-dependent methods marked `invisible` so only real entry points show up in the Run Method dialog.

## Points of Interest

| File | Why it's worth reading |
|------|-------------------------|
| `Project/Sources/Forms/HDI2/form.4DForm` | The full toolbar of styled-text standard-action buttons — the fastest way to see every `"action"` value in one place. |
| `Project/Sources/Forms/HDI2/ObjectMethods/size9-12.4dm` | Shows `INVOKE ACTION` called from code with `ak current form` as the target, an alternative to a button's declarative `"action"` property. |
| `Project/Sources/Methods/GetActionInfos.4dm` | `Action info` used to introspect a standard action's title/status/enabled/visible state at runtime. |
| `Project/Sources/Forms/HDI2/ObjectMethods/Button.4dm` | A contextual hierarchical menu mixing standard actions with one custom "revert" item, showing both mechanisms side by side. |
| `Project/Sources/Methods/00_Start.4dm` | The splash/startup pattern: worker dispatch, window reuse, non-blocking dialog. |
| `Project/Sources/styleSheets.css`, `styleSheets_mac.css` | Dark mode and Liquid Glass adaptation via form-theme/colour-scheme media queries. |
| `Resources/*.lproj/*.xlf` | XLIFF localisation structure (menus, per-form, messages), in English and Japanese. |

## Requirements

4D 21 or later (project mode, `.4DProject`).

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16 R3. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernised (syntax, localisation, dark mode) with the help of **GitHub Copilot**.

- **Blog post:** https://blog.4d.com/more-standard-actions-for-styled-text/
- **Original download:** https://downloads.4d.com/Demos/4D_v16_R3/HDI_NewStandardActions.zip

## References

- Standard actions overview: https://blog.4d.com/discover-and-use-standard-actions/
- Standard actions reference (4D doc center): https://doc.4d.com/4Dv16R3/4D/16-R3/Standard-actions.300-3230842.en.html
- `INVOKE ACTION`: https://developer.4d.com/docs/commands/invoke-action
- `Action info` (Get action info): https://developer.4d.com/docs/commands/action-info
- CSS in 4D (dark mode, Liquid Glass): https://developer.4d.com/docs/FormEditor/stylesheets
- XLIFF localisation: https://developer.4d.com/docs/Notions/localization
