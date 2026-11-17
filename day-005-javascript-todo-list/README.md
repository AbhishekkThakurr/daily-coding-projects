# Simple To-Do List (JavaScript)

A small command-line to-do list. Tasks live in an array of objects, and you can add a task, list all tasks, mark one as done, or remove one.

## Concepts

- Arrays of objects (`{ id, text, done }`)
- `Array.find()` to look up a task by id and `Array.filter()` to remove one
- `Array.reduce()` to work out the next free id
- `process.argv` to read the command from the command line
- Functions and `if / else if` branching

## How it works

The program reads the command (`list`, `add`, `done`, `remove`) from `process.argv[2]` and the extra argument (task text or id) from `process.argv[3]`, then calls the matching function. Each task has an `id`, some `text`, and a `done` flag shown as `[x]` or `[ ]`.

## How to run

```bash
node todo.js list
node todo.js add "Practise SQL joins"
node todo.js done 1
node todo.js remove 2
```

## Sample run

```
$ node todo.js list
Your tasks:
  1. [ ] Revise Java inheritance notes
  2. [x] Finish DBMS assignment
  3. [ ] Buy notebook

$ node todo.js add "Practise SQL joins"
Added task #4: "Practise SQL joins"
Your tasks:
  1. [ ] Revise Java inheritance notes
  2. [x] Finish DBMS assignment
  3. [ ] Buy notebook
  4. [ ] Practise SQL joins

$ node todo.js done 1
Done: "Revise Java inheritance notes"
Your tasks:
  1. [x] Revise Java inheritance notes
  2. [x] Finish DBMS assignment
  3. [ ] Buy notebook

$ node todo.js remove 2
Removed task #2.
Your tasks:
  1. [ ] Revise Java inheritance notes
  3. [ ] Buy notebook
```
