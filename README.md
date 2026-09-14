# serialbench fixtures

The canonical benchmark documents. Every serialbench language harness — Ruby,
Python, C/C++ — measures these **byte-identical** files; only then are
cross-language numbers comparable.

- `{small,medium,large}.{xml,json,yaml,toml,html}` — the fifteen documents
- `schema.rng` — RelaxNG grammar covering all three XML shapes (validation benchmark)
- `transform.xsl` — XSLT 1.0 stylesheet over the same shapes (transform benchmark; leptris additionally supports XSLT 3.0)
- `SHA256SUMS` — integrity; harnesses may verify before running
- The `large` TOML fixture uses the first 1,000 records (the Ruby
  generator's documented subset); all other formats carry the full set

## Provenance

Generated once by `serialbench-ruby`'s `Serialbench::TestData` (commit-recorded)
and frozen. Sizes: small ~0.15–0.3KB, medium ~20–300KB, large ~0.3–4.4MB.

## Consuming

The Ruby harness reads them via its existing `test_data/{size}.{format}`
override (CI clones this repo to `test_data/`). Python and C harnesses locate
them via the `SERIALBENCH_FIXTURES` path or a shallow clone.

Do not edit the documents — regenerate + re-sum + note the change in history
instead, because any byte change resets cross-run comparability.
