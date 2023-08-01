---
layout: default
title: Practice Challenge 01
---

# Practice Challenge 01: Buffer Overflow

## Description

This is a simple buffer overflow challenge. Can you exploit it?

## Challenge

Here's the vulnerable code:

```c
#include <stdio.h>
#include <string.h>

void vulnerable_function(char* string) {
    char buffer[100];
    strcpy(buffer, string);
}

int main(int argc, char** argv) {
    vulnerable_function(argv[1]);
    return 0;
}
```

### Hints

Think about what happens when you provide input that is longer than the buffer.
