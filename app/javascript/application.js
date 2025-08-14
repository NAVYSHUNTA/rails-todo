// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// TODO が完了しているかどうかで見た目を変える
document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".check-box").forEach(checkbox => {
        updateTodoStyle(checkbox);

        checkbox.addEventListener("change", () => {
            updateTodoStyle(checkbox);
        });
    });
});

function updateTodoStyle(checkbox) {
    const todo = checkbox.closest(".todo");
    if (!todo) return;
    todo.style.backgroundColor = checkbox.checked ? "#bbb" : "";

    const liItems = todo.querySelectorAll("li");
    liItems.forEach(li => {
        li.style.textDecoration = checkbox.checked ? "line-through" : "none";
    });
}
