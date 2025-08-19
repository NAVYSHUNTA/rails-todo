// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// TODO の進捗状況と背景色の対応表
const bgColors = {
    wait: "lightblue",
    doing: "#ffd150",
    done: "#bbb",
};

// TODO の進捗状況に応じて見た目を変える
document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".todo").forEach(todo => {
        updateTodoStyle(todo);

        const statusSelect = todo.querySelector("select[name='todo[status]']");
        if (!statusSelect) return;
        statusSelect.addEventListener("change", (event) => {
            const status = event.target.value;
            todo.dataset.status = status;
            updateTodoStyle(todo);
        });
    });
});

function updateTodoStyle(todo) {
    const status = todo.dataset.status || "wait";
    todo.style.backgroundColor = bgColors[status];
    const liItems = todo.querySelectorAll("li");
    liItems.forEach(li => {
        li.style.textDecoration = status === "done" ? "line-through" : "none";
    });
}

// 編集時に Enter による submit を無効化する
document.addEventListener("turbo:load", () => {
    const form = document.querySelector("form");
    form.addEventListener("keydown", (event) => {
        if (event.key === "Enter" && event.target.tagName === "INPUT" && event.target.type !== "submit") {
            event.preventDefault();
        }
    });
});
