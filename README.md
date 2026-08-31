# ebp-org

Reusable, Jetpacs-independent Org engine used by EBP applications.  It owns
safe Org references, token resolution, bounded queries, cache invalidation,
capture/mutation primitives, and the shared Org model.  It is not part of the
EBP wire protocol.

The only non-built-in dependency is `ebp-path` from the neighboring
[`ebp.el`](../ebp.el) repository.

```sh
test/run-tests.sh
```

Set `EBP_EL_DIR` if `ebp.el` is not checked out at `../ebp.el`.
