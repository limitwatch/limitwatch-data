# LimitWatch data

LimitWatch tracks the usage limits and prices of AI coding plans and logs every change with a date, the old and new values, and a link to the vendor's source. The site is [codingplanlimits.com](https://codingplanlimits.com).

This repo holds the same data as JSON. It covers 13 plans from Anthropic (Claude Pro, Max 5x, Max 20x, Team), OpenAI (ChatGPT Go, Plus, Pro), Cursor (Pro, Pro+, Ultra), Z.ai (GLM Coding Plan), Moonshot (Kimi Code) and X (the X subscription that includes Grok).

## Files

- `api/plans.json` lists every plan with its price, its limits as the vendor publishes them, and the date we last checked it.
- `api/changes.json` is the change log. Each entry has the date, the plan, the old value, the new value and the source URL.
- `scripts/sync.sh` copies fresh JSON from the site build into `api/`.

The live versions are on the site, and they update before this repo does:

- https://codingplanlimits.com/api/plans.json
- https://codingplanlimits.com/api/changes.json

```js
const res = await fetch("https://codingplanlimits.com/api/changes.json");
const changes = await res.json();
```

When a vendor doesn't publish a figure, the value says "not published" or starts with "unknown". We don't guess numbers.

## Badges

Each plan has an SVG badge that shows when its limits last changed. Put this in a README or web page:

```markdown
[![Claude Max 5x limits](https://codingplanlimits.com/badge/claude-max-5x.svg)](https://codingplanlimits.com/plans/claude-max-5x/)
```

Swap `claude-max-5x` for another plan id from `plans.json`. The [embed page](https://codingplanlimits.com/embed/) has the full list and HTML versions.

## How we collect and check the data

Every value comes from the vendor's own pricing page, docs, changelog or an official post by a staff member. A script checks those pages once a day. When one changes, we confirm the new value against the source before we update the site and add an entry to `changes.json`. Each entry links to the page it came from, so you can check it yourself.

If you spot a mistake, open an issue with a link to the vendor's source.

## License

The data in this repo is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). You can copy, change and use it, including commercially. Credit LimitWatch with a link to https://codingplanlimits.com, for example:

```
Data: LimitWatch (https://codingplanlimits.com), CC BY 4.0
```

The full license text is in [LICENSE](LICENSE).
