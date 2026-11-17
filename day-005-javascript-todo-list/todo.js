// Simple To-Do List (command-line)
// Keeps a small list of tasks in an array and lets you add a task,
// list all tasks, mark one as done, or remove one.
//
// Usage:
//   node todo.js add "Buy milk"
//   node todo.js list
//   node todo.js done 1
//   node todo.js remove 2

// Each task is an object: { id, text, done }
let tasks = [
    { id: 1, text: "Revise Java inheritance notes", done: false },
    { id: 2, text: "Finish DBMS assignment", done: true },
    { id: 3, text: "Buy notebook", done: false },
];

function nextId() {
    // The next id is one more than the biggest id in use.
    return tasks.reduce((max, task) => Math.max(max, task.id), 0) + 1;
}

function listTasks() {
    if (tasks.length === 0) {
        console.log("No tasks yet. Add one with: node todo.js add \"your task\"");
        return;
    }
    console.log("Your tasks:");
    tasks.forEach((task) => {
        const mark = task.done ? "[x]" : "[ ]";
        console.log(`  ${task.id}. ${mark} ${task.text}`);
    });
}

function addTask(text) {
    if (!text) {
        console.log("Please give a task, e.g. node todo.js add \"Buy milk\"");
        return;
    }
    tasks.push({ id: nextId(), text: text, done: false });
    console.log(`Added task #${nextId() - 1}: "${text}"`);
    listTasks();
}

function markDone(id) {
    const task = tasks.find((t) => t.id === id);
    if (!task) {
        console.log(`No task with id ${id}.`);
        return;
    }
    task.done = true;
    console.log(`Done: "${task.text}"`);
    listTasks();
}

function removeTask(id) {
    const before = tasks.length;
    tasks = tasks.filter((t) => t.id !== id);
    if (tasks.length === before) {
        console.log(`No task with id ${id}.`);
        return;
    }
    console.log(`Removed task #${id}.`);
    listTasks();
}

// --- main: read the command from the command line ---
const command = process.argv[2];
const arg = process.argv[3];

if (command === "list") {
    listTasks();
} else if (command === "add") {
    addTask(arg);
} else if (command === "done") {
    markDone(Number(arg));
} else if (command === "remove") {
    removeTask(Number(arg));
} else {
    console.log("Usage:");
    console.log('  node todo.js list');
    console.log('  node todo.js add "task text"');
    console.log("  node todo.js done <id>");
    console.log("  node todo.js remove <id>");
}
