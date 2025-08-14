// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// TODO が完了しているかどうかで見た目を変える
document.addEventListener("turbo:load", () => {
    document.querySelectorAll("form.todo").forEach(form => {
        const done = form.dataset.done === "true";
        form.style.backgroundColor = done ? "#bbb" : "";
    });

    document.querySelectorAll("input[id^='todo'][data-id]").forEach(checkbox => {
        updateTodoStyle(checkbox, false);

        checkbox.addEventListener("change", () => {
            updateTodoStyle(checkbox, true);
        });
    });
});

function updateTodoStyle(checkbox, updateDatabase) {
    const todo = checkbox.closest(".todo");
    if (!todo) return;
    todo.style.backgroundColor = checkbox.checked ? "#bbb" : "";

    const liItems = todo.querySelectorAll("li");
    liItems.forEach(li => {
        li.style.textDecoration = checkbox.checked ? "line-through" : "none";
    });

    if (!updateDatabase) return;

    const todoId = checkbox.dataset.id;
    const done = checkbox.checked;

    fetch(`/todos/${todoId}`, {
        method: "PATCH",
        headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
        },
        body: JSON.stringify({ todo: { done: done} })
    })
    .then(response => {
        if (!response.ok) throw new Error("更新失敗");
    })
    .catch(error => {
        alert("DB更新に失敗しました");
        checkbox.checked = !done;
        updateTodoStyle(checkbox);
    });
}
