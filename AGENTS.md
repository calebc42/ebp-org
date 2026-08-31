# ebp-org implementation guide

- Keep the engine independent of Jetpacs and downstream applications.
- Use only Emacs/Org built-ins plus the public `ebp-path` sandbox.
- Builders return data and mutation functions return explicit outcomes; do not
  introduce UI, renderer, or product navigation policy.
- Preserve root containment, bounded scans, cache invalidation, encryption
  safety, and no-prompt behavior with focused ERT coverage.
- Compile into a temporary directory and preserve neighboring user artifacts.

Run `test/run-tests.sh` before handing off changes.
