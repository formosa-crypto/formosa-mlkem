lemma oops: true.
proof.
  (*does_not_exist does not exist.*)
  print does_not_exist.
  (*But rewriting it with ? does not raise an issue.*)
  rewrite ?does_not_exist.
  (*Annoying because it can be hard to detect a misspel of a lemma used in rewrite ?_.*)
  done.
qed.
