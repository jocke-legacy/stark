stark fs
========

Author: jocke-l
Date: 14-05-2013

Daft 0.1

## Concept
The basic concept of stark fs is to natively handle files with
tags instead of a directory hierarky. All files /need/ to be
indexed as fast as posible.

The current thought of how this would be done is to let the
driver lexically order the tags, hash them and look them
up in a hashtable, which contains a pointer on the disk where
the file is saved. This way, there is really no search time
in the file register, so the driver can almost immediately
begin to transfer a file (or metadata) to memory as soon it
knows which tags it should look for.

